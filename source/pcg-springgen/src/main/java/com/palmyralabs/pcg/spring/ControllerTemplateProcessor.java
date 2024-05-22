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

public class ControllerTemplateProcessor extends SimpleTemplatorProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo authenticationController = new DefaultTemplateInfo("AuthenticationController.java", "templates/authenticationController.ftlh");
		templates.add(authenticationController);
		
		TemplateInfo  baseController = new DefaultTemplateInfo("BaseController.java", "templates/baseController.ftlh");
		templates.add(baseController);
		
		TemplateInfo  globalExceptionHandler = new DefaultTemplateInfo("GlobalExceptionHandler.java", "templates/globalExceptionHandler.ftlh");
		templates.add(globalExceptionHandler);
		
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("src", "main", "java", String.join(File.separator, packageName), "controller");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {		
		return "controller";
	}

}
