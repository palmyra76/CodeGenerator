package com.palmyralabs.codegenerator;

import org.apache.commons.cli.CommandLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@Component
@SpringBootApplication
public class CodeGeneratorCommandLineRunner implements CommandLineRunner {

	private CmdParser cmdParser;

	@Autowired
	public CodeGeneratorCommandLineRunner(CmdParser cmdParser) {
		this.cmdParser = cmdParser;
	}

          
	@Override
	public void run(String... args) throws Exception {
		CommandLine cmd = cmdParser.parseCmd(args);
		if (cmd != null) {
			if (cmd.hasOption("p")) {
				String project = cmd.getOptionValue("p");
				System.out.println("Project: " + project);
			}
			if (cmd.hasOption("f")) {
				String framework = cmd.getOptionValue("f");
				System.out.println("Framework: " + framework);
				if(framework.equalsIgnoreCase("spring")) {
					
				}
			}

		} else {
			cmdParser.printHelp();
		}

	}

}
