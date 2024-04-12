package com.example.palmyralabs.projectgenerator.model;

import java.util.ArrayList;

import com.example.palmyralabs.projectgenerator.util.DataUtil;
import com.zitlab.palmyra.common.util.TextUtil;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Inputs {
	private String url;
	private String userName;
	private String password;
	private String driverClassName;
	private String group;
	private String projectName;
	private String projectPath;
	private String[] projectList;
	private String packageName;
	private String convertedProjectName;
	private String filePath;
	private String path;
	private String javaPath;
	private String resourcePath;
	private String modelPath;
	private String handlerPath;
	private String configPath;
	private String controllerPath;
	private String entityPath;
	private String repoPath;
	private String applicationPath;
	private String mainClassPath;
	private String buildGradlePath;
	private String depsGradlePath;
	private String settingsGradlePath;
	private String abstractHandlerPath;
	private String gridPath;
	private String formPath;
	private String typeScriptPath;
	private String summaryGrid;
	private String webPath;

	public Inputs(String url, String userName, String password, String driverClassName, String group,
			String projectName, String projectPath) {
		this.url = url;
		this.userName = userName;
		this.password = password;
		this.driverClassName = driverClassName;
		this.group = group;
		this.projectPath = projectPath;
		this.projectList=projectName.split(",");
	}
	
	public void setPaths(String schema) {
		this.projectName = schema.toLowerCase();
		this.packageName = group + "." + projectName;
		this.convertedProjectName = TextUtil.camelCaseFirstLetterUpperCase(projectName);
		this.filePath = DataUtil.splitData(packageName);
		this.path = projectPath + "/" + projectName + "/Service";
		this.webPath = projectPath + "/" + projectName + "/Web";
		this.javaPath = path + "/src/main/java/" + filePath;
		this.typeScriptPath = webPath + "/src/templates/default";
		this.resourcePath = path + "/src/main/resources";
		this.gridPath = typeScriptPath + "/grid";
		this.modelPath = javaPath + "/model";
		this.handlerPath = javaPath + "/handler";
		this.configPath = javaPath + "/config";
		this.controllerPath = javaPath + "/controller";
		this.entityPath = javaPath + "/entity";
		this.repoPath = javaPath + "/repo";
		this.applicationPath = resourcePath + "/" + "application.yaml";
		this.mainClassPath = javaPath + "/" + convertedProjectName + "Application.java";
		this.buildGradlePath = path + "/" + "build.gradle";
		this.depsGradlePath = path + "/" + "deps.gradle";
		this.settingsGradlePath = path + "/" + "settings.gradle";
		this.abstractHandlerPath = handlerPath + "/" + "AbstractHandler.java";
		this.formPath = typeScriptPath + "/grid";
	}

}
