package com.palmyralabs.pcg.validator.cmdline.options;

import com.palmyralabs.pcg.validator.ValidOption;
import com.palmyralabs.pcg.validator.impl.StringInputReader;

public class StringOption extends ValidOption {

	private static final long serialVersionUID = 1L;

	public StringOption(String option, String longOption, 
			boolean hasArg, String description, String invalidMessage)
			throws IllegalArgumentException {
		super(option, longOption, hasArg, description, new StringInputReader(invalidMessage));
	}

	@Override
	public boolean isValid(String option) {
		if (isRequired())
			return null != option;
		return true;
	}

}
