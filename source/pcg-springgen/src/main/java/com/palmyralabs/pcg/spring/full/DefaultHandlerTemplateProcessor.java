package com.palmyralabs.pcg.spring.full;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class DefaultHandlerTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo abstractHandler = new DefaultTemplateInfo("AbstractHandler.java",
				"templates/full/abstractHandler.ftlh");
		templates.add(abstractHandler);

		TemplateInfo userManagementHandler = new DefaultTemplateInfo("UserManagementHandler.java",
				"templates/full/userManagementHandler.ftlh");
		templates.add(userManagementHandler);
		
		TemplateInfo userTypeHandler = new DefaultTemplateInfo("UserTypeHandler.java",
				"templates/full/userTypeHandler.ftlh");
		templates.add(userTypeHandler);

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
