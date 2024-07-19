package com.palmyralabs.pcg.react;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;
import com.palmyralabs.pcg.react.base.ViteBuildTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ComponentDialogTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtLoginTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtRoutesTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtServiceEndPointTemplateProcessor;
import com.palmyralabs.pcg.react.extended.FormDefaultTemplateProcessor;
import com.palmyralabs.pcg.react.extended.GroupTemplateProcessor;
import com.palmyralabs.pcg.react.extended.GroupUserTemplateProcessor;
import com.palmyralabs.pcg.react.extended.ExtMainlayoutTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserFormTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserGroupTemplateProcessor;
import com.palmyralabs.pcg.react.extended.UserTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullMainlayoutTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullRoutesTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullSourceTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullStoreFactoryTemplateProcessor;
import com.palmyralabs.pcg.react.full.LoginPageTemplateProcessor;
import com.palmyralabs.pcg.react.full.FullLoginTemplateProcessor;
import com.palmyralabs.pcg.react.full.TabComponentTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.ComponentTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.ConfigTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.FormComponentTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.HomePageTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinMainlayoutTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinRoutesTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinServiceEndPointTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinSourceTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.MinStoreFactoryTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.StyleLayoutTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.StyleLayoutThemeTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.StyleRuiLayoutTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.StyleThemeBlueColorTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.TypeTSTemplateProcessor;
import com.palmyralabs.pcg.react.minimal.TypesTemplateProcessor;
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
			result.add(new ExtMainlayoutTemplateProcessor());
			result.add(new ExtLoginTemplateProcessor());

		case Full:
			result.add(new LoginPageTemplateProcessor());
			result.add(new FullMainlayoutTemplateProcessor());
			result.add(new TabComponentTemplateProcessor());
			result.add(new FullStoreFactoryTemplateProcessor());
			result.add(new FullSourceTemplateProcessor());

			if (options.getMode() == Mode.Full) {
				result.add(new FullRoutesTemplateProcessor());
				result.add(new FullLoginTemplateProcessor());
			}

		case Minimal:
			result.add(new HomePageTemplateProcessor());
			result.add(new ComponentTemplateProcessor());
			result.add(new FormComponentTemplateProcessor());
			result.add(new TypeTSTemplateProcessor());
			result.add(new ConfigTemplateProcessor());
			result.add(new TypesTemplateProcessor());

			result.add(new StyleLayoutTemplateProcessor());
			result.add(new StyleThemeBlueColorTemplateProcessor());
			result.add(new StyleLayoutThemeTemplateProcessor());
			result.add(new StyleRuiLayoutTemplateProcessor());
			result.add(new MinServiceEndPointTemplateProcessor());

			if (options.getMode() == Mode.Minimal) {

				result.add(new MinStoreFactoryTemplateProcessor());
				result.add(new MinMainlayoutTemplateProcessor());
				result.add(new MinRoutesTemplateProcessor());
				result.add(new MinSourceTemplateProcessor());
			}

		default:
			if (options.getBuildTool() == BuildTool.VITE)
				result.add(new ViteBuildTemplateProcessor());
//			else
//				 result.add(new MavenTemplateProcessor());

		}

		return result;

	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.React;
	}

}
