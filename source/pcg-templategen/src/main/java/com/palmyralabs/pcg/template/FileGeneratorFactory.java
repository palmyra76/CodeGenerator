package com.palmyralabs.pcg.template;

import java.util.ServiceLoader;

public class FileGeneratorFactory {
	public static FileGenerator<Object> getFileGenerator(String framework, String outputFolder) {
		TemplateStore ts = getStore(framework);
		TemplateFactory tf = new TemplateFactory(ts);
		return new FileGeneratorImpl(tf, outputFolder);
	}

	private static TemplateStore getStore(String framework) {
		ServiceLoader<TemplateStoreProvider> loaders = ServiceLoader.load(TemplateStoreProvider.class);

		for (TemplateStoreProvider tsp : loaders) {
			if (tsp.isSupported(framework))
				return tsp.getStore();
		}
		throw new RuntimeException("Given framework " + framework + " is not supported");
	}
}
