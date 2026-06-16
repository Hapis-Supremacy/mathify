package com.mathify.rest;

import com.mathify.model.Course;
import com.mathify.model.CourseCardView;
import com.mathify.service.CourseService;
import com.mathify.rest.filter.Secured;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

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
}
