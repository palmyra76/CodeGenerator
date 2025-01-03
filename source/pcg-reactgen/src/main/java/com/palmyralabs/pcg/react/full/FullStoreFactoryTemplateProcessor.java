package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class FullStoreFactoryTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo storeFactoryTS = new DefaultTemplateInfo("StoreFactory.ts", "templates/full/storeFactoryTS.ftlh");
		templates.add(storeFactoryTS);

		TemplateInfo errorToast = new DefaultTemplateInfo("errorToast.tsx", "templates/minimal/errorToastTsx.ftlh");
		templates.add(errorToast);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web", "src", "wire");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "storeFactory";
	}

}
