package com.palmyralabs.pcg.commons.options;

public enum Framework {
	SpringBoot("spring"), React("react");

	public final String value;

	private Framework(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}
}
