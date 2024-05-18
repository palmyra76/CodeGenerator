package com.palmyralabs.pcg.template;

import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;

public interface TemplateProcessorProvider {
	List<TemplateProcessor> getProcessors(UserOptions options);

	boolean isSupported(UserOptions options);
}
