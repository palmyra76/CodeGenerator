package com.palmyralabs.pcg.react;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class UserApplicationTemplateProcessor extends SimpleTemplatorProcessor{
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo userApplicationTSX = new DefaultTemplateInfo("UserApplication.tsx",
				"templates/user_group_management/user/userApplictionTSXTemplate.ftlh");
		templates.add(userApplicationTSX);

		TemplateInfo userApplicationGridTSX = new DefaultTemplateInfo("UserApplicationGrid.tsx",
				"templates/user_group_management/user/userApplictionGridTSXTemplate.ftlh");
		templates.add(userApplicationGridTSX );
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","pages","userManagement","user","userApplication");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "UserApplication";
	}

}
