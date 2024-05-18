package com.palmyralabs.pcg.template;

import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;

public interface TemplateStoreProvider {
	List<TemplateStore> getStores(UserOptions options);

	boolean isSupported(UserOptions options);
}
