package com.palmyralabs.pcg.spring.extended;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.TemplateInfo;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.template.generator.DefaultTemplateInfo;
import com.palmyralabs.pcg.template.processor.SimpleTemplateProcessor;

public class ExtSecurityConfigTemplateProcessor extends SimpleTemplateProcessor {

	@Override
	public List<TemplateInfo> getTemplates() {
		List<TemplateInfo> templates = new ArrayList<>();

		TemplateInfo loginResponse = new DefaultTemplateInfo("LoginResponse.java", "templates/extended/loginResponse.ftlh");
		templates.add(loginResponse);

		TemplateInfo securityConfig = new DefaultTemplateInfo("SecurityConfig.java", "templates/full/securityConfig.ftlh");
		templates.add(securityConfig);

		TemplateInfo securityConfigRepositoryConfig = new DefaultTemplateInfo("SecurityConfigRepositoryConfig.java",
				"templates/full/securityConfigRepositoryConfig.ftlh");
		templates.add(securityConfigRepositoryConfig);

		TemplateInfo userPasswordRepoImpl = new DefaultTemplateInfo("UserPasswordRepoImpl.java",
				"templates/full/userPasswordRepoImpl.ftlh");
		templates.add(userPasswordRepoImpl);

		TemplateInfo userProvider = new DefaultTemplateInfo("UserProvider.java", "templates/full/userProvider.ftlh");
		templates.add(userProvider);

		return templates;
	}

	@Override
	protected Path getOutputPath(TemplateInfo template, UserOptions options) {
		String[] packageName = options.getPackageName().split("\\.");
		Path path = Paths.get("service", "src", "main", "java", String.join(File.separator, packageName), "security",
				"config");
		return options.getBaseOutputFolder().resolve(path);
	}

	@Override
	public String getName() {
		return "controller";
	}

}
