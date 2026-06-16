package com.mathify.rest.mapper;

import com.mathify.rest.dto.response.ErrorResponse;
import jakarta.ws.rs.WebApplicationException;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.ExceptionMapper;
import jakarta.ws.rs.ext.Provider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Provider
public class GlobalExceptionMapper implements ExceptionMapper<Exception> {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionMapper.class);

    @Override
    public Response toResponse(Exception exception) {
        if (exception instanceof WebApplicationException) {
            WebApplicationException wae = (WebApplicationException) exception;
            return Response.status(wae.getResponse().getStatus())
                    .entity(new ErrorResponse(wae.getMessage(), null))
                    .type(MediaType.APPLICATION_JSON)
                    .build();
        }

        log.error("Unhandled exception: ", exception);
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                .entity(new ErrorResponse("Internal Server Error", exception.getMessage()))
                .type(MediaType.APPLICATION_JSON)
                .build();
    }
}
