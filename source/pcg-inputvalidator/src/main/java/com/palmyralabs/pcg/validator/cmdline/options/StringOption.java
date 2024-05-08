package com.palmyralabs.pcg.validator.cmdline.options;

import org.apache.commons.cli.Option;

public class StringOption extends Option {

	public StringOption(String option, String longOption, boolean hasArg, String description)
			throws IllegalArgumentException {
		super(option, longOption, hasArg, description);
	}

}
