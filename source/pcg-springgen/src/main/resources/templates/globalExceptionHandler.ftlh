package ${packageName}.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import ${packageName}.model.ErrorResponse;
import com.palmyralabs.palmyra.base.exception.EndPointForbiddenException;
import com.palmyralabs.palmyra.base.exception.ResourceAlreadyExistsException;
import com.palmyralabs.palmyra.base.exception.ResourceNotFoundException;
import com.palmyralabs.palmyra.ext.usermgmt.exception.UnAuthorizedException;
import com.zitlab.palmyra.common.exception.PalmyraException;
import com.zitlab.palmyra.store.base.exception.DataValidationException;

@RestControllerAdvice
public class GlobalExceptionHandler extends BaseController {

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponse> resourceNotFoundException(ResourceNotFoundException e) {
        return notFound(getErrorResponse(e));
    }

    @ExceptionHandler(ResourceAlreadyExistsException.class)
    public ResponseEntity<ErrorResponse> resourceAlreadyExists(ResourceAlreadyExistsException e) {
        return alreadyExists(getErrorResponse(e));
    }

    @ExceptionHandler(UnAuthorizedException.class)
    public ResponseEntity<ErrorResponse> unauthorizedException(UnAuthorizedException e) {
        return unauthorized(getErrorResponse(e));
    }
    
    @ExceptionHandler(EndPointForbiddenException.class)
    public ResponseEntity<ErrorResponse> unauthorizedException(EndPointForbiddenException e) {
        return unauthorized(getErrorResponse(e));
    }
    
    @ExceptionHandler(DataValidationException.class)
    public ResponseEntity<ErrorResponse> missingParamsException(DataValidationException e) {
        return badRequest(getErrorResponse(e));
    }

    protected final ResponseEntity<ErrorResponse> badRequest(ErrorResponse response) {
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }
    
    private ErrorResponse getErrorResponse(PalmyraException e) {
        return new ErrorResponse(e.getErrorCode(), e.getMessage());
    }
}