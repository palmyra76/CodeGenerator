package com.palmyralabs.codegenerator;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.springframework.stereotype.Component;

enum ProjectFramework {
	SPRING, REACT
}

@Component
public class CmdParser {

	Options options;

	public CommandLine parseCmd(String[] args) {
		options = new Options();

		Option frameworkOption = Option.builder("f").longOpt("framework").argName("framework").hasArg().required(true)
				.desc("project framework (spring, react...)").type(ProjectFramework.class).optionalArg(false)
				.numberOfArgs(1).build();
		options.addOption(new Option("b", "build", false, "build file details"));
		options.addOption(new Option("p", "project", true, "project name"));
		options.addOption(new Option("m", "mode", false, "project creation mode (minimal/full/extended"));
		options.addOption(new Option("o", "output", false, "output path loction"));
		options.addOption(new Option("g", "group", false, "project group (package name)"));

		CommandLineParser parser = new DefaultParser();

		try {
			return parser.parse(options, args);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}

	}

	public void printHelp() {
		HelpFormatter formatter = new HelpFormatter();
		formatter.printHelp("usage:", options);
	}

}
