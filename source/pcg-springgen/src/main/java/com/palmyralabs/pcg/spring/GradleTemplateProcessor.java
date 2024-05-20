package com.palmyralabs.pcg.spring;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class GradleTemplateProcessor extends SimpleTemplatorProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo buildGradle = new DefaultTemplateInfo("build.gradle", "templates/buildGradle.ftlh");
		templates.add(buildGradle);
		
		TemplateInfo depsGradle = new DefaultTemplateInfo("deps.gradle", "templates/depsGradle.ftlh");
		templates.add(depsGradle);
		
		TemplateInfo settingsGradle = new DefaultTemplateInfo("settings.gradle", "templates/settingsGradle.ftlh");
		templates.add(settingsGradle);
		
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder().resolve("Service");
	}

	@Override
	public String getName() {		
		return "gradleBuild";
	}

}
