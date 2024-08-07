package com.palmyralabs.pcg.react.extended;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class UserGroupTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo userGroupGridTSX = new DefaultTemplateInfo("UserGroupGrid.tsx",
				"templates/extended/userGroupGridTSXTemplate.ftlh");
		templates.add(userGroupGridTSX);

		TemplateInfo userGroupTSX = new DefaultTemplateInfo("UsersGroup.tsx",
				"templates/extended/userGroupTSXTemplate.ftlh");
		templates.add(userGroupTSX);

		TemplateInfo userViewFormTSX = new DefaultTemplateInfo("UserViewForm.tsx",
				"templates/extended/userViewFormTSX.ftlh");
		templates.add(userViewFormTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","pages","userManagement","user","userGroup");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "UserGroup";
	}


}
