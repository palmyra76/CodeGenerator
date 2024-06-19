package com.palmyralabs.pcg.spring.full;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class FullMySqlDataTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo createSql = new DefaultTemplateInfo("create.sql", "templates/full/mySqlCreateData.ftlh");
		templates.add(createSql);

		TemplateInfo initialData = new DefaultTemplateInfo("initial_data.sql", "templates/full/mySqlInitialData.ftlh");
		templates.add(initialData);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder().resolve("sql_scripts");
	}

	@Override
	public String getName() {
		return "mysql";
	}

}
