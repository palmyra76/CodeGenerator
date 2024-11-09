package com.palmyralabs.pcg.react.extended;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class ComponentDialogTemplateProcessor extends SimpleTemplateProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo deleteconfirmDialog = new DefaultTemplateInfo("DeleteConfirmDialog.tsx",
				"templates/extended/deleteConfirmDialogTsx.ftlh");
		templates.add(deleteconfirmDialog);

		TemplateInfo deleteDialogContent = new DefaultTemplateInfo("DeleteDialogContent.tsx",
				"templates/extended/deleteDialogContentTsx.ftlh");
		templates.add(deleteDialogContent);

		TemplateInfo resetPasswordDialog = new DefaultTemplateInfo("ResetPasswordDialog.tsx",
				"templates/extended/resetPasswordDialogTsx.ftlh");
		templates.add(resetPasswordDialog);

		TemplateInfo dropdownPortal = new DefaultTemplateInfo("DropdownPortal.tsx",
				"templates/extended/dropDownPortalTsx.ftlh");
		templates.add(dropdownPortal);
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web", "src", "components", "dialog");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "storeFactory";
	}

}
