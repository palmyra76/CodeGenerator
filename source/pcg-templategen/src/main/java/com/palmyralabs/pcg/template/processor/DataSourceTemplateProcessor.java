package com.palmyralabs.pcg.template.processor;

import java.nio.file.Path;
import java.util.List;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.generator.FileGenerator;
import com.palmyralabs.pcg.template.generator.FileGeneratorImpl;
import com.palmyralabs.pcg.template.generator.TargetFileInfo;

import lombok.SneakyThrows;

public abstract class DataSourceTemplateProcessor implements TemplateProcessor {

	@Override
	@SneakyThrows
	public void process(UserOptions userOptions, GeneratorContext context) {
		FileGenerator<Object> generator = new FileGeneratorImpl(userOptions.getBaseOutputFolder());

		for (TemplateInfo template : getTemplates()) {
			Path outputPath = getOutputPath(template, userOptions);
			TargetFileInfo target = new TargetFileInfo(template.getFileLocation(), template.getName(), outputPath);
			generator.generateSingleFile(target, context.getDataSourceOptions());
		}
	}

	protected abstract List<TemplateInfo> getTemplates();

	protected abstract Path getOutputPath(TemplateInfo template, UserOptions options);
}
