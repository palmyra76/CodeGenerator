package com.palmyralabs.pcg.validator.cmdline;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;

import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.validator.InputValidator;
import com.palmyralabs.pcg.validator.OptionsProvider;
import com.palmyralabs.pcg.validator.ValidOption;

import lombok.SneakyThrows;

public class CommandLineValidator implements InputValidator {

	@Override
	@SneakyThrows
	public List<KeyValue> validate(OptionsProvider optionsProvider, String[] command) {

		List<KeyValue> result = new ArrayList<>();

		CommandLineParser parser = new CommandParser();
		CommandLine cmd = parser.parse(optionsProvider.getOptions(), command);

		if (command.length == 0 || cmd.hasOption("help")) {
			HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp(" ", optionsProvider.getOptions());
		}

		else {

//			CommandLineParser parser = new CommandParser();
//			CommandLine cmd = parser.parse(optionsProvider.getOptions(), command);

			ValidOption primaryOption = optionsProvider.getPrimaryOption();

			String primaryOptionValue = cmd.getOptionValue(primaryOption);

			if (null == primaryOptionValue) {
				KeyValue kv = getValue(cmd, primaryOption);
				result.add(kv);
				primaryOptionValue = kv.getValue();
			} else {
				KeyValue kv = getValue(cmd, primaryOption);
				result.add(kv);
			}

			List<ValidOption> options = optionsProvider.getOptions(primaryOptionValue.toLowerCase());

			for (ValidOption vo : options) {
				if (vo != primaryOption) {
					KeyValue kv = getValue(cmd, vo);
					result.add(kv);
				}
			}
		}
		return result;

	}

	private KeyValue getValue(CommandLine cmd, ValidOption vo) {
		String v = cmd.getOptionValue(vo);
		String value = validate(vo, v);
		KeyValue kv = new KeyValue(getKey(vo), value);
		return kv;
	}

	public String getKey(ValidOption vo) {
		return null != vo.getLongOpt() ? vo.getLongOpt() : vo.getOpt();
	}

	private String validate(ValidOption vo, String v) {
		if (vo.isValid(v))
			return v;
		else
			return promptForUserInput(vo, v);
	}

