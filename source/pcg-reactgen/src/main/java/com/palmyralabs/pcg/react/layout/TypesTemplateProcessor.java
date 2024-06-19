package com.palmyralabs.pcg.react.layout;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class TypesTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo typesTs = new DefaultTemplateInfo("types.ts", "templates/typeTs.ftlh");
		templates.add(typesTs);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web", "src", "layout");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "Types";
	}

}
