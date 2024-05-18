package com.palmyralabs.pcg.template.processor;

import java.util.List;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.TemplateProcessor;

public abstract class DataModelTemplateProcessor implements TemplateProcessor{

	@Override
	public void process(UserOptions userOptions, GeneratorContext context) {
		
	}
	
	protected abstract List<TemplateInfo> getTemplates();

	protected abstract String getOutputPath(TemplateInfo template, UserOptions options);
}
