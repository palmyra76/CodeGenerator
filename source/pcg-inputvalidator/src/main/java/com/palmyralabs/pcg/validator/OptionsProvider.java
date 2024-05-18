package com.palmyralabs.pcg.validator;

import java.util.List;

import org.apache.commons.cli.Options;

public interface OptionsProvider {
	/**
	 * Returns options applicable based the primaryFilter Value
	 * 
	 * @param primaryFilter
	 * @return
	 */
	List<ValidOption> getOptions(String primaryFilterValue);

	/**
	 * Returns all the options supported. This is required to parse 
	 * all the command line options. 
	 * 
	 * @return
	 */
	Options getOptions();
	
	/**
	 * Returns the name of the primary Option.
	 * @return
	 */
	ValidOption getPrimaryOption();
}
