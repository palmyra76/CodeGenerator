package com.palmyralabs.pcg.validator;

import java.util.List;

import com.palmyralabs.pcg.commons.KeyValue;

public interface InputValidator {

	List<KeyValue> validate(OptionsProvider optionsProvider, String[] command);

}
