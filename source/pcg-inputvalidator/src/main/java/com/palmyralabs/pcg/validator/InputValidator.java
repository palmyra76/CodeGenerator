package com.palmyralabs.pcg.validator;

import org.apache.commons.cli.Options;

public interface InputValidator {


	public String validate(Options options, String[] command);
	
}
