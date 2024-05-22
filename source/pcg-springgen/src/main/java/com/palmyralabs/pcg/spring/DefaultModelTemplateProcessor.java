package com.palmyralabs.pcg.spring;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class DefaultModelTemplateProcessor extends SimpleTemplatorProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo errorResponse = new DefaultTemplateInfo("ErrorResponse.java",
				"templates/errorResponse.ftlh");
		templates.add(errorResponse);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("src", "main", "java", String.join(File.separator, packageName), "model");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "model";
	}

}
