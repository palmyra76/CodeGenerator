package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class TabComponentTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo tabPanelTSX = new DefaultTemplateInfo("TabPanel.tsx",
				"templates/full/tabPanelTSXTemplate.ftlh");
		templates.add(tabPanelTSX);
	
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","components","tabs");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "TabComponent";
	}

}
