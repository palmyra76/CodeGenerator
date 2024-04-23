package com.palmyralabs.pcg.template;

import java.io.IOException;

import freemarker.template.TemplateException;

public interface FileGenerator<T> {
	void generateFile(String path, String template, T data) throws IOException, TemplateException;
}
