package com.palmyralabs.pcg.react.templates;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class SummaryEditTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo summaryedit = new DefaultTemplateInfo("EditForm.tsx",
				"templates/default_templates/editFormTSXTemplate.ftlh");
		templates.add(summaryedit);
	
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","templates","default","summaryEdit");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "SummaryEdit";
	}

}
