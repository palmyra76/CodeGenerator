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
	
	public static Framework byValue(String v) {
        for (Framework b : Framework.values()) {
            if (b.value.equalsIgnoreCase(v)) {
                return b;
            }
        }
        return null;
    }
}
