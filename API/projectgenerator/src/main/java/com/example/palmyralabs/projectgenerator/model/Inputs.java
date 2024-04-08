package com.example.palmyralabs.projectgenerator.model;

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
	private String packageName;
	private String convertedProjectName;
	private String filePath;
	private String path;
	private String javaPath;
	private String resourcePath;
	private String modelPath;
	private String handlerPath;
	private String applicationPath;
	private String mainClassPath;
	private String buildGradlePath;
	private String depsGradlePath;
	private String settingsGradlePath;
	private String abstractHandlerPath;

	public Inputs(String url, String userName, String password, String driverClassName, String group,
			String projectName, String projectPath) {
		this.url = url;
		this.userName = userName;
		this.password = password;
		this.driverClassName = driverClassName;
		this.group = group;
		this.projectName = projectName.toLowerCase();
		this.projectPath = projectPath;
		this.packageName = group + "." + projectName;
		this.convertedProjectName = TextUtil.camelCaseFirstLetterUpperCase(projectName);
		this.filePath = DataUtil.splitData(packageName);
		this.path = projectPath + "/" + projectName + "/Service";
		this.javaPath = path + "/src/main/java/" + filePath;
		this.resourcePath = path + "/src/main/resources";
		this.modelPath = javaPath + "/model";
		this.handlerPath = javaPath + "/handler";
		this.applicationPath = resourcePath + "/" + "application.yaml";
		this.mainClassPath = javaPath + "/" + convertedProjectName + "Application.java";
		this.buildGradlePath = path + "/" + "build.gradle";
		this.depsGradlePath = path + "/" + "deps.gradle";
		this.settingsGradlePath = path + "/" + "settings.gradle";
		this.abstractHandlerPath = handlerPath + "/" + "AbstractHandler.java";
	}

}
