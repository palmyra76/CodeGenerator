package com.palmyralabs.pcg.react.full;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class StyleLayoutTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo styleLayoutCSS = new DefaultTemplateInfo("Layout.css",
				"templates/layoutCSSTemplate.ftlh");
		templates.add(styleLayoutCSS);
		
		TemplateInfo styleLoginCSS = new DefaultTemplateInfo("Login.css",
				"templates/loginCSSTemplate.ftlh");
		templates.add(styleLoginCSS);

		TemplateInfo styleSidebarCSS = new DefaultTemplateInfo("Sidebar.css",
				"templates/sidebarCSSTemplate.ftlh");
		templates.add(styleSidebarCSS);


		TemplateInfo styletopbarCSS = new DefaultTemplateInfo("Topbar.css",
				"templates/topbarCSSTemplate.ftlh");
		templates.add(styletopbarCSS);
		
		TemplateInfo ruilayoutCSS = new DefaultTemplateInfo("RuiLayout.css",
				"templates/ruiLayoutCSS.ftlh");
		templates.add(ruilayoutCSS);
		
		TemplateInfo layoutColorsCSS = new DefaultTemplateInfo("layoutColors.css",
				"templates/layoutColorsCSS.ftlh");
		templates.add(layoutColorsCSS);
		
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
