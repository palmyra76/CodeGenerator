package com.palmyralabs.pcg.spring;

import java.util.Arrays;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class SpringTemplateProcessorProvider implements TemplateProcessorProvider {

	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {
		return Arrays.asList(new HandlerTemplateProcessor(), new EntityTemplateProcessor());
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.SpringBoot;
	}

}
