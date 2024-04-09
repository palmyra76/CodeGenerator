package com.example.palmyralabs.projectgenerator.util;

import java.io.IOException;

import com.example.palmyralabs.projectgenerator.config.TemplateConfig;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

public class TemplateUtil {

	public static Template getModelTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("model.ftlh");
	}

	public static Template getHandlerTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("handler.ftlh");
	}

	public static Template getBuildGradleTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("buildGradle.ftlh");
	}

	public static Template getDepsGradleTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("depsGradle.ftlh");
	}

	public static Template getSettingsGradleTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("settingsGradle.ftlh");
	}

	public static Template getAbstractHandlerTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("abstractHandler.ftlh");
	}

	public static Template getMainClassTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("mainClass.ftlh");
	}

	public static Template getApplicationTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("application.ftlh");
	}

	public static Template getAuditableTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("auditable.ftlh");
	}

	public static Template getAuthenticationControllerTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("authenticationController.ftlh");
	}

	public static Template getBaseControllerTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("baseController.ftlh");
	}

	public static Template getErrorResponseTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("errorResponse.ftlh");
	}

	public static Template getLoginRequestTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("loginRequest.ftlh");
	}

	public static Template getSecurityConfigTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("securityConfig.ftlh");
	}

	public static Template getSecurityConfigRepositoryConfigTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("securityConfigRepositoryConfig.ftlh");
	}

	public static Template getTimestampsTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("timestamps.ftlh");
	}

	public static Template getUserEntityTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("userEntity.ftlh");
	}

	public static Template getUserPasswordRepoImplTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("userPasswordRepoImpl.ftlh");
	}

	public static Template getUserRepositoryTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("userRepository.ftlh");
	}

	public static Template getAuditListenerTemplate() throws TemplateException, TemplateNotFoundException,
			MalformedTemplateNameException, ParseException, IOException {
		Configuration cfg = TemplateConfig.getFMTemplateConfig();
		return cfg.getTemplate("auditListener.ftlh");
	}

}
