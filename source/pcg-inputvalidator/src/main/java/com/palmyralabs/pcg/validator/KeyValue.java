package com.palmyralabs.pcg.validator;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class KeyValue {
	private final String key;
	private final String value;
	
	public String toString() {
		return key + " " + value;
	}
}
