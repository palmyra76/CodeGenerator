package com.palmyralabs.pcg.spring;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class SpringTemplateProcessorProvider implements TemplateProcessorProvider {

	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {
		List<TemplateProcessor> result = new ArrayList<>();

		result.add(new HandlerTemplateProcessor());
		result.add(new EntityTemplateProcessor());

		if (options.getBuildTool() == BuildTool.GRADLE)
			result.add(new GradleTemplateProcessor());
		else
			result.add(new MavenTemplateProcessor());

		return result;
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.SpringBoot;
	}

}
