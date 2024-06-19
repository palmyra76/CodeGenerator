package com.palmyralabs.pcg.react.config;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SchemaModelTemplateProcessor;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class ServiceEndPointTemplateProcessor extends SchemaModelTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo endpoint = new DefaultTemplateInfo("ServiceEndpoints.ts",
				"templates/serviceEndPointTSTemplate.ftlh");
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
