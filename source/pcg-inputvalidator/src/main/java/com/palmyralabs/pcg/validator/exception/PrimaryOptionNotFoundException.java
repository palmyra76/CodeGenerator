package com.palmyralabs.pcg.validator.exception;

import lombok.Getter;

@Getter
public class PrimaryOptionNotFoundException extends CmdOptionValidationException {
	private final String option;

	public PrimaryOptionNotFoundException(String option) {
		super("Primary Option " + option + " not provided");
		this.option = option;
	}

	private static final long serialVersionUID = 1L;

}
