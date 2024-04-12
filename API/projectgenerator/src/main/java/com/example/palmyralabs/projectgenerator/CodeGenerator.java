package com.example.palmyralabs.projectgenerator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import com.example.palmyralabs.projectgenerator.model.Inputs;
import com.example.palmyralabs.projectgenerator.model.Table;
import com.example.palmyralabs.projectgenerator.util.FileUtil;
import com.example.palmyralabs.projectgenerator.util.TemplateUtil;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CodeGenerator {

	private static void generateServiceFolders(String resourcePath, String modelPath, String handlerPath,
			String configPath, String controllerPath, String entityPath, String repoPath) {
		FileUtil.createDir(resourcePath);
		FileUtil.createDir(modelPath);
		FileUtil.createDir(handlerPath);
		FileUtil.createDir(configPath);
		FileUtil.createDir(controllerPath);
		FileUtil.createDir(entityPath);
		FileUtil.createDir(repoPath);
	}

	protected static void generateServiceFolders(String resourcePath, String modelPath, String handlerPath , String gridPath
			,String formPath) {
		FileUtil.createDir(resourcePath);
		FileUtil.createDir(modelPath);
		FileUtil.createDir(handlerPath);
		FileUtil.createDir(gridPath);
		FileUtil.createDir(formPath);
	}

	private static void generateConfigFiles(Inputs inputs) throws IOException, TemplateException {
		String configPath = inputs.getConfigPath();
		Template auditableConfig = TemplateUtil.getAuditableTemplate();
		writeInputData(auditableConfig, inputs, configPath + "/Auditable.java");
		Template auditListenerConfig = TemplateUtil.getAuditListenerTemplate();
		writeInputData(auditListenerConfig, inputs, configPath + "/AuditListener.java");
		Template securityConfig = TemplateUtil.getSecurityConfigTemplate();
		writeInputData(securityConfig, inputs, configPath + "/SecurityConfig.java");
		Template securityConfigRepositoryConfig = TemplateUtil.getSecurityConfigRepositoryConfigTemplate();
		writeInputData(securityConfigRepositoryConfig, inputs, configPath + "/SecurityConfigRepositoryConfig.java");
		Template userPasswordRepoImplConfig = TemplateUtil.getUserPasswordRepoImplTemplate();
		writeInputData(userPasswordRepoImplConfig, inputs, configPath + "/UserPasswordRepoImpl.java");
	}

	private static void generateControllerFiles(Inputs inputs) throws IOException, TemplateException {
		String controllerPath = inputs.getControllerPath();
		Template authenticationController = TemplateUtil.getAuthenticationControllerTemplate();
		writeInputData(authenticationController, inputs, controllerPath + "/AuthenticationController.java");
		Template baseController = TemplateUtil.getBaseControllerTemplate();
		writeInputData(baseController, inputs, controllerPath + "/BaseController.java");
	}

	private static void generateEntityFiles(Inputs inputs) throws IOException, TemplateException {
		String entityPath = inputs.getEntityPath();
		Template timestampsEntity = TemplateUtil.getTimestampsTemplate();
		writeInputData(timestampsEntity, inputs, entityPath + "/Timestamps.java");
		Template userEntity = TemplateUtil.getUserEntityTemplate();
		writeInputData(userEntity, inputs, entityPath + "/UserEntity.java");
	}

	private static void generateRepoFiles(Inputs inputs) throws IOException, TemplateException {
		String repoPath = inputs.getRepoPath();
		Template userRepository = TemplateUtil.getUserRepositoryTemplate();
		writeInputData(userRepository, inputs, repoPath + "/UserRepository.java");
	}

	private static void generateModelFiles(Inputs inputs) throws IOException, TemplateException {
		String modelPath = inputs.getModelPath();
		Template errorResponse = TemplateUtil.getErrorResponseTemplate();
		writeInputData(errorResponse, inputs, modelPath + "/ErrorResponse.java");
//		Template loginRequest = TemplateUtil.getLoginRequestTemplate();
//		writeInputData(loginRequest, inputs, modelPath + "/LoginRequest.java");
	}

	protected static void generateDefaultFiles(Inputs inputs) throws IOException, TemplateException {
		generateServiceFolders(inputs.getResourcePath(), inputs.getModelPath(), inputs.getHandlerPath(),
				inputs.getConfigPath(), inputs.getControllerPath(), inputs.getEntityPath(), inputs.getRepoPath());
		generateServiceFolders(inputs.getResourcePath(), inputs.getModelPath(), inputs.getHandlerPath() , inputs.getGridPath() , inputs.getFormPath());
		generateConfigFiles(inputs);
		generateControllerFiles(inputs);
		generateEntityFiles(inputs);
		generateModelFiles(inputs);
		generateRepoFiles(inputs);
		Template applicationTemplate = TemplateUtil.getApplicationTemplate();
		writeInputData(applicationTemplate, inputs, inputs.getApplicationPath());
		Template mainClassTemplate = TemplateUtil.getMainClassTemplate();
		writeInputData(mainClassTemplate, inputs, inputs.getMainClassPath());
		Template buildGradleTemplate = TemplateUtil.getBuildGradleTemplate();
		writeInputData(buildGradleTemplate, inputs, inputs.getBuildGradlePath());
		Template depsGradleTemplate = TemplateUtil.getDepsGradleTemplate();
		writeInputData(depsGradleTemplate, inputs, inputs.getDepsGradlePath());
		Template settingsGradle = TemplateUtil.getSettingsGradleTemplate();
		writeInputData(settingsGradle, inputs, inputs.getSettingsGradlePath());
		Template abstractHandler = TemplateUtil.getAbstractHandlerTemplate();
		writeInputData(abstractHandler, inputs, inputs.getAbstractHandlerPath());
//		Template packageDotJSONTemplate = TemplateUtil.getPackageDotJSONTemplate();
//		writeInputData(packageDotJSONTemplate, inputs, inputs.getWebPath());
//		Template viteConfigTemplate = TemplateUtil.getViteConfigTemplate();
//		writeInputData(viteConfigTemplate, inputs, inputs.getWebPath());
	}

	protected static void writeData(Template template, Table table, String filePath)
			throws IOException, TemplateException {
		File file = new File(filePath);
		if (file.createNewFile()) {
			FileWriter fileWriter = new FileWriter(file);
			try (StringWriter out = new StringWriter()) {
				template.process(table, out);
				fileWriter.write(out.getBuffer().toString());
				fileWriter.close();
				out.flush();
			}
		}
	}

	protected static void writeInputData(Template template, Inputs inputs, String filePath)
			throws IOException, TemplateException {
		File file = new File(filePath);
		if (file.createNewFile()) {
			FileWriter fileWriter = new FileWriter(file);
			try (StringWriter out = new StringWriter()) {
				template.process(inputs, out);
				fileWriter.write(out.getBuffer().toString());
				fileWriter.close();
				out.flush();
			}
		}
	}

	protected static void generateFile(Inputs inputs, Table table) throws IOException, TemplateException {
		Template modelTemplate = TemplateUtil.getModelTemplate();
		String modelFilePath = inputs.getModelPath() + "/" + table.getName() + "Model.java";
		writeData(modelTemplate, table, modelFilePath);
		Template handlerTemplate = TemplateUtil.getHandlerTemplate();
		String handlerFilePath = inputs.getHandlerPath() + "/" + table.getName() + "Handler.java";
		writeData(handlerTemplate, table, handlerFilePath);
		Template gridTemplate = TemplateUtil.getGridTemplate();
		String gridFilePath = inputs.getGridPath() + "/" + table.getName() + "Grid.tsx";
		writeData(gridTemplate, table, gridFilePath);
//		String formFilePath = inputs.getFormPath() + "/" + table.getName() + "Form.tsx";
//		writeData(gridTemplate, table, gridFilePath);

	}
	
//	private static void generateAppDotTsxFile(Map<String, TupleType> schemas) {
//		
//	}

}
