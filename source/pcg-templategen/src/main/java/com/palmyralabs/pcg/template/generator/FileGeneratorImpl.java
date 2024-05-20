package com.palmyralabs.pcg.template.generator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import com.palmyralabs.pcg.commons.exception.TemplateProcessingException;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class FileGeneratorImpl implements FileGenerator<Object> {

	private final TemplateFactory templateStore = new TemplateFactory();
	private final Path baseFolder;

	@Override
	public void generateSingleFile(TargetFileInfo fileRef, Object data) throws IOException {
		try {
			Template template = templateStore.getTemplate(fileRef.getTemplateName());
			Path outputPath = fileRef.getOutputFilePath().resolve(fileRef.getOutputFile());
			createFolder(outputPath.getParent().toString());
			FileWriter fileWriter = new FileWriter(outputPath.toFile());
			template.process(data, fileWriter);
			fileWriter.close();
		} catch (Exception e) {
			throw new TemplateProcessingException("Error while processing the template", e);
		}
	}

	@Override
	public void generateMultipleFiles(List<TargetFileInfo> fileRefs, Object data)
			throws IOException, TemplateException {
		for (TargetFileInfo fileRef : fileRefs) {
			Template template = templateStore.getTemplate(fileRef.getTemplateName());
			FileWriter fileWriter = new FileWriter(new File(baseFolder + "/" + fileRef.getOutputFilePath()));
			template.process(data, fileWriter);

			fileWriter.close();
		}
	}

	public void createFolder(String path) {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
	}

}
