package com.palmyralabs.pcg.template;

import java.util.ArrayList;
import java.util.List;
import java.util.ServiceLoader;

import com.palmyralabs.pcg.commons.UserOptions;

public class TemplateProcessorFactory {

	public static List<TemplateProcessor> getProcessors(UserOptions options) {
		ServiceLoader<TemplateProcessorProvider> loaders = ServiceLoader.load(TemplateProcessorProvider.class);
		List<TemplateProcessor> result = new ArrayList<TemplateProcessor>();

		for (TemplateProcessorProvider tsp : loaders) {
			if (tsp.isSupported(options))
				result.addAll(tsp.getProcessors(options));
		}
		return result;
	}
}
