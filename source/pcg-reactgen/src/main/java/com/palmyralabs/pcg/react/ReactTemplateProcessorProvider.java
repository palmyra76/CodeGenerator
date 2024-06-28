package com.palmyralabs.pcg.react;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;
import com.palmyralabs.pcg.react.base.SourceTemplateProcessor;
import com.palmyralabs.pcg.react.base.ViteBuildTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ComponentDialogTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtRoutesTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtServiceEndPointTemplateProcessor;
import com.palmyralabs.pcg.react.extended.FormDefaultTemplateProcessor;
import com.palmyralabs.pcg.react.extended.GroupTemplateProcessor;
import com.palmyralabs.pcg.react.extended.GroupUserTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserFormTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserGroupTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserTemplateProcessor;
import com.palmyralabs.pcg.react.full.ConfigTemplateProcessor;
import com.palmyralabs.pcg.react.full.FormLayoutTemplateProcessor;
import com.palmyralabs.pcg.react.full.HomePageTemplateProcessor;
import com.palmyralabs.pcg.react.full.IndexTemplateProcessor;
import com.palmyralabs.pcg.react.full.LoginPageTemplateProcessor;
import com.palmyralabs.pcg.react.full.LoginTemplateProcessor;
import com.palmyralabs.pcg.react.full.MainlayoutTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullRoutesTemplateProcessor;
import com.palmyralabs.pcg.react.full.StyleLayoutTemplateProcessor;
import com.palmyralabs.pcg.react.full.StyleLayoutThemeTemplateProcessor;
import com.palmyralabs.pcg.react.full.StyleThemeBlueColorTemplateProcessor;
import com.palmyralabs.pcg.react.full.TabComponentTemplateProcessor;
import com.palmyralabs.pcg.react.full.TypesTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.ComponentTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.FormComponentTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinServiceEndPointTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.StoreFactoryTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.TypeTSTemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class ReactTemplateProcessorProvider implements TemplateProcessorProvider {
	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {

		List<TemplateProcessor> result = new ArrayList<>();

		switch (options.getMode()) {
		case Extended:
			result.add(new ComponentDialogTemplateProcessor());
			result.add(new FormDefaultTemplateProcessor());
			result.add(new GroupTemplateProcessor());
			result.add(new GroupUserTemplateProcessor());
			result.add(new UserFormTemplateProcessor());
			result.add(new UserGroupTemplateProcessor());
			result.add(new UserTemplateProcessor());
			result.add(new ExtRoutesTemplateProcessor());
			result.add(new ExtServiceEndPointTemplateProcessor());

		case Full:
			result.add(new HomePageTemplateProcessor());
			result.add(new LoginPageTemplateProcessor());
			result.add(new LoginTemplateProcessor());
			result.add(new MainlayoutTemplateProcessor());
			result.add(new StyleLayoutTemplateProcessor());
			result.add(new TabComponentTemplateProcessor());
			result.add(new StyleThemeBlueColorTemplateProcessor());
			result.add(new StyleLayoutThemeTemplateProcessor());
			result.add(new FormLayoutTemplateProcessor());
			result.add(new IndexTemplateProcessor());
			result.add(new TypesTemplateProcessor());
			result.add(new ConfigTemplateProcessor());
			if (options.getMode() == Mode.Full) {
				result.add(new FullRoutesTemplateProcessor());
			}

		case Minimal:
			result.add(new StoreFactoryTemplateProcessor());
			result.add(new ComponentTemplateProcessor());
			result.add(new FormComponentTemplateProcessor());
			result.add(new TypeTSTemplateProcessor());
			if (options.getMode() == Mode.Minimal) {
				result.add(new MinServiceEndPointTemplateProcessor());
			}

		default:
			if (options.getBuildTool() == BuildTool.VITE)
				result.add(new ViteBuildTemplateProcessor());
//			else
//				 result.add(new MavenTemplateProcessor());
			result.add(new SourceTemplateProcessor());
		}

		return result;

	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.React;
	}

}
