package com.palmyralabs.pcg.main.input;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_HOST;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_PASSWORD;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_PORT;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_SCHEMAS;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_TYPE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_USERNAME;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_FRAMEWORK;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_MODE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_OUTPUT_PATH;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_PACKAGE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_PROJECT_NAME;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_SPRING_BUILD;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_HELP;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_HOST;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_PASSWORD;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_PORT;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_SCHEMAS;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_TYPE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_DATABASE_USERNAME;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_FRAMEWORK;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_MODE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_OUTPUT_PATH;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_PACKAGE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_PROJECT_NAME;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_SPRING_BUILD;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.S_HELP;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.PortNumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;
import com.palmyralabs.pcg.validator.impl.DefaultOptionsProvider;

public class UserInputs {
	public static DefaultOptionsProvider getProvider() {
		Options options = new Options();

		StringOption helpOption = new StringOption(S_HELP, L_HELP, false, "Print the help message", "");
		options.addOption(helpOption);

		// Framework name must be provided in lowerCase
		ChoiceOption frameworkOption = new ChoiceOption(S_FRAMEWORK, L_FRAMEWORK, true, "Framework (React / Spring)",
				new String[] { "spring", "react" }, "Select your framework");
		
		frameworkOption.setRequired(true);
		options.addOption(frameworkOption);

		ChoiceOption springBuildOption = new ChoiceOption(S_SPRING_BUILD, L_SPRING_BUILD, true, "Build tool option",
				new String[] { "maven", "gradle" }, "Select Build tool (enter 1 or 2)", 1);
		springBuildOption.setRequired(true);
		options.addOption(springBuildOption);

		ChoiceOption reactBuildOption = new ChoiceOption(S_SPRING_BUILD, L_SPRING_BUILD, true, "Build tool option",
				new String[] { "vite", "rollup" }, "Select Build tool (enter 1 or 2)", 0);
		reactBuildOption.setRequired(true);
		options.addOption(reactBuildOption);

		ChoiceOption modeOption = new ChoiceOption(S_MODE, L_MODE, true, "Mode (Minimal / Full / Extended)",
				new String[] { "Minimal", "Full", "Extended" }, "Select generation Mode  (enter 1,2 or 3)", 0);
		options.addOption(modeOption);

		StringOption packageName = new StringOption(S_PACKAGE, L_PACKAGE, true, "Package name option",
				"Enter Package Name");
		packageName.setRequired(true);
		options.addOption(packageName);

		StringOption projectName = new StringOption(S_PROJECT_NAME, L_PROJECT_NAME, true, "Project name option",
				"Enter Project Name");
		projectName.setRequired(true);
		options.addOption(projectName);

		StringOption outputPath = new StringOption(S_OUTPUT_PATH, L_OUTPUT_PATH, true, "Output path option",
				"Enter Output Path");
		options.addOption(outputPath);

		ChoiceOption databaseType = new ChoiceOption(S_DATABASE_TYPE, L_DATABASE_TYPE, true, "Database Type (MariaDB / MySQL / Oracle)",
				new String[] { "MariaDB", "MySQL", "Oracle" }, "Select database type (enter 1, 2, or 3)");
		databaseType.setRequired(true);
		options.addOption(databaseType);

		StringOption hostOption = new StringOption(S_DATABASE_HOST, L_DATABASE_HOST, true, "Host name option",
				"Enter Host Name");
		hostOption.setRequired(true);
		options.addOption(hostOption);

		PortNumberOption portOption = new PortNumberOption(S_DATABASE_PORT, L_DATABASE_PORT, true, "Port number option",
				"Enter port number");
		portOption.setRequired(true);
		options.addOption(portOption);

		StringOption userName = new StringOption(S_DATABASE_USERNAME, L_DATABASE_USERNAME, true, "Database User name option",
				"Enter User Name");
		userName.setRequired(true);
		options.addOption(userName);

		StringOption password = new StringOption(S_DATABASE_PASSWORD, L_DATABASE_PASSWORD, true, "Database Password option",
				"Enter Password");
		password.setRequired(true);
		options.addOption(password);

		StringOption schemaOptions = new StringOption(S_DATABASE_SCHEMAS, L_DATABASE_SCHEMAS, true, "List of Schemas",
				"Enter Schemas separated by comma");
		schemaOptions.setRequired(true);
		options.addOption(schemaOptions);

		DefaultOptionsProvider optionsProvider = new DefaultOptionsProvider(frameworkOption);
		optionsProvider.addOption(helpOption);
		optionsProvider.addOption(springBuildOption, "spring");
		optionsProvider.addOption(reactBuildOption, "react");
		optionsProvider.addOption(frameworkOption, "spring", "react");
		optionsProvider.addOption(modeOption, "spring", "react");
		optionsProvider.addOption(packageName, "spring");
		optionsProvider.addOption(projectName, "spring", "react");
		optionsProvider.addOption(outputPath, "spring", "react");
		optionsProvider.addOption(databaseType, "spring", "react");
		optionsProvider.addOption(hostOption, "spring", "react");
		optionsProvider.addOption(portOption, "spring", "react");
		optionsProvider.addOption(userName, "spring", "react");
		optionsProvider.addOption(password, "spring", "react");
		optionsProvider.addOption(schemaOptions, "spring", "react");

		return optionsProvider;
	}
}
