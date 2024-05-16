package com.palmyralabs.pcg.validator.impl;

import java.util.Scanner;

public class SysUtils {
	public static Scanner scanner;

	public static String readLineFromConsole() {
		if (null == scanner) {
			scanner = new Scanner(System.in);
		}

		return scanner.nextLine();
	}

	public static void close() {
		if (null != scanner) {
			scanner.close();
			scanner = null;
		}
	}
}
