package com.palmyralabs.pcg.spring;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.processor.DataModelTemplateProcessor;

public class HandlerTemplateProcessor extends DataModelTemplateProcessor {

	List<TemplateInfo> templates = new ArrayList<>();

	@Override
	public List<TemplateInfo> getTemplates() {
		return templates;
	}

	@Override
	protected String getOutputPath(TemplateInfo template, UserOptions options) {		
		return "hello"; // TODO  change accordingly
	}

	@Override
	public String getName() {
		return "handler";
	}


}
