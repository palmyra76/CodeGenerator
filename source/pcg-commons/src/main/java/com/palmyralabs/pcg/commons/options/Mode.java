package com.palmyralabs.pcg.commons.options;

public enum Mode {
	Minimal("minimal"), Extended("extended");

	public final String value;

	private Mode(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}
}
