package com.palmyralabs.pcg.react.templates;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class GridDefaultTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo dialogGridTSX = new DefaultTemplateInfo("SummaryDialogGrid.tsx",
				"templates/default_templates/summaryDialogGridTSXTemplate.ftlh");
		templates.add(dialogGridTSX);
		
		TemplateInfo drawerGridTSX = new DefaultTemplateInfo("SummaryDrawerGrid.tsx",
				"templates/default_templates/summaryDrawerGridTSXTemplate.ftlh");
		templates.add(drawerGridTSX);

		TemplateInfo editGridTSX = new DefaultTemplateInfo("SummaryEditGrid.tsx",
				"templates/default_templates/summaryEditGridTSXTemplate.ftlh");
		templates.add(editGridTSX);

		TemplateInfo gridTSX = new DefaultTemplateInfo("SummaryGrid.tsx",
				"templates/default_templates/summaryGridTSXTemplate.ftlh");
		templates.add(gridTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","templates","default","grid");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "GridDefault";
	}
}
