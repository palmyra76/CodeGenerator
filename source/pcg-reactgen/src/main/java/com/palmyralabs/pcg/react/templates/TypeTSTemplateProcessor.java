package com.palmyralabs.pcg.react.templates;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class TypeTSTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo typesTS = new DefaultTemplateInfo("Types.ts",
				"templates/typesTSTemplate.ftlh");
		templates.add(typesTS);
	
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","templates");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "TypeTS";
	}

}
