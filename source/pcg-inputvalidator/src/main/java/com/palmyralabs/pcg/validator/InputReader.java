package com.palmyralabs.pcg.validator;

public interface InputReader {
	String getInvalidMessage();

	String readInput(String oldValue);
}
