package com.palmyralabs.pcg.spring.extended;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SchemaModelTemplateProcessor;

public class ExtMySqlDataTemplateProcessor extends SchemaModelTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo createSql = new DefaultTemplateInfo("create.sql", "templates/extended/mySqlCreateData.ftlh");
		templates.add(createSql);

		TemplateInfo initialData = new DefaultTemplateInfo("initial_data.sql", "templates/extended/mySqlInitialData.ftlh");
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
