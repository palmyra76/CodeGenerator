package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class IndexTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		TemplateInfo indexTSX = new DefaultTemplateInfo("index.tsx",
				"templates/full/indexTSXTemplate.ftlh");
		templates.add(indexTSX);
		
		TemplateInfo pageWrapper = new DefaultTemplateInfo("PageWrapper.tsx",
				"templates/full/pageWrapperTSXTemplate.ftlh");
		templates.add(pageWrapper);

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
