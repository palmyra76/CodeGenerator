package com.palmyralabs.pcg.react.extended;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SchemaModelTemplateProcessor;

public class ExtServiceEndPointTemplateProcessor extends SchemaModelTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo endpoint = new DefaultTemplateInfo("ServiceEndpoints.ts",
				"templates/extended/serviceEndPointTSTemplate.ftlh");
		templates.add(endpoint);

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
