package com.palmyralabs.pcg.react.usermanagement;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class UserTemplateProcessor extends SimpleTemplateProcessor{

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo userEditPageTSX = new DefaultTemplateInfo("UserEditPage.tsx",
				"templates/user_group_management/user/userEditPageTSXTemplate.ftlh");
		templates.add(userEditPageTSX);

		TemplateInfo userNewPageTSX = new DefaultTemplateInfo("UserNewPage.tsx",
				"templates/user_group_management/user/userNewPageTSXTemplate.ftlh");
		templates.add(userNewPageTSX);

		TemplateInfo userPageTSX = new DefaultTemplateInfo("UserPage.tsx",
				"templates/user_group_management/user/userPageTSXTemplate.ftlh");
		templates.add(userPageTSX);

		TemplateInfo userViewFormTSX = new DefaultTemplateInfo("UserViewForm.tsx",
				"templates/user_group_management/user/userViewFormTSXTemplate.ftlh");
		templates.add(userViewFormTSX);
		
		TemplateInfo userViewPageTSX = new DefaultTemplateInfo("UserViewPage.tsx",
				"templates/user_group_management/user/userViewPageTSXTemplate.ftlh");
		templates.add(userViewPageTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","pages","userManagement", "user");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "UserTemplate";
	}

}
