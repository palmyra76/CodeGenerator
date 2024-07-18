package com.palmyralabs.pcg.spring.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.DataSourceTemplateProcessor;

public class ApplicationTemplateProcessor extends DataSourceTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		TemplateInfo application = new DefaultTemplateInfo("application.yaml", "templates/base/application.ftlh");
		templates.add(application);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("service", "src", "main", "resources");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "gradleBuild";
	}

}
