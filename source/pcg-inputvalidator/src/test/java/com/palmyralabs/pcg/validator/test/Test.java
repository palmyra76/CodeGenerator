package com.palmyralabs.pcg.validator.test;

import java.util.List;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;
import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.PortNumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;
import com.palmyralabs.pcg.validator.impl.DefaultOptionsProvider;

public class Test {

	public static void main(String[] args) {
		String commandInput = " -f react -m full";
		Options options = new Options();

		ChoiceOption frameOption = new ChoiceOption("f", "framework", true, "Framework option",
				new String[] { "spring", "react" }, "Enter valid framework");
		frameOption.setRequired(true);
		options.addOption(frameOption);

		ChoiceOption springBuildOption = new ChoiceOption("b", "build", true, "Build tool option",
				new String[] { "maven", "gradle" }, "Enter valid Build");
		springBuildOption.setRequired(true);
		options.addOption(springBuildOption);
		
		ChoiceOption reactBuildOption = new ChoiceOption("b", "build", true, "Build tool option",
				new String[] { "vite", "rollup" }, "Enter valid Build ");
		reactBuildOption.setRequired(true);
		options.addOption(reactBuildOption);

		ChoiceOption modeOption = new ChoiceOption("m", "mode", true, "Mode option",
				new String[] { "Minimal", "Full", "Extended" }, "Enter generation mode");
		options.addOption(modeOption);
		
		StringOption packageName = new StringOption("p", "package", true, "Package name option", "Enter Package Name");
		packageName.setRequired(true);
		options.addOption(packageName);

		ChoiceOption databaseType = new ChoiceOption("t", "type", true, "Database Type option",
				new String[] { "MariaDB", "MySQL", "Oracle" }, "Enter database type");
		databaseType.setRequired(true);
		options.addOption(databaseType);
		
		StringOption hostName = new StringOption("h", "host", true, "Host name option", "Enter Host Name");
		hostName.setRequired(true);
		options.addOption(hostName);

		PortNumberOption portOption = new PortNumberOption("n", "portNumber", true, "Port number option", "Enter port number");
		portOption.setRequired(true);
		options.addOption(portOption);
		
		StringOption userName = new StringOption("u", "userName", true, "User name option", "Enter User Name");
		userName.setRequired(true);
		options.addOption(userName);
		
		StringOption password = new StringOption("s", "password", true, "Password option", "Enter Password");
		password.setRequired(true);
		options.addOption(password);

		CommandLineValidator validator = new CommandLineValidator();

		DefaultOptionsProvider optionsProvider = new DefaultOptionsProvider("framework");
		optionsProvider.addOption(springBuildOption, "spring");
		optionsProvider.addOption(reactBuildOption, "react");
		optionsProvider.addOption(frameOption, "spring", "react");
		optionsProvider.addOption(modeOption, "spring", "react");
		optionsProvider.addOption(packageName, "spring");
		optionsProvider.addOption(databaseType, "spring", "react");
		optionsProvider.addOption(portOption, "spring", "react");
		optionsProvider.addOption(userName, "spring", "react");
		optionsProvider.addOption(password, "spring", "react");
		

		List<KeyValue> result = validator.validate(optionsProvider, commandInput.split("\\s+"));
		System.out.println(result.size());
		System.out.println(result);
	}

}
