package com.example.palmyralabs.projectgenerator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;

import com.example.palmyralabs.projectgenerator.model.Inputs;
import com.example.palmyralabs.projectgenerator.model.Table;
import com.example.palmyralabs.projectgenerator.util.FileUtil;
import com.example.palmyralabs.projectgenerator.util.TemplateUtil;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CodeGenerator {

	protected static void generateServiceFolders(String resourcePath, String modelPath, String handlerPath) {
		FileUtil.createDir(resourcePath);
		FileUtil.createDir(modelPath);
		FileUtil.createDir(handlerPath);

	}

	protected static void generateDefaultFiles(Inputs inputs) throws IOException, TemplateException {
		generateServiceFolders(inputs.getResourcePath(), inputs.getModelPath(), inputs.getHandlerPath());
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

	}

}
