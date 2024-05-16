package com.palmyralabs.pcg.validator.cmdline.options;

import com.palmyralabs.pcg.validator.ValidOption;
import com.palmyralabs.pcg.validator.impl.ChoiceInputReader;

public class ChoiceOption extends ValidOption {
	private static final long serialVersionUID = 1L;

	private String[] choices;

	public ChoiceOption(String opt, String longOpt, boolean hasArg, String description, String choices[],
			String invalidMessage) {
		super(opt, longOpt, hasArg, description, new ChoiceInputReader(invalidMessage, choices));
		this.choices = choices;
	}

	public String[] getChoices() {
		return choices;
	}

	@Override
	public boolean isValid(String option) {
		if (null == option)
			return false;

		for (String c : choices) {
			if (c.equalsIgnoreCase(option))
				return true;
		}
		return false;
	}

}
