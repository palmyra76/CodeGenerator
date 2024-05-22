package com.palmyralabs.pcg.spring;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.processor.DataModelTemplateProcessor;

public class EntityTemplateProcessor extends DataModelTemplateProcessor {

	List<TemplateInfo> templates = new ArrayList<>();

	@Override
	public List<TemplateInfo> getTemplates() {
		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {		
		return options.getBaseOutputFolder().resolve("");
	}

	@Override
	public String getName() {		
		return "EntityGenerator";
	}

}
