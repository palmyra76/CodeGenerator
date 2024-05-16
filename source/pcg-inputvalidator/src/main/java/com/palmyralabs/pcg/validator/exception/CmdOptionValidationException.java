package com.palmyralabs.pcg.validator.exception;

public class CmdOptionValidationException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public CmdOptionValidationException(String message, Exception e) {
		super(message, e);
	}

	public CmdOptionValidationException(String message) {
		super(message);
	}
}
