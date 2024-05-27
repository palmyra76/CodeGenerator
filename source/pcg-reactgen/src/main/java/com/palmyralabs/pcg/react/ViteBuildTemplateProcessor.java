package com.palmyralabs.pcg.react;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.DataModelTemplateProcessor;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class ViteBuildTemplateProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo viteConfig = new DefaultTemplateInfo("vite.config.ts", "templates/viteConfigtsTemplate.ftlh");
		templates.add(viteConfig);
		
		TemplateInfo tsConfigJson = new DefaultTemplateInfo("tsconfig.json", "templates/tsConfigJsonTemplate.ftlh");
		templates.add(tsConfigJson);
		
		TemplateInfo packageJson = new DefaultTemplateInfo("package.json", "templates/packageJsonTemplate.ftlh");
		templates.add(packageJson);
		
		return templates;

	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		return options.getBaseOutputFolder().resolve("web");
	}

	@Override
	public String getName() {		
		return "viteBuild";
	}

}

