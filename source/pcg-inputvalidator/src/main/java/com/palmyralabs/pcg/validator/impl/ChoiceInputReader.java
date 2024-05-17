package com.palmyralabs.pcg.validator.impl;

import com.palmyralabs.pcg.validator.InputReader;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class ChoiceInputReader extends SystemInReader implements InputReader {

	private final String invalidMessage;
	private final String[] choices;

	@Override
	public String readInput(String oldValue) {
		System.out.println(invalidMessage);
		int count = 1;
		for (String c : choices) {
			System.out.println(count + " " + c);
			count++;
		}
		String input = readSystemIn();
		try {
			Integer index = Integer.parseInt(input);
			if (index > 0 && index <= choices.length)
				return choices[index - 1].toLowerCase();
		} catch (NumberFormatException e) {

		}
		return input.toLowerCase();
	}

}
