package com.palmyralabs.pcg.spring;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class GradleTemplateProcessor extends SimpleTemplatorProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		return templates;
	}

	@Override
	protected String getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder() + "/src"; // TODO change base folder accordingly
	}

	@Override
	public String getName() {		
		return "gradleBuild";
	}

}
