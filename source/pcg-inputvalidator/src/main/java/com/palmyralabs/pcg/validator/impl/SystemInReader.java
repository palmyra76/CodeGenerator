package com.palmyralabs.pcg.validator.impl;

public abstract class SystemInReader {

	protected String readSystemIn() {
		String sl = null;
		do {
			sl = SysUtils.readLineFromConsole();
		} while (null == sl);
		return sl;
	}
}
