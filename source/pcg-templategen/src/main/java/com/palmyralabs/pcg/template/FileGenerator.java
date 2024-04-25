package com.palmyralabs.pcg.template;

import java.io.IOException;
import java.util.List;

import freemarker.template.TemplateException;

public interface FileGenerator<T> {
	void generateSingleFile(FileRef fileRef, T data) throws IOException, TemplateException;

	void generateMultipleFiles(List<FileRef> fileRefs, T data) throws IOException, TemplateException;
}
