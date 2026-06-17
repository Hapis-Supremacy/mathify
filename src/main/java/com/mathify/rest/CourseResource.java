package com.mathify.rest;

import com.mathify.dao.CourseDAO;
import com.mathify.model.Course;
import com.mathify.model.CourseCardView;
import com.mathify.rest.dto.response.CourseNode;
import com.mathify.rest.dto.response.ErrorResponse;
import com.mathify.rest.dto.response.LearningPathResponse;
import com.mathify.rest.dto.response.PrereqEdgeResponse;
import com.mathify.rest.dto.response.PrereqGraphResponse;
import com.mathify.service.CourseService;
import com.mathify.rest.filter.Secured;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import com.mathify.dao.ChapterDAO;
import com.mathify.dao.CourseDAO;
import com.mathify.model.Chapter;
import com.mathify.rest.dto.request.ChapterInput;
import com.mathify.rest.dto.request.CourseInput;
import com.mathify.rest.filter.AdminSecured;
import jakarta.validation.Valid;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Path("/courses")
@Produces(MediaType.APPLICATION_JSON)
public class CourseResource {

    @Inject
    private CourseService courseService;

    @Inject
    private CourseDAO courseDAO;

    @Inject
    private ChapterDAO chapterDAO;

    @GET
    public List<CourseCardView> getAllCourses() {
        return courseService.getAllCourses();
    }

    /**
     * Course prerequisite paths — the skill-tree wiring between courses.
     *
     * <pre>
     *   GET /api/courses/paths
     *     -> { nodes: [...], edges: [ {from: prereqId, to: courseId} ] }   // whole DAG
     *   GET /api/courses/paths?courseId=X
     *     -> { target: X, path: [...] }                                    // ordered path to X
     * </pre>
     *
     * Public catalog data — no auth. The literal {@code /paths} segment is matched
     * ahead of the {@code /{id}} template below, so it never collides.
     */
    @GET
    @Path("/paths")
    public Response paths(@QueryParam("courseId") String courseId) {
        if (courseId != null && !courseId.isBlank()) {
            String target = courseId.strip();
            List<CourseCardView> path = courseService.getPrerequisitePath(target);
            if (path.isEmpty()) {
                return Response.status(Response.Status.NOT_FOUND)
                        .entity(new ErrorResponse("course_not_found", null)).build();
            }
            return Response.ok(new LearningPathResponse(target, toNodes(path))).build();
        }

        List<PrereqEdgeResponse> edges = new ArrayList<>();
        for (CourseDAO.PrereqEdge e : courseService.getAllPrerequisites()) {
            // edge reads "complete <from> before <to>"
            edges.add(new PrereqEdgeResponse(e.prerequisiteId(), e.courseId()));
        }
        return Response.ok(new PrereqGraphResponse(toNodes(courseService.getAllCourses()), edges)).build();
    }

    @GET
    @Path("/{id}")
    @Secured
    public Response getCourse(@PathParam("id") String id) {
        Course course = courseService.getCourse(id);
        if (course == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(course).build();
    }

    // --- Admin Course Endpoints ---

    @POST
    @AdminSecured
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createCourse(@Valid CourseInput input) {
        String courseId = UUID.randomUUID().toString();
        Course course = new Course();
        course.setCourseId(courseId);
        course.setTitle(input.title());
        course.setDescription(input.description());
        course.setCategory(input.category());
        
        List<Course> prereqs = new ArrayList<>();
        if (input.prerequisite() != null) {
            for (String p : input.prerequisite()) {
                Course pr = new Course();
                pr.setCourseId(p);
                prereqs.add(pr);
            }
        }
        course.setPrerequisite(prereqs);
        course.setChapters(new ArrayList<>());
        
        try {
            courseDAO.insert(course);
            Course created = courseDAO.findCourse(courseId);
            return Response.status(Response.Status.CREATED).entity(created).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    @PUT
    @Path("/{id}")
    @AdminSecured
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateCourse(@PathParam("id") String id, @Valid CourseInput input) {
        try {
            Course existing = courseDAO.findCourse(id);
            if (existing == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            courseDAO.update(id, input.title(), input.description(), input.category());
            // Prerequisite update is omitted for simplicity unless requested
            Course updated = courseDAO.findCourse(id);
            return Response.ok(updated).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    @DELETE
    @Path("/{id}")
    @AdminSecured
    public Response deleteCourse(@PathParam("id") String id) {
        try {
            if (courseDAO.findCourse(id) == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            courseDAO.delete(id);
            return Response.noContent().build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    // --- Admin Chapter Endpoints ---

    @POST
    @Path("/{courseId}/chapters")
    @AdminSecured
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createChapter(@PathParam("courseId") String courseId, @Valid ChapterInput input) {
        try {
            if (courseDAO.findCourse(courseId) == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            String chapterId = UUID.randomUUID().toString();
            Chapter chapter = new Chapter(chapterId, input.title(), "", 0);
            chapter.setModules(new ArrayList<>());
            chapter.setQuizzes(new ArrayList<>());
            int order = input.order() != null ? input.order() : 0;
            chapterDAO.insert(courseId, chapter, order);
            
            Chapter created = chapterDAO.findById(chapterId);
            return Response.status(Response.Status.CREATED).entity(created).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    @PUT
    @Path("/{courseId}/chapters/{chapterId}")
    @AdminSecured
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateChapter(@PathParam("courseId") String courseId, @PathParam("chapterId") String chapterId, @Valid ChapterInput input) {
        try {
            Chapter existing = chapterDAO.findById(chapterId);
            if (existing == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            chapterDAO.update(chapterId, input.title(), existing.getDescription(), existing.getXpReward());
            // Assuming order update is handled or ignored for now
            return Response.ok(chapterDAO.findById(chapterId)).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    @DELETE
    @Path("/{courseId}/chapters/{chapterId}")
    @AdminSecured
    public Response deleteChapter(@PathParam("courseId") String courseId, @PathParam("chapterId") String chapterId) {
        try {
            if (chapterDAO.findById(chapterId) == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            chapterDAO.delete(chapterId);
            return Response.noContent().build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    private static List<CourseNode> toNodes(List<CourseCardView> courses) {
        List<CourseNode> nodes = new ArrayList<>(courses.size());
        for (CourseCardView c : courses) {
            nodes.add(new CourseNode(
                    c.getId(),
                    c.getTitle(),
                    c.getTrack(),
                    c.getLevelNum(),
                    c.getColor(),
                    c.getGlyph() != null ? c.getGlyph() : ""));
        }
        return nodes;
    }
}
