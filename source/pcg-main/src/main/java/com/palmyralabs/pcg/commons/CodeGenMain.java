package com.palmyralabs.pcg.commons;

import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;

public class CodeGenMain {

	public static void main(String[] args) {
		CommandLineValidator validator = new CommandLineValidator();
		
		validator.validate(null, args);
	}

}
