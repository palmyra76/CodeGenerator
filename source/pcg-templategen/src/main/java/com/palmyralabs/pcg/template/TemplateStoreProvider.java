package com.palmyralabs.pcg.template;

public interface TemplateStoreProvider {
	TemplateStore getStore();
	boolean isSupported(String framework); // TODO framework to be ENUM
}
