package com.palmyralabs.pcg.spring;

import java.util.Arrays;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.template.TemplateStore;
import com.palmyralabs.pcg.template.TemplateStoreProvider;

public class SpringTemplateStoreProvider implements TemplateStoreProvider {

	@Override
	public List<TemplateStore> getStores(UserOptions options) {
		return Arrays.asList(new HandlerTemplateStore(), new EntityTemplateStore());
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.SpringBoot;
	}

}
