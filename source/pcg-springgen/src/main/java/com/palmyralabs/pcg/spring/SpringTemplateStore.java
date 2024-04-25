package com.palmyralabs.pcg.spring;

import com.palmyralabs.pcg.template.TemplateStore;

public class SpringTemplateStore implements TemplateStore{

	@Override
	public String getTemplate(String key) {
		return key;
	}

}
