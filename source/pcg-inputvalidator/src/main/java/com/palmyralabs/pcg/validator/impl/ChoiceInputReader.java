package com.palmyralabs.pcg.validator.impl;

import com.palmyralabs.pcg.validator.InputReader;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class ChoiceInputReader extends SystemInReader implements InputReader {

	private final String invalidMessage;
	private final String[] choices;
	private int defaultChoice = -1;

	public ChoiceInputReader(String message, String[] choices, int defaultChoice) {
		this.invalidMessage = message;
		this.choices = choices;
		if (defaultChoice > -1 && defaultChoice < choices.length) {
			this.defaultChoice = defaultChoice;
		} else
			throw new RuntimeException("Default choice should be within 0 to " + (choices.length - 1));
	}

	@Override
	public String readInput(String oldValue) {
		System.out.println(invalidMessage);
		int count = 1;
		for (String c : choices) {
			System.out.println(count + " " + c);
			count++;
		}

		if (defaultChoice > -1) {
			System.out.print("default is " + choices[defaultChoice] + "  ");
		}

		String input = readSystemIn(defaultChoice > -1);
		try {
			Integer index = Integer.parseInt(input);
			if (index > 0 && index <= choices.length)
				return choices[index - 1].toLowerCase();
		} catch (NumberFormatException e) {

		}

		String result = input.toLowerCase();
		if (result.length() > 0)
			return result;
		else {
			if (defaultChoice > -1 && defaultChoice < choices.length)
				return choices[defaultChoice].toLowerCase();
		}

		return input.toLowerCase();
	}

}
