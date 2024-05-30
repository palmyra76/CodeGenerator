package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class StyleLayoutThemeTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		TemplateInfo colorDefCSS = new DefaultTemplateInfo("colorDef.css",
				"templates/colorDefCSS.ftlh");
		templates.add(colorDefCSS);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","style","themes");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "colorDef";
	}


}
