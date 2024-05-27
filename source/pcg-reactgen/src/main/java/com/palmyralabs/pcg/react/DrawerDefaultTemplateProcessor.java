package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class DrawerDefaultTemplateProcessor extends SimpleTemplatorProcessor{
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo drwEditFormTSX = new DefaultTemplateInfo("EditForm.tsx",
				"templates/default_templates/drwEditFormTSXTemplate.ftlh");
		templates.add(drwEditFormTSX);

		TemplateInfo drwNewFormTSX = new DefaultTemplateInfo("NewForm.tsx",
				"templates/default_templates/drwNewFormTSXTemplate.ftlh");
		templates.add(drwNewFormTSX);

		TemplateInfo drwSaveFormTSX = new DefaultTemplateInfo("SaveForm.tsx",
				"templates/default_templates/drwSaveFormTSXTemplate.ftlh");
		templates.add(drwSaveFormTSX);

		TemplateInfo drwViewFormTSX = new DefaultTemplateInfo("ViewForm.tsx",
				"templates/default_templates/drwViewFormTSXTemplate.ftlh");
		templates.add(drwViewFormTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","templates","default","drawer");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "DrawerDefault";
	}

}
