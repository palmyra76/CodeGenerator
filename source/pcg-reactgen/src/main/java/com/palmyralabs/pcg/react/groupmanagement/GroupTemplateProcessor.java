package com.palmyralabs.pcg.react.groupmanagement;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class GroupTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo editGroupPageTSX = new DefaultTemplateInfo("EditGroupPage.tsx",
				"templates/user_group_management/group/editGroupPageTSXTemplate.ftlh");
		templates.add(editGroupPageTSX);

		TemplateInfo groupPageTSX = new DefaultTemplateInfo("GroupPage.tsx",
				"templates/user_group_management/group/groupPageTSXTemplate.ftlh");
		templates.add(groupPageTSX);

		TemplateInfo newGroupPageTSX = new DefaultTemplateInfo("NewGroupPage.tsx",
				"templates/user_group_management/group/newGroupPageTSXTemplate.ftlh");
		templates.add(newGroupPageTSX);

		TemplateInfo viewGroupFormTSX = new DefaultTemplateInfo("ViewGroupForm.tsx",
				"templates/user_group_management/group/viewGroupFormTSXTemplate.ftlh");
		templates.add(viewGroupFormTSX);

		TemplateInfo viewGroupPage = new DefaultTemplateInfo("ViewGroupPage.tsx",
				"templates/user_group_management/group/viewGroupFormTSXTemplate.ftlh");
		templates.add(viewGroupPage);
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","pages","userManagement","group");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "UserManagementrGroup";
	}


}
