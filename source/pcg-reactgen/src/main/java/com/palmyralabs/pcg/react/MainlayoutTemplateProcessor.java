package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class MainlayoutTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo mainLayoutTSX = new DefaultTemplateInfo("MainLayout.tsx",
				"templates/main_layout_template/mainLayoutTSXTemplate.ftlh");
		templates.add(mainLayoutTSX);
		
		TemplateInfo sidebarTSX = new DefaultTemplateInfo("Sidebar.tsx",
				"templates/main_layout_template/sidebarTSXTemplate.ftlh");
		templates.add(sidebarTSX);

		TemplateInfo topbarTSX = new DefaultTemplateInfo("Topbar.tsx",
				"templates/main_layout_template/topbarTSXTemplate.ftlh");
		templates.add(topbarTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","layout","mainLayout");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "MainLayout";
	}

}
