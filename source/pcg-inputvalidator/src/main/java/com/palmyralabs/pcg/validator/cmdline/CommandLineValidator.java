package com.palmyralabs.pcg.validator.cmdline;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Map;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import com.palmyralabs.pcg.validator.InputValidator;
import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.NumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;

public class CommandLineValidator implements InputValidator {

	public String validate(Options options, String[] command) {
	    CommandLineParser parser = new DefaultParser();
	    CommandLine cmd;

	    try {
	        cmd = parser.parse(options, command);
	    } catch (ParseException e) {
	        System.out.println("Invalid command syntax.");
	        return promptUserForOptions(options, command);
	    }

	    boolean allRequiredOptionsPresent = true;
	    for (Option option : options.getOptions()) {
	        if (option.isRequired() && !cmd.hasOption(option.getLongOpt())) {
	            allRequiredOptionsPresent = false;
	            break;
	        }
	    }

	    if (allRequiredOptionsPresent) {
	        StringBuilder validatedCommand = new StringBuilder();
	        for (Option option : options.getOptions()) {
	            String opt;
	            String value;
	            if (command.length == 1) {
	                opt = option.getOpt(); 
	                value = cmd.getOptionValue(opt);
	            } else { 
	                String shortOpt = option.getOpt();
	                opt = option.getLongOpt(); 
	                value = cmd.getOptionValue(opt); 
	                if (value == null && shortOpt != null) {
	                    value = cmd.getOptionValue(shortOpt);
	                }
	            }

	            if (value != null) { 
	                if (option instanceof ChoiceOption) {
	                    ChoiceOption choiceOption = (ChoiceOption) option;
	                    String[] choices = choiceOption.getChoices();
	                    if (isValidChoice(value, choices)) {
	                        validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                    } else {
	                        System.out.println("Invalid value for option '" + opt + "'. Please choose one of the following: ");
	                        displayChoices(choices);
	                        String newValue = handleChoiceSelection(choices);
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    }
	                } else if (option instanceof NumberOption) {
	                    if (isValidNumber(value)) {
	                        validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                    } else {
	                        System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
	                        String newValue = promptUserForOptionValue(option);
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    }
	                } else {
	                    validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                }
	            }
	        }
	        return validatedCommand.toString().trim();
	    }

	    return promptUserForOptions(options, command);
	}

	private boolean isValidNumber(String value) {
	    try {
	        Double.parseDouble(value);
	        return true;
	    } catch (NumberFormatException e) {
	        return false;
	    }
	}


	private String promptUserForOptions(Options options, String[] command) {
	    Scanner scanner = new Scanner(System.in);
	    StringBuilder validatedCommand = new StringBuilder();

	    Map<String, String> providedOptions = new HashMap<>();
	    if (command.length > 1) {
	        for (int i = 0; i < command.length; i += 2) {
	            String opt = command[i].startsWith("-") ? command[i].substring(1) : command[i];
	            providedOptions.put(opt, command[i + 1]);
	        }
	    }

	    for (Option option : options.getOptions()) {
	        if (option.isRequired()) {
	            String opt = option.getOpt();
	            String shortOpt = option.getOpt(); 
	            String value = providedOptions.get(opt); 
	            if (value == null && shortOpt != null) {
	                value = providedOptions.get(shortOpt);
	                opt = shortOpt; 
	            }

	            if (value != null) { 
	                if (option instanceof ChoiceOption) {
	                    ChoiceOption choiceOption = (ChoiceOption) option;
	                    String[] choices = choiceOption.getChoices();
	                    if (isValidChoice(value, choices)) {
	                        validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                    } else {
	                        System.out.println("Invalid value for option '" + opt + "'. Please choose one of the following: ");
	                        displayChoices(choices);
	                        String newValue = handleChoiceSelection(choices);
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    }
	                } else if (option instanceof NumberOption) {
	                    if (isValidNumber(value)) {
	                        validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                    } else {
	                        System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
	                        String newValue = promptUserForOptionValue(option);
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    }
	                } else {
	                    validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
	                }
	            } else {
	                if (option instanceof ChoiceOption) {
	                    ChoiceOption choiceOption = (ChoiceOption) option;
	                    String[] choices = choiceOption.getChoices();
	                    displayChoices(choices);
	                    validatedCommand.append("-").append(opt).append(" ").append(handleChoiceSelection(choices)).append(" ");
	                } else if (option instanceof NumberOption) {
	                    System.out.println("Enter the " + option.getLongOpt() + ": ");
	                    String newValue = scanner.nextLine();
	                    if (isValidNumber(newValue)) {
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    } else {
	                        System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
	                        newValue = promptUserForOptionValue(option);
	                        validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                    }
	                } else {
	                    String newValue = promptUserForOptionValue(option);
	                    validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
	                }
	            }
	        }
	    }
	    scanner.close();
	    return validatedCommand.toString().trim();
	}


    private String promptUserForOptionValue(Option option) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the " + option.getLongOpt() + ": ");
        return scanner.nextLine();
    }

    private boolean isValidChoice(String value, String[] choices) {
        for (String choice : choices) {
            if (value.equals(choice)) {
                return true;
            }
        }
        return false;
    }

    private void displayChoices(String[] choices) {
        for (String choice : choices) {
            System.out.println(choice);
        }
    }

    private String handleChoiceSelection(String[] choices) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.print("Select an option: ");
            String input = scanner.nextLine();
            if (isValidChoice(input, choices)) {
                return input;
            } else {
                System.out.println("Invalid selection. Please try again.");
            }
        }
    }

   
}
