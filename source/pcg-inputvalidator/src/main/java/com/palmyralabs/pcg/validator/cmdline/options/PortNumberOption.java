package com.palmyralabs.pcg.validator.cmdline.options;

public class PortNumberOption extends NumberOption {

	private static final long serialVersionUID = 1L;

	public PortNumberOption(String option, String longOption, boolean hasArg, String description, String invalidMessage)
			throws IllegalArgumentException {
		super(option, longOption, hasArg, description, invalidMessage);
	}

	@Override
	public boolean isValid(String option) {
		if (null == option)
			return false;
		try {
			Integer number = Integer.parseInt(option);
			if (number >= 1024 && number <= 65535)
				return true;
			else
				return false;
		} catch (Throwable t) {
			return false;
		}

	}

}
