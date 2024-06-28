package com.palmyralabs.pcg.react.minimal;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.DataModelPathTemplateProcessor;

public class ComponentTemplateProcessor extends DataModelPathTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo grid = new DefaultTemplateInfo("Page.tsx",
				"templates/gridTemplate.ftlh");
		templates.add(grid);
		
		TemplateInfo newFormTsx = new DefaultTemplateInfo("NewPage.tsx",
				"templates/newFormTsxTemplate.ftlh");
		templates.add(newFormTsx);
		
		TemplateInfo editFormTsx = new DefaultTemplateInfo("EditPage.tsx",
				"templates/editFormTsxTemplate.ftlh");
		templates.add(editFormTsx);
		
		TemplateInfo viewFormTsx = new DefaultTemplateInfo("ViewPage.tsx",
				"templates/viewFormTsxTemplate.ftlh");
		templates.add(viewFormTsx);
	
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","components","test");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "component";
	}

}
