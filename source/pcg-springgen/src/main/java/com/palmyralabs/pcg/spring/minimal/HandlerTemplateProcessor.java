package com.palmyralabs.pcg.spring.minimal;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.DataModelTemplateProcessor;

public class HandlerTemplateProcessor extends DataModelTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo handler = new DefaultTemplateInfo("Handler.java", "templates/minimal/handler.ftlh");
		templates.add(handler);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("service", "src", "main", "java", String.join(File.separator, packageName), "handler");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "handler";
	}

}
