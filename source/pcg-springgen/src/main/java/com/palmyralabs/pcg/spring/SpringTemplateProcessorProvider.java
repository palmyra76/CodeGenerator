package com.palmyralabs.pcg.spring;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;
import com.palmyralabs.pcg.spring.extended.AclHandlerTemplateProcessor;
import com.palmyralabs.pcg.spring.extended.AclModelTemplateProcessor;
import com.palmyralabs.pcg.spring.extended.ExtEntityTemplateProcessor;
import com.palmyralabs.pcg.spring.extended.ExtMySqlDataTemplateProcessor;
import com.palmyralabs.pcg.spring.extended.ExtSecurityConfigTemplateProcessor;
import com.palmyralabs.pcg.spring.full.ApplicationTemplateProcessor;
import com.palmyralabs.pcg.spring.full.ControllerTemplateProcessor;
import com.palmyralabs.pcg.spring.full.DefaultHandlerTemplateProcessor;
import com.palmyralabs.pcg.spring.full.DefaultModelTemplateProcessor;
import com.palmyralabs.pcg.spring.full.FullEntityTemplateProcessor;
import com.palmyralabs.pcg.spring.full.FullMySqlDataTemplateProcessor;
import com.palmyralabs.pcg.spring.full.FullGradleTemplateProcessor;
import com.palmyralabs.pcg.spring.full.MavenTemplateProcessor;
import com.palmyralabs.pcg.spring.full.RepoTemplateProcessor;
import com.palmyralabs.pcg.spring.full.FullSecurityConfigTemplateProcessor;
import com.palmyralabs.pcg.spring.full.ServiceTemplateProcessor;
import com.palmyralabs.pcg.spring.minimal.HandlerTemplateProcessor;
import com.palmyralabs.pcg.spring.minimal.MainClassTemplateProcessor;
import com.palmyralabs.pcg.spring.minimal.ModelTemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class SpringTemplateProcessorProvider implements TemplateProcessorProvider {

	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {
		List<TemplateProcessor> result = new ArrayList<>();

		if (options.getMode() == Mode.Extended) {

			if (options.getBuildTool() == BuildTool.GRADLE) {
				result.add(new FullGradleTemplateProcessor());
				result.add(new ApplicationTemplateProcessor());
			} else {
				result.add(new MavenTemplateProcessor());
			}

			result.add(new ExtMySqlDataTemplateProcessor());
			result.add(new ControllerTemplateProcessor());
			result.add(new ExtEntityTemplateProcessor());
			result.add(new ServiceTemplateProcessor());
			result.add(new RepoTemplateProcessor());
			result.add(new DefaultHandlerTemplateProcessor());
			result.add(new DefaultModelTemplateProcessor());
			result.add(new ExtSecurityConfigTemplateProcessor());
			result.add(new MainClassTemplateProcessor());
			result.add(new HandlerTemplateProcessor());
			result.add(new ModelTemplateProcessor());
			result.add(new AclHandlerTemplateProcessor());
			result.add(new AclModelTemplateProcessor());
		}

		else if (options.getMode() == Mode.Full) {

			if (options.getBuildTool() == BuildTool.GRADLE) {
				result.add(new FullGradleTemplateProcessor());
				result.add(new ApplicationTemplateProcessor());
			} else {
				result.add(new MavenTemplateProcessor());
			}

			result.add(new FullMySqlDataTemplateProcessor());
			result.add(new ControllerTemplateProcessor());
			result.add(new FullEntityTemplateProcessor());
			result.add(new RepoTemplateProcessor());
			result.add(new DefaultHandlerTemplateProcessor());
			result.add(new DefaultModelTemplateProcessor());
			result.add(new FullSecurityConfigTemplateProcessor());
			result.add(new MainClassTemplateProcessor());
			result.add(new HandlerTemplateProcessor());
			result.add(new ModelTemplateProcessor());
		}

		else if (options.getMode() == Mode.Minimal) {
			result.add(new MainClassTemplateProcessor());
			result.add(new HandlerTemplateProcessor());
			result.add(new ModelTemplateProcessor());
		}

		return result;
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.SpringBoot;
	}

}
