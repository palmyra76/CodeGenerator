package com.palmyralabs.pcg.template;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import com.palmyralabs.pcg.commons.exception.TemplateProcessingException;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
class FileGeneratorImpl implements FileGenerator<Object> {

	private final TemplateFactory templateStore;
	private final String baseFolder;

	@Override
	public void generateSingleFile(FileRef fileRef, Object data) throws IOException {
		try {
			Template template = templateStore.getTemplate(fileRef.getTemplateName());
			FileWriter fileWriter = new FileWriter(new File(baseFolder + "/" + fileRef.getOutputFilePath()));
			template.process(data, fileWriter);
			fileWriter.close();
		} catch (Exception e) {
			throw new TemplateProcessingException("Error while processing the template", e);
		}
	}

	@Override
	public void generateMultipleFiles(List<FileRef> fileRefs, Object data) throws IOException, TemplateException {
		for (FileRef fileRef : fileRefs) {
			Template template = templateStore.getTemplate(fileRef.getTemplateName());
			FileWriter fileWriter = new FileWriter(new File(baseFolder + "/" + fileRef.getOutputFilePath()));
			template.process(data, fileWriter);
			fileWriter.close();
		}

	}

}
