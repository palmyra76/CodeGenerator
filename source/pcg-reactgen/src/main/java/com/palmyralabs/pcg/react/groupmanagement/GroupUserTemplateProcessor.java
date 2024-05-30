package com.palmyralabs.pcg.react.groupmanagement;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class GroupUserTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo groupUserGridTSX = new DefaultTemplateInfo("GroupUserGrid.tsx",
				"templates/user_group_management/group/groupUserGridTSXTemplate.ftlh");
		templates.add(groupUserGridTSX);

		TemplateInfo userPageTSX = new DefaultTemplateInfo("UserPage.tsx",
				"templates/user_group_management/group/userPageTSXTemplate.ftlh");
		templates.add(userPageTSX);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","pages","userManagement","group","groupUser");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "Groupuser";
	}


	

}
