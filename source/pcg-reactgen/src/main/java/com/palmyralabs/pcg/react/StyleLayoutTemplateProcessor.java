package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class StyleLayoutTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo styleLayoutCSS = new DefaultTemplateInfo("Layout.CSS",
				"templates/main_layout_template/mainLayoutTSXTemplate.ftlh");
		templates.add(styleLayoutCSS);
		
		TemplateInfo styleLoginCSS = new DefaultTemplateInfo("Login.CSS",
				"templates/main_layout_template/sidebarTSXTemplate.ftlh");
		templates.add(styleLoginCSS);

		TemplateInfo styleSidebarCSS = new DefaultTemplateInfo("Sidebar.CSS",
				"templates/main_layout_template/topbarTSXTemplate.ftlh");
		templates.add(styleSidebarCSS);


		TemplateInfo styletopbarCSS = new DefaultTemplateInfo("Topbar.CSS",
				"templates/main_layout_template/topbarTSXTemplate.ftlh");
		templates.add(styletopbarCSS);
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","style","layout");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "StyleLayout";
	}

}
