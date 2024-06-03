package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class StyleThemeOrangeColorTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		
		TemplateInfo colorsCSS = new DefaultTemplateInfo("Colors.css",
				"templates/orangeColorsCss.ftlh");
		templates.add(colorsCSS);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","style","themes","orange");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "colors";
	}

}
