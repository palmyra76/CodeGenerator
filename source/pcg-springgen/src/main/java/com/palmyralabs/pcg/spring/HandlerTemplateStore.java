package com.palmyralabs.pcg.spring;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.TemplateType;
import com.palmyralabs.pcg.template.TemplateStore;

public class HandlerTemplateStore implements TemplateStore {

	List<TemplateInfo> templates = new ArrayList<>();

	@Override
	public List<TemplateInfo> getTemplates() {
		return templates;
	}

	@Override
	public String suggestedOutputPath(UserOptions options, TemplateInfo templateInfo) {
		return "tbd";
	}

	@Override
	public TemplateType getTemplateType() {
		return TemplateType.DataModel;
	}

}
