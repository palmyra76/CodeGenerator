package com.palmyralabs.pcg.spring.minimal;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class MiniGradleTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		TemplateInfo buildGradle = new DefaultTemplateInfo("build.gradle", "templates/minimal/buildGradle.ftlh");
		templates.add(buildGradle);
		
		TemplateInfo depsGradle = new DefaultTemplateInfo("deps.gradle", "templates/base/depsGradle.ftlh");
		templates.add(depsGradle);
		
		TemplateInfo settingsGradle = new DefaultTemplateInfo("settings.gradle", "templates/base/settingsGradle.ftlh");
		templates.add(settingsGradle);
		
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder().resolve("service");
	}

	@Override
	public String getName() {		
		return "gradleBuild";
	}

}
