package com.mathify.rest;

import com.mathify.dao.ChapterDAO;
import com.mathify.dao.QuizDAO;
import com.mathify.model.Chapter;
import com.mathify.model.Quiz;
import com.mathify.rest.dto.request.QuizInput;
import com.mathify.rest.dto.response.QuizSummaryResponse;
import com.mathify.rest.filter.AdminSecured;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Path("/chapters")
@Produces(MediaType.APPLICATION_JSON)
public class ChapterResource {

    @Inject
    private ChapterDAO chapterDAO;

    @Inject
    private QuizDAO quizDAO;

    @GET
    @Path("/{chapterId}/quizzes")
    @AdminSecured
    public Response getQuizzes(@PathParam("chapterId") String chapterId) {
        try {
            Chapter chapter = chapterDAO.findById(chapterId);
            if (chapter == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            List<Quiz> quizzes = quizDAO.findByChapter(chapterId);
            List<QuizSummaryResponse> response = new ArrayList<>();
            for (Quiz q : quizzes) {
                response.add(new QuizSummaryResponse(
                    q.getQuizId(),
                    q.getTitle(),
                    q.getPassingScore(),
                    q.getQuestions() != null ? q.getQuestions().size() : 0
                ));
            }
            return Response.ok(response).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }

    @POST
    @Path("/{chapterId}/quizzes")
    @AdminSecured
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createQuiz(@PathParam("chapterId") String chapterId, @Valid QuizInput input) {
        try {
            Chapter chapter = chapterDAO.findById(chapterId);
            if (chapter == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }
            String quizId = UUID.randomUUID().toString();
            Quiz quiz = new Quiz(quizId, input.title(), input.passingScore(), new ArrayList<>());
            quizDAO.insert(chapterId, quiz);
            
            Quiz created = quizDAO.findById(quizId);
            return Response.status(Response.Status.CREATED).entity(created).build();
        } catch (SQLException e) {
            throw new RuntimeException("DB error", e);
        }
    }
}
