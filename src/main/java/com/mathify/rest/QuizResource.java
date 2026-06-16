package com.mathify.rest;

import com.mathify.model.Quiz;
import com.mathify.service.QuizService;
import com.mathify.rest.filter.Secured;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/quizzes")
@Produces(MediaType.APPLICATION_JSON)
public class QuizResource {

    @Inject
    private QuizService quizService;

    @GET
    @Path("/{id}")
    @Secured
    public Response getQuiz(@PathParam("id") String id) {
        Quiz quiz = quizService.getQuiz(id);
        if (quiz == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(quiz).build();
    }
}
