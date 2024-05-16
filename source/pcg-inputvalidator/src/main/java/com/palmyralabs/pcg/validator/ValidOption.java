package com.palmyralabs.pcg.validator;

import org.apache.commons.cli.Option;

import com.palmyralabs.pcg.validator.cmdline.options.Validatable;

import lombok.Getter;

@Getter
public abstract class ValidOption extends Option implements Validatable {
	private static final long serialVersionUID = 1L;

	protected InputReader inputReader;

	public ValidOption(String opt, String longOpt, boolean hasArg, String description, InputReader inputReader) {
		super(opt, longOpt, hasArg, description);
		this.inputReader = inputReader;
	}

	public InputReader getInputReader() {
		return inputReader;
	}
}
