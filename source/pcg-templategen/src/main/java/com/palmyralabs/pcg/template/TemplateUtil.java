package com.palmyralabs.pcg.template;

import java.io.IOException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.Version;

public class TemplateUtil {
	Configuration cfg;

	public Configuration getFMTemplateConfig() throws TemplateException {
		cfg = new Configuration(new Version("2.3.31"));
		cfg.setClassForTemplateLoading(TemplateUtil.class, "/templates");
		cfg.setDefaultEncoding("UTF-8");
		return cfg;
	}

	public Template getTemplate(String templateName) throws TemplateException, IOException {
		return cfg.getTemplate(templateName + ".ftlh");
	}

}
