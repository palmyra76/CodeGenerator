package com.palmyralabs.pcg.react;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class ReactTemplateProcessorProvider implements TemplateProcessorProvider {
	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {

		List<TemplateProcessor> result = new ArrayList<>();

		if (options.getBuildTool() == BuildTool.VITE)
			result.add(new ViteBuildProcessor());
//		else
		// result.add(new MavenTemplateProcessor());
		return result;
		
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.React;
	}

}
