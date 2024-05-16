package com.palmyralabs.pcg.validator;

import java.util.List;

public interface InputValidator {

	List<KeyValue> validate(OptionsProvider optionsProvider, String[] command);

}
