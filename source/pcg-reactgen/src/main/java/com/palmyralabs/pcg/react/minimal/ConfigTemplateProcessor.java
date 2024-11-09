package com.palmyralabs.pcg.react.minimal;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class ConfigTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo titleConfig = new DefaultTemplateInfo("TitleConfig.ts", "templates/minimal/titleConfigTS.ftlh");
		templates.add(titleConfig);

		TemplateInfo widthConfig = new DefaultTemplateInfo("WidthConfig.ts", "templates/minimal/widthConfigTs.ftlh");
		templates.add(widthConfig);

		TemplateInfo notFoundPage = new DefaultTemplateInfo("NotFoundPage.tsx",
				"templates/minimal/notFoundPageTsx.ftlh");
		templates.add(notFoundPage);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web", "src", "config");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "ServiceEndpoint";
	}

}
