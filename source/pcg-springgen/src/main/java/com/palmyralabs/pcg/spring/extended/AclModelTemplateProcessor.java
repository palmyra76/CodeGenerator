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

public class AclModelTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo aclMenuModel = new DefaultTemplateInfo("AclMenuModel.java", "templates/extended/aclMenuModel.ftlh");
		templates.add(aclMenuModel);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("service", "src", "main", "java", String.join(File.separator, packageName), "model");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "model";
	}

}
