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
		
		TemplateInfo userManagementHandler = new DefaultTemplateInfo("UserManagementHandler.java",
				"templates/full/userManagementHandler.ftlh");
		templates.add(userManagementHandler);
		
		TemplateInfo userTypeHandler = new DefaultTemplateInfo("UserTypeHandler.java",
				"templates/full/userTypeHandler.ftlh");
		templates.add(userTypeHandler);
		
		TemplateInfo aboutUserHandler = new DefaultTemplateInfo("AboutUserHandler.java",
				"templates/full/aboutUserHandler.ftlh");
		templates.add(aboutUserHandler);

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
