package com.palmyralabs.pcg.react.extended;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class GridControlTemplateProcessor extends SimpleTemplateProcessor {
	
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo dataGridControls = new DefaultTemplateInfo("DataGridControls.tsx",
				"templates/extended/dataGridControlsTsx.ftlh");
		templates.add(dataGridControls);

		TemplateInfo popupGridControls = new DefaultTemplateInfo("PopupGridControls.tsx",
				"templates/extended/popupGridControlsTsx.ftlh");
		templates.add(popupGridControls);

		TemplateInfo summaryGridControls = new DefaultTemplateInfo("SummaryGridControls.tsx",
				"templates/extended/summaryGridControlsTsx.ftlh");
		templates.add(summaryGridControls);

		TemplateInfo types = new DefaultTemplateInfo("types.ts", "templates/extended/gridcontrolTypesTs.ftlh");
		templates.add(types);
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web", "src", "components", "gridControl");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "gridControls";
	}

}
