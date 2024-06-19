package com.palmyralabs.pcg.spring.full;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class MavenTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder().resolve("src");
	}

	@Override
	public String getName() {		
		return "gradleBuild";
	}

}
