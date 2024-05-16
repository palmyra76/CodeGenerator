package com.palmyralabs.pcg.validator.impl;

import com.palmyralabs.pcg.validator.InputReader;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class StringInputReader extends SystemInReader implements InputReader {

	private final String invalidMessage;

	@Override
	public String readInput(String oldValue) {
		System.out.println(invalidMessage);
		return readSystemIn();
	}

}
