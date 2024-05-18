package com.palmyralabs.pcg.validator.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.palmyralabs.pcg.validator.cmdline.options.ChoiceOption;
import com.palmyralabs.pcg.validator.cmdline.options.NumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.PortNumberOption;
import com.palmyralabs.pcg.validator.cmdline.options.StringOption;

public class TestOptions {

	@Test
	public void TestNumberOption() {
		NumberOption numberOption = new NumberOption("n", "number", false, "Number option", "Enter number input");
		assertEquals(true, numberOption.isValid("1"), "Number input accepted");
		assertEquals(false, numberOption.isValid("a"), "String is not allowed");
	}

	@Test
	public void TestPortNumberOption() {
		PortNumberOption portNumber = new PortNumberOption("p", "port", false, "Port Number", "Enter Port Number");
		assertEquals(true, portNumber.isValid("3306"), "valid port number");
		assertEquals(false, portNumber.isValid("12"));
		assertEquals(false, portNumber.isValid("65536"),"Port number maximum limit is 65535");
		assertEquals(false, portNumber.isValid("1024"), "Port number minimum limit is 1025");
	}

	@Test
	public void TestStringOption() {
		StringOption userName = new StringOption("u", "user", false, "String Oprtion", "Enter name");
		userName.setRequired(true);
		StringOption host = new StringOption("h", "host", false, "Host Number", "Enter Host Number");
		assertEquals(true, userName.isValid("root"));
		assertEquals(false, userName.isValid(null));
		assertEquals(true, host.isValid("localhost"));
		assertEquals(true, host.isValid(null));
	}

	@Test
	public void TestChoiceOption() {
		ChoiceOption modeOption = new ChoiceOption("m", "mode", true, "Mode option",
				new String[] { "Minimal", "Full", "Extended" }, "Enter generation mode");
		assertEquals(true, modeOption.isValid("full"));
		assertEquals(false, modeOption.isValid("medium"));
	}
}
