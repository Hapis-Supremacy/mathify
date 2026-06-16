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

import java.util.ArrayList;
import java.util.List;

@Path("/courses")
@Produces(MediaType.APPLICATION_JSON)
public class CourseResource {

    @Inject
    private CourseService courseService;

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
