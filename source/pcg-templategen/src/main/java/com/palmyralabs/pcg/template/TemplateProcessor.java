package com.palmyralabs.pcg.template;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.UserOptions;

public interface TemplateProcessor {
	void process(UserOptions userOptions, GeneratorContext context);
	String getName();
}
