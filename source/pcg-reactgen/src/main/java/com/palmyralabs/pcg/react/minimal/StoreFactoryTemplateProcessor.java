package com.palmyralabs.pcg.react.minimal;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class StoreFactoryTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo storeFactoryTS = new DefaultTemplateInfo("StoreFactory.ts",
				"templates/minimal/storeFactoryTS.ftlh");
		templates.add(storeFactoryTS);
		
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","components","wire");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "storeFactory";
	}

}
