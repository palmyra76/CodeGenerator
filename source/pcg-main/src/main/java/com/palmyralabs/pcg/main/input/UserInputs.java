package com.palmyralabs.pcg.main.input;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.PortNumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;
import com.palmyralabs.pcg.validator.impl.DefaultOptionsProvider;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.*;

public class UserInputs {
	public static DefaultOptionsProvider getProvider() {
		Options options = new Options();

		ChoiceOption frameworkOption = new ChoiceOption(S_FRAMEWORK, L_FRAMEWORK, true, "Framework option",
				new String[] { "spring", "react" }, "Select your framework");
		frameworkOption.setRequired(true);
		options.addOption(frameworkOption);

		ChoiceOption springBuildOption = new ChoiceOption(S_SPRING_BUILD, L_SPRING_BUILD, true, "Build tool option",
				new String[] { "maven", "gradle" }, "Select Build tool (enter 1 or 2)");
		springBuildOption.setRequired(true);
		options.addOption(springBuildOption);

		ChoiceOption reactBuildOption = new ChoiceOption(S_SPRING_BUILD, L_SPRING_BUILD, true, "Build tool option",
				new String[] { "vite", "rollup" }, "Select Build tool (enter 1 or 2)");
		reactBuildOption.setRequired(true);
		options.addOption(reactBuildOption);

		ChoiceOption modeOption = new ChoiceOption(S_MODE, L_MODE, true, "Mode option",
				new String[] { "Minimal", "Full", "Extended" }, "Select generation Mode  (enter 1,2 or 3)");
		options.addOption(modeOption);

		StringOption packageName = new StringOption(S_PACKAGE, L_PACKAGE, true, "Package name option",
				"Enter Package Name");
		packageName.setRequired(true);
		options.addOption(packageName);

		ChoiceOption databaseType = new ChoiceOption(S_DATABASE_TYPE, L_DATABASE_TYPE, true, "Database Type option",
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

		StringOption userName = new StringOption(S_DATABASE_USERNAME, L_DATABASE_USERNAME, true, "User name option",
				"Enter User Name");
		userName.setRequired(true);
		options.addOption(userName);

		StringOption password = new StringOption(S_DATABASE_PASSWORD, L_DATABASE_PASSWORD, true, "Password option",
				"Enter Password");
		password.setRequired(true);
		options.addOption(password);

		StringOption schemaOptions = new StringOption(S_DATABASE_SCHEMAS, L_DATABASE_SCHEMAS, true, "List of Schemas",
				"Enter Schemas separated by comma");
		password.setRequired(true);
		options.addOption(password);

		DefaultOptionsProvider optionsProvider = new DefaultOptionsProvider(frameworkOption);
		optionsProvider.addOption(springBuildOption, "spring");
		optionsProvider.addOption(reactBuildOption, "react");
		optionsProvider.addOption(frameworkOption, "spring", "react");
		optionsProvider.addOption(modeOption, "spring", "react");
		optionsProvider.addOption(packageName, "spring");
		optionsProvider.addOption(databaseType, "spring", "react");
		optionsProvider.addOption(hostOption, "spring", "react");
		optionsProvider.addOption(portOption, "spring", "react");
		optionsProvider.addOption(userName, "spring", "react");
		optionsProvider.addOption(password, "spring", "react");
		optionsProvider.addOption(schemaOptions, "spring", "react");
		
		return optionsProvider;
	}
}
