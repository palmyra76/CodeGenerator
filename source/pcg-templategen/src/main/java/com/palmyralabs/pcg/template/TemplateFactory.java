package com.palmyralabs.pcg.template;

import java.io.IOException;

import com.palmyralabs.pcg.commons.exception.TemplateNotFoundException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;

public class TemplateFactory {
	private Configuration cfg;
	private TemplateStore store;

	public TemplateFactory(TemplateStore store) {
		String freemarkerVersion = Configuration.getVersion().toString();
		cfg = new Configuration(new Version(freemarkerVersion));
		cfg.setClassForTemplateLoading(store.getClass(), "/templates");
		cfg.setDefaultEncoding("UTF-8");
		this.store = store;
	}

	public Template getTemplate(String templateName) throws IOException {
		try {
			return cfg.getTemplate(store.getTemplate(templateName) + ".ftlh");
		} catch (Exception e) {
			throw new TemplateNotFoundException(templateName, e);
		}
	}

}
