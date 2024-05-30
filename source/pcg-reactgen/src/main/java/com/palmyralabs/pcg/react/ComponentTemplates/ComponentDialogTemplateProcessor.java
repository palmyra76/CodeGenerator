package com.palmyralabs.pcg.react.ComponentTemplates;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;

public class ComponentDialogTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo deleteconfirmDialog = new DefaultTemplateInfo("DeleteConfirmDialog.tsx",
				"templates/deleteConfirmDialogTemplate.ftlh");
		templates.add(deleteconfirmDialog);
		
		TemplateInfo resetPasswordDialog= new DefaultTemplateInfo("ResetPasswordDialog.tsx",
				"templates/resetPasswordDialogTemplate.ftlh");
		templates.add(deleteconfirmDialog);
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		Path path = Paths.get("web","src","components","dialog");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "storeFactory";
	}

}
