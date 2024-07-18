package com.palmyralabs.pcg.validator.impl;

public abstract class SystemInReader {

	protected String readSystemIn(boolean ignoreEmptyValue) {
		String sl = null;
		boolean flag = ! ignoreEmptyValue;
		do {
			sl = SysUtils.readLineFromConsole();
		} while (null == sl || (flag && sl.isEmpty()));
		return sl;
	}
}
