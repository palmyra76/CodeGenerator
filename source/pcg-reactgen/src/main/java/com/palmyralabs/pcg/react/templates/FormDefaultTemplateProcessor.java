package com.palmyralabs.pcg.react.templates;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class FormDefaultTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo frmEditFormTSX = new DefaultTemplateInfo("EditForm.tsx",
				"templates/default_templates/frmEditFormTSXTemplate.ftlh");
		templates.add(frmEditFormTSX);
		
		TemplateInfo frmMenuFormTSX = new DefaultTemplateInfo("MenuForm.tsx",
				"templates/default_templates/frmMenuFormTSXTemplate.ftlh");
		templates.add(frmMenuFormTSX);

		TemplateInfo frmNewFormTSX = new DefaultTemplateInfo("NewForm.tsx",
				"templates/default_templates/frmNewFormTSXTemplate.ftlh");
		templates.add(frmNewFormTSX);

		TemplateInfo frmSaveFormTSX = new DefaultTemplateInfo("SaveForm.tsx",
				"templates/default_templates/frmSaveFormTSXTemplate.ftlh");
		templates.add(frmSaveFormTSX);

		TemplateInfo frmViewFormTSX = new DefaultTemplateInfo("ViewForm.tsx",
				"templates/default_templates/frmViewFormTSXTemplate.ftlh");
		templates.add(frmViewFormTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","templates","default","form");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "FormDefault";
	}

}
