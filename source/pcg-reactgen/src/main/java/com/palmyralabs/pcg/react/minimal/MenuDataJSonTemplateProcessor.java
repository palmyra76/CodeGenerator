package com.palmyralabs.pcg.react.minimal;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SchemaModelTemplateProcessor;

public class MenuDataJSonTemplateProcessor extends SchemaModelTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo menuDataJsonTemplate = new DefaultTemplateInfo("menuData.json",
				"templates/minimal/menuDataJsonTemplate.ftlh");
		templates.add(menuDataJsonTemplate);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","public","data");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "MenuData";
	}

}
