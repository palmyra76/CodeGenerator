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

public class ControllerTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo baseController = new DefaultTemplateInfo("BaseController.java", "templates/full/baseController.ftlh");
		templates.add(baseController);

		TemplateInfo globalExceptionHandler = new DefaultTemplateInfo("GlobalExceptionHandler.java",
				"templates/full/globalExceptionHandler.ftlh");
		templates.add(globalExceptionHandler);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("service", "src", "main", "java", String.join(File.separator, packageName), "controller");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "controller";
	}

}
