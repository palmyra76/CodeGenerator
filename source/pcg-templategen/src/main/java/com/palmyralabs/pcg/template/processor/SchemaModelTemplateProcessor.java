package com.palmyralabs.pcg.template.processor;

import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.Table;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.generator.FileGenerator;
import com.palmyralabs.pcg.template.generator.FileGeneratorImpl;
import com.palmyralabs.pcg.template.generator.TargetFileInfo;

import lombok.SneakyThrows;

public abstract class SchemaModelTemplateProcessor implements TemplateProcessor {

	@Override
	@SneakyThrows
	public void process(UserOptions userOptions, GeneratorContext context) {
		FileGenerator<Object> generator = new FileGeneratorImpl(userOptions.getBaseOutputFolder());
		Map<String, Map<String, Table>> tables = new HashMap<String, Map<String, Table>>();
		tables.put("tables",context.getTables());
		for (TemplateInfo template : getTemplates()) {
			Path outputPath = getOutputPath(template, userOptions);
			TargetFileInfo target = new TargetFileInfo(template.getFileLocation(), template.getName(), outputPath);
			generator.generateSingleFile(target, tables);
		}
	}

	protected abstract List<TemplateInfo> getTemplates();

	protected abstract Path getOutputPath(TemplateInfo template, UserOptions options);
}
