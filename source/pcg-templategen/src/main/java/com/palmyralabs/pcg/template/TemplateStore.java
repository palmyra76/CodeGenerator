package com.palmyralabs.pcg.template;

import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.TemplateType;

public interface TemplateStore {
	List<TemplateInfo> getTemplates();

	String suggestedOutputPath(UserOptions options, TemplateInfo templateInfo);
	
	TemplateType getTemplateType();
}