	private String promptForUserInput(ValidOption vo, String v) {
		String newValue;
		String oldValue = v;
		do {
			newValue = vo.getInputReader().readInput(oldValue);
			oldValue = newValue;
		} while (!vo.isValid(newValue));
		return newValue;
	}

//	public String validate(String primaryOption, String[] command) {
//
//		try {
//			cmd = parser.parse(options, command);
//		} catch (ParseException e) {
//			System.out.println("Invalid command syntax.");
//			return promptUserForOptions(options, command);
//		}
//
//		boolean allRequiredOptionsPresent = true;
//		for (Option option : options.getOptions()) {
//			if (option.isRequired() && !cmd.hasOption(option.getLongOpt())) {
//				allRequiredOptionsPresent = false;
//				break;
//			}
//		}
//
//		if (allRequiredOptionsPresent) {
//			StringBuilder validatedCommand = new StringBuilder();
//			for (Option option : options.getOptions()) {
//				String opt;
//				String value;
//				if (command.length == 1) {
//					opt = option.getOpt();
//					value = cmd.getOptionValue(opt);
//				} else {
//					String shortOpt = option.getOpt();
//					opt = option.getLongOpt();
//					value = cmd.getOptionValue(opt);
//					if (value == null && shortOpt != null) {
//						value = cmd.getOptionValue(shortOpt);
//					}
//				}
//
//				if (value != null) {
//					if (option instanceof ChoiceOption) {
//						ChoiceOption choiceOption = (ChoiceOption) option;
//						String[] choices = choiceOption.getChoices();
//						if (isValidChoice(value, choices)) {
//							validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//						} else {
//							System.out.println(
//									"Invalid value for option '" + opt + "'. Please choose one of the following: ");
//							displayChoices(choices);
//							String newValue = handleChoiceSelection(choices);
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						}
//					} else if (option instanceof NumberOption) {
//						if (isValidNumber(value)) {
//							validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//						} else {
//							System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
//							String newValue = promptUserForOptionValue(option);
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						}
//					} else {
//						validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//					}
//				}
//			}
//			return validatedCommand.toString().trim();
//		}
//
//		return promptUserForOptions(options, command);
//	}
//
//	private boolean isValidNumber(String value) {
//		try {
//			Double.parseDouble(value);
//			return true;
//		} catch (NumberFormatException e) {
//			return false;
//		}
//	}
//
//	private String promptUserForOptions(Options options, String[] command) {
//		Scanner scanner = new Scanner(System.in);
//		StringBuilder validatedCommand = new StringBuilder();
//
//		Map<String, String> providedOptions = new HashMap<>();
//		if (command.length > 1) {
//			for (int i = 0; i < command.length; i += 2) {
//				String opt = command[i].startsWith("-") ? command[i].substring(1) : command[i];
//				providedOptions.put(opt, command[i + 1]);
//			}
//		}
//
//		for (Option option : options.getOptions()) {
//			if (option.isRequired()) {
//				String opt = option.getOpt();
//				String shortOpt = option.getOpt();
//				String value = providedOptions.get(opt);
//				if (value == null && shortOpt != null) {
//					value = providedOptions.get(shortOpt);
//					opt = shortOpt;
//				}
//
//				if (value != null) {
//					if (option instanceof ChoiceOption) {
//						ChoiceOption choiceOption = (ChoiceOption) option;
//						String[] choices = choiceOption.getChoices();
//						if (isValidChoice(value, choices)) {
//							validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//						} else {
//							System.out.println(
//									"Invalid value for option '" + opt + "'. Please choose one of the following: ");
//							displayChoices(choices);
//							String newValue = handleChoiceSelection(choices);
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						}
//					} else if (option instanceof NumberOption) {
//						if (isValidNumber(value)) {
//							validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//						} else {
//							System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
//							String newValue = promptUserForOptionValue(option);
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						}
//					} else {
//						validatedCommand.append("-").append(opt).append(" ").append(value).append(" ");
//					}
//				} else {
//					if (option instanceof ChoiceOption) {
//						ChoiceOption choiceOption = (ChoiceOption) option;
//						String[] choices = choiceOption.getChoices();
//						displayChoices(choices);
//						validatedCommand.append("-").append(opt).append(" ").append(handleChoiceSelection(choices))
//								.append(" ");
//					} else if (option instanceof NumberOption) {
//						System.out.println("Enter the " + option.getLongOpt() + ": ");
//						String newValue = scanner.nextLine();
//						if (isValidNumber(newValue)) {
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						} else {
//							System.out.println("Invalid value for option '" + opt + "'. Please enter a valid number.");
//							newValue = promptUserForOptionValue(option);
//							validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//						}
//					} else {
//						String newValue = promptUserForOptionValue(option);
//						validatedCommand.append("-").append(opt).append(" ").append(newValue).append(" ");
//					}
//				}
//			}
//		}
//		scanner.close();
//		return validatedCommand.toString().trim();
//	}
//
//	private String promptUserForOptionValue(Option option) {
//		Scanner scanner = new Scanner(System.in);
//		System.out.print("Enter the " + option.getLongOpt() + ": ");
//		return scanner.nextLine();
//	}
//
//	private boolean isValidChoice(String value, String[] choices) {
//		for (String choice : choices) {
//			if (value.equals(choice)) {
//				return true;
//			}
//		}
//		return false;
//	}
//
//	private void displayChoices(String[] choices) {
//		for (String choice : choices) {
//			System.out.println(choice);
//		}
//	}
//
//	private String handleChoiceSelection(String[] choices) {
//		Scanner scanner = new Scanner(System.in);
//
//		while (true) {
//			System.out.print("Select an option: ");
//			String input = scanner.nextLine();
//			if (isValidChoice(input, choices)) {
//				return input;
//			} else {
//				System.out.println("Invalid selection. Please try again.");
//			}
//		}
//	}

}
