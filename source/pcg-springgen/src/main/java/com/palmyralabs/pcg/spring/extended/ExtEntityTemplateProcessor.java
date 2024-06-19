package com.palmyralabs.pcg.spring.extended;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class ExtEntityTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo userEntity = new DefaultTemplateInfo("UserEntity.java", "templates/extended/userEntity.ftlh");
		templates.add(userEntity);
		
		TemplateInfo menuEntity = new DefaultTemplateInfo("MenuEntity.java", "templates/extended/menuEntity.ftlh");
		templates.add(menuEntity);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("service", "src", "main", "java", String.join(File.separator, packageName), "entity");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "entity";
	}

}
