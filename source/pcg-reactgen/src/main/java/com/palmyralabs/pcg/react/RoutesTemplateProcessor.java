package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SchemaModelTemplateProcessor;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class RoutesTemplateProcessor extends SchemaModelTemplateProcessor{
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo appRouts = new DefaultTemplateInfo("appRoutes.tsx",
				"templates/appRoutesTsxTemplate.ftlh");
		templates.add(appRouts);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","routes");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "appRoutes";
	}

}
