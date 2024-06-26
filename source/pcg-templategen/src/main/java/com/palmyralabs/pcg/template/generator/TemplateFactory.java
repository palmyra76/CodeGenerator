package com.palmyralabs.pcg.template.generator;

import java.io.IOException;

import com.palmyralabs.pcg.commons.exception.TemplateNotFoundException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;

public class TemplateFactory {
	private Configuration cfg;

	public TemplateFactory() {
		String freemarkerVersion = Configuration.getVersion().toString();
		cfg = new Configuration(new Version(freemarkerVersion));
		cfg.setClassForTemplateLoading(this.getClass(), "/");
		cfg.setDefaultEncoding("UTF-8");
	}

	public Template getTemplate(String templateName) throws IOException {
		try {
			return cfg.getTemplate(templateName);
		} catch (Exception e) {
			throw new TemplateNotFoundException(templateName, e);
		}
	}

}
