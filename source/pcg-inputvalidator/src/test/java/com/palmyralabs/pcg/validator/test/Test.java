package com.palmyralabs.pcg.validator.test;

import java.util.List;
import java.util.Scanner;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.validator.KeyValue;
import com.palmyralabs.pcg.validator.OptionsProvider;
import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;
import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.NumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;
import com.palmyralabs.pcg.validator.impl.DefaultOptionsProvider;

public class Test {

	public static void main(String[] args) {
		String commandInput = " -b maven";
		Options options = new Options();
		StringOption stringOption = new StringOption("d", "database", true, "String option", "Enter database value");
		stringOption.setRequired(true);
		options.addOption(stringOption);

		ChoiceOption frameOption = new ChoiceOption("f", "framework", true, "Choice option",
				new String[] { "java", "react" }, "enter valid framework");
		frameOption.setRequired(true);
		options.addOption(frameOption);

		ChoiceOption choiceOption = new ChoiceOption("b", "build", true, "Choice option",
				new String[] { "maven", "gradle" }, "enter valid Build");
		choiceOption.setRequired(true);
		options.addOption(choiceOption);

		NumberOption numberOption = new NumberOption("p", "portNumber", true, "Number option", "Enter port number");
		options.addOption(numberOption);

		CommandLineValidator validator = new CommandLineValidator();

		DefaultOptionsProvider optionsProvider = new DefaultOptionsProvider("build");
		optionsProvider.addOption(numberOption, "maven", "gradle");
		optionsProvider.addOption(stringOption, "maven", "gradle");
		optionsProvider.addOption(choiceOption, "maven", "gradle");
		optionsProvider.addOption(frameOption, "maven", "gradle");

		List<KeyValue> result = validator.validate(optionsProvider, commandInput.split("\\s+"));
		System.out.println(result.size());
	}

}
