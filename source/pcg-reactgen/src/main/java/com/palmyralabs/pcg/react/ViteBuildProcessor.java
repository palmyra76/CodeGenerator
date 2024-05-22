package com.palmyralabs.pcg.react;
import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplatorProcessor;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class ViteBuildProcessor extends SimpleTemplatorProcessor {
	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();
		TemplateInfo info = new DefaultTemplateInfo("vite.config.ts", "templates/buildVite.ftlh");
//		TemplateInfo info = new DefaultTemplateInfo("tsconfig.json", "templates/buildPackage.ftlh");
		templates.add(info);
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

