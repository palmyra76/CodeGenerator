package com.palmyralabs.pcg.commons;

public class NameUtil {

	public static String splitData(String column) {
		StringBuffer org = new StringBuffer();
		int length = column.length();
		org.append(Character.toUpperCase(column.charAt(0)));
		for (int i = 1; i < length; i++) {
			if (column.charAt(i) > 64 && column.charAt(i) < 91)
				org.append(" " + column.charAt(i));
			else
				org.append(column.charAt(i));
		}
		return org.toString();
	}

}
