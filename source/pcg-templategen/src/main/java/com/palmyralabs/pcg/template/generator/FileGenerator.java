package com.palmyralabs.pcg.template.generator;

import java.io.IOException;
import java.util.List;

import freemarker.template.TemplateException;

public interface FileGenerator<T> {
	void generateSingleFile(TargetFileInfo fileRef, T data) throws IOException, TemplateException;

	void generateMultipleFiles(List<TargetFileInfo> fileRefs, T data) throws IOException, TemplateException;
}
