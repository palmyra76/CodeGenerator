package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class SourceTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo loginFormTSX = new DefaultTemplateInfo("LoginForm.tsx",
				"templates/loginFormTSXTemplate.ftlh");
		templates.add(loginFormTSX);
		
		TemplateInfo loginInputTSX = new DefaultTemplateInfo("LoginInput.tsx",
				"templates/loginInputTSXTemplate.ftlh");
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
		return "LoginTSX";
	}

}
