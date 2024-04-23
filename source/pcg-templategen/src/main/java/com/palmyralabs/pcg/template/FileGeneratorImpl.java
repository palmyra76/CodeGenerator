package com.palmyralabs.pcg.template;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;

public class FileGeneratorImpl implements FileGenerator<Object> {
	
	TemplateUtil templateUtil;
	
	@Autowired
	public FileGeneratorImpl(TemplateUtil templateUtil) {
		this.templateUtil = templateUtil;
	}

	@Override
	public void generateFile(String path, String templateName, Object data) throws IOException, TemplateException {
		Template template=templateUtil.getTemplate(templateName);
		FileWriter fileWriter = new FileWriter(new File(path));
		template.process(data, fileWriter);
		fileWriter.close();
	}

}
