package com.palmyralabs.pcg.template.processor;

import java.util.List;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.generator.FileGenerator;
import com.palmyralabs.pcg.template.generator.FileGeneratorImpl;
import com.palmyralabs.pcg.template.generator.FileRef;

import lombok.SneakyThrows;

public abstract class SimpleTemplatorProcessor implements TemplateProcessor {

	@Override
	@SneakyThrows
	public void process(UserOptions userOptions, GeneratorContext context) {
		FileGenerator<Object> generator = new FileGeneratorImpl(userOptions.getBaseOutputFolder());

		for (TemplateInfo template : getTemplates()) {
			String outputPath = getOutputPath(template, userOptions);
			generator.generateSingleFile(new FileRef(template.getLocation(), outputPath), userOptions);
		}
	}

	protected abstract List<TemplateInfo> getTemplates();

	protected abstract String getOutputPath(TemplateInfo template, UserOptions options);
}
