package com.palmyralabs.pcg.validator.cmdline.options;

import com.palmyralabs.pcg.validator.ValidOption;
import com.palmyralabs.pcg.validator.impl.NumberInputReader;

public class NumberOption extends ValidOption {

	private static final long serialVersionUID = 1L;

	public NumberOption(String option, String longOption, boolean hasArg, String description, String invalidMessage)
			throws IllegalArgumentException {
		super(option, longOption, hasArg, description, new NumberInputReader(invalidMessage));
	}

	@Override
	public boolean isValid(String option) {
		if (null == option)
			return false;

		try {
			Integer.parseInt(option);
		} catch (Throwable t) {
			return false;
		}
		return true;
	}

}
