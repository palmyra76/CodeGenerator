package com.palmyralabs.pcg.validator.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.apache.commons.cli.Options;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.github.stefanbirkner.systemlambda.SystemLambda;
import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;
import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.impl.DefaultOptionsProvider;

import lombok.SneakyThrows;

public class TestGradle {

	private CommandLineValidator validator = new CommandLineValidator();

	@Test
	@SneakyThrows
	@DisplayName("TestSpringFull:<cmd> -f spring -m full")
	public void TestSpringFull() {
		String expectedOutput = """
				Enter valid Build
				1 maven
				2 gradle
				3
				[build maven, framework spring, mode full]""";

		String commandInput = " -f spring -m full";
		Options options = new Options();

		ChoiceOption frameworkOption = new ChoiceOption("f", "framework", true, "Framework option",
				new String[] { "spring", "react" }, "Enter valid framework");
		frameworkOption.setRequired(true);
		options.addOption(frameworkOption);

		ChoiceOption springBuildOption = new ChoiceOption("b", "build", true, "Build tool option",
				new String[] { "maven", "gradle" }, "Enter valid Build");
		springBuildOption.setRequired(true);
		options.addOption(springBuildOption);

		ChoiceOption modeOption = new ChoiceOption("m", "mode", true, "Mode option",
				new String[] { "Minimal", "Full", "Extended" }, "Enter generation mode");
		options.addOption(modeOption);

		DefaultOptionsProvider optionsProvider = new DefaultOptionsProvider(frameworkOption);
		optionsProvider.addOption(springBuildOption, "spring");
		optionsProvider.addOption(frameworkOption, "spring", "react");
		optionsProvider.addOption(modeOption, "spring", "react");

		String text = SystemLambda.tapSystemOut(() -> {
			SystemLambda.withTextFromSystemIn("1").execute(() -> {
				List<KeyValue> result = validator.validate(optionsProvider, commandInput.split("\\s+"));
				System.out.println(result.size());
				System.out.println(result);
			});
		});

		assertEquals(text.trim(), expectedOutput.trim());
	}
}
