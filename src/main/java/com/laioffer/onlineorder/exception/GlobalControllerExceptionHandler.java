package com.laioffer.onlineorder.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalControllerExceptionHandler {
    Logger logger = LoggerFactory.getLogger(GlobalControllerExceptionHandler.class);


    @ExceptionHandler(UserAlreadyExistException.class)
    public final ResponseEntity<UserAlreadyExistException> handleResponseStatusException(UserAlreadyExistException e) {
        return new ResponseEntity<>(new UserAlreadyExistException("User already exists"), HttpStatus.CONFLICT);
    }


}
