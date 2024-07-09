package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class FormLayoutTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo formLayoutcss = new DefaultTemplateInfo("FormLayout.css",
				"templates/full/formLayoutCSS.ftlh");
		templates.add(formLayoutcss);
		
		TemplateInfo muiXTreeMenuCss = new DefaultTemplateInfo("MuiXTreeMenu.css",
				"templates/full/muiXTreeMenuCss.ftlh");
		templates.add(muiXTreeMenuCss);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","style","layout","rui");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "formLayout";
	}


}
