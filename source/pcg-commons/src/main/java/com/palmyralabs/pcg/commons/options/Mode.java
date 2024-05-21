package com.palmyralabs.pcg.commons.options;

public enum Mode {
	Minimal("minimal"), Full("full"), Extended("extended");

	public final String value;

	private Mode(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}
	
	public static Mode byValue(String v) {
        for (Mode b : Mode.values()) {
            if (b.value.equalsIgnoreCase(v)) {
                return b;
            }
        }
        return null;
    }
}
