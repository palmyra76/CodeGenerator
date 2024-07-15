package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class FullSourceTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo loginFormTSX = new DefaultTemplateInfo("main.tsx",
				"templates/base/mainTSXTemplate.ftlh");
		templates.add(loginFormTSX);
		
		TemplateInfo loginInputTSX = new DefaultTemplateInfo("App.tsx",
				"templates/full/appTSXTemplate.ftlh");
		templates.add(loginInputTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "SourcetTempProcessor";
	}

}
