package com.palmyralabs.pcg.commons.options;

public enum BuildTool {
	GRADLE("gradle"), MAVEN("maven"), VITE("vite"), ROLLUP("rollup");

	public final String value;

	private BuildTool(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}
	
	public static BuildTool byValue(String v) {
        for (BuildTool b : BuildTool.values()) {
            if (b.value.equalsIgnoreCase(v)) {
                return b;
            }
        }
        return null;
    }
}
