package com.palmyralabs.pcg.validator.cmdline.options;

import com.palmyralabs.pcg.validator.InputReader;

public interface Validatable {
	boolean isValid(String option);
	
	InputReader getInputReader();
}
