package com.palmyralabs.pcg.spring;

import com.palmyralabs.pcg.template.TemplateStore;
import com.palmyralabs.pcg.template.TemplateStoreProvider;

public class SpringTemplateStoreProvider implements TemplateStoreProvider{

	@Override
	public TemplateStore getStore() {
		return new SpringTemplateStore();
	}

	@Override
	public boolean isSupported(String framework) {
		return framework.equals("spring");
	}
	
}
