package com.palmyralabs.pcg.react;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.react.ComponentTemplates.ComponentDialogTemplateProcessor;
import com.palmyralabs.pcg.react.ComponentTemplates.FormComponentTemplateProcessor;
import com.palmyralabs.pcg.react.ComponentTemplates.LoginTemplateProcessor;
import com.palmyralabs.pcg.react.ComponentTemplates.StoreFactoryTemplateProcessor;
import com.palmyralabs.pcg.react.ComponentTemplates.TabComponentTemplateProcessor;
import com.palmyralabs.pcg.react.config.ServiceEndPointTemplateProcessor;
import com.palmyralabs.pcg.react.groupmanagement.GroupUserTemplateProcessor;
import com.palmyralabs.pcg.react.groupmanagement.GroupTemplateProcessor;
import com.palmyralabs.pcg.react.layoutTemplateClass.FormLayoutTemplateProcessor;
import com.palmyralabs.pcg.react.layoutTemplateClass.MainlayoutTemplateProcessor;
import com.palmyralabs.pcg.react.templates.DrawerDefaultTemplateProcessor;
import com.palmyralabs.pcg.react.templates.FormDefaultTemplateProcessor;
import com.palmyralabs.pcg.react.templates.GridDefaultTemplateProcessor;
import com.palmyralabs.pcg.react.templates.GridDialogTemplateProcessor;
import com.palmyralabs.pcg.react.templates.SummaryEditTemplateProcessor;
import com.palmyralabs.pcg.react.templates.TypeTSTemplateProcessor;
import com.palmyralabs.pcg.react.templates.UserFormTemplateProcessor;
import com.palmyralabs.pcg.react.usermanagement.UserTemplateProcessor;
import com.palmyralabs.pcg.react.usermanagement.userapplication.UserApplicationTemplateProcessor;
import com.palmyralabs.pcg.react.usermanagement.usergroup.UserGroupTemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorProvider;

public class ReactTemplateProcessorProvider implements TemplateProcessorProvider {
	@Override
	public List<TemplateProcessor> getProcessors(UserOptions options) {

		List<TemplateProcessor> result = new ArrayList<>();

		if (options.getBuildTool() == BuildTool.VITE)
			result.add(new ViteBuildTemplateProcessor());
//		else
		// result.add(new MavenTemplateProcessor());
		result.add(new ComponentDialogTemplateProcessor());
		result.add(new DrawerDefaultTemplateProcessor());
		result.add(new FormComponentTemplateProcessor());
		result.add(new FormDefaultTemplateProcessor());
		result.add(new GridDefaultTemplateProcessor());
		result.add(new GridDialogTemplateProcessor());
		result.add(new GroupTemplateProcessor());
		result.add(new GroupUserTemplateProcessor());
		result.add(new HomePageTemplateProcessor());
		result.add(new LoginPageTemplateProcessor());
		result.add(new LoginTemplateProcessor());
		result.add(new MainlayoutTemplateProcessor());
		result.add(new MainTemplateProcessor());
		result.add(new RoutesTemplateProcessor());
		result.add(new ServiceEndPointTemplateProcessor());
		result.add(new SourceTemplateProcessor());
		result.add(new StoreFactoryTemplateProcessor());		
		result.add(new StyleLayoutTemplateProcessor());
		result.add(new SummaryEditTemplateProcessor());
		result.add(new TabComponentTemplateProcessor());
		result.add(new TypeTSTemplateProcessor());
		result.add(new UserApplicationTemplateProcessor());
		result.add(new UserFormTemplateProcessor());
		result.add(new UserGroupTemplateProcessor());
		result.add(new GroupTemplateProcessor());
		result.add(new UserTemplateProcessor());
		result.add(new StyleLayoutThemeColorTemplateProcessor());
		result.add(new StyleLayoutThemeTemplateProcessor());
		result.add(new FormLayoutTemplateProcessor());		 
		return result;
		
	}

	@Override
	public boolean isSupported(UserOptions options) {
		return options.getFramework() == Framework.React;
	}

}
