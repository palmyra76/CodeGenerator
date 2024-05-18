package com.palmyralabs.pcg.template;

import java.util.ArrayList;
import java.util.List;
import java.util.ServiceLoader;

import com.palmyralabs.pcg.commons.UserOptions;

public class FileGeneratorFactory {

	public static List<TemplateStore> getStore(UserOptions options) {
		ServiceLoader<TemplateStoreProvider> loaders = ServiceLoader.load(TemplateStoreProvider.class);
		List<TemplateStore> result = new ArrayList<TemplateStore>();

		for (TemplateStoreProvider tsp : loaders) {
			if (tsp.isSupported(options))
				result.addAll(tsp.getStores(options));
		}
		return result;
	}
}
