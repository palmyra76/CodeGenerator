package com.palmyralabs.pcg.validator.test;

import java.util.Scanner;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;
import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.NumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;

public class Test {

	public static void main(String[] args) {
        Options options = new Options();
        StringOption stringOption = new StringOption("d", "database", true, "String option");
        stringOption.setRequired(true);
        options.addOption(stringOption);

        ChoiceOption choiceOption = new ChoiceOption("b", "build", true, "Choice option");
        choiceOption.setRequired(true);
        choiceOption.setChoices(new String[]{"maven", "gradle"});
        options.addOption(choiceOption);

        NumberOption numberOption = new NumberOption("p", "portNumber", true, "Number option");
        numberOption.setRequired(true);
        options.addOption(numberOption);

        CommandLineValidator validator = new CommandLineValidator();

        Scanner scanner = new Scanner(System.in);
        String validatedCommand;

        System.out.println("Please enter your command:");
        String commandInput = scanner.nextLine();
        validatedCommand = validator.validate(options, commandInput.split("\\s+")); 
        if (validatedCommand != null) {
            System.out.println("Valid command: " + validatedCommand);
        }
    }
	
}
