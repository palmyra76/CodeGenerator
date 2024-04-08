package com.example.palmyralabs.projectgenerator.config;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import freemarker.template.Version;

public class TemplateConfig  {
	
	public static Configuration getFMTemplateConfig()throws TemplateException {
		var cfg = new Configuration(new Version("2.3.31"));
		cfg.setClassForTemplateLoading(TemplateConfig.class, "/views");
		cfg.setDefaultEncoding("UTF-8");
		return cfg;
	}
	
}
