package com.example.palmyralabs.projectgenerator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.palmyralabs.projectgenerator.config.DataSourceConfig;
import com.example.palmyralabs.projectgenerator.config.DataSourceConfiguration;
import com.example.palmyralabs.projectgenerator.model.Inputs;
import com.example.palmyralabs.projectgenerator.model.Table;
import com.palmyralabs.palmyra.spring.config.DataSourceConnectionProvider;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;
import com.zitlab.palmyra.sqlstore.schema.metadata.MetaDataUtil;

import freemarker.template.TemplateException;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ProjectGeneratorApplication {
//
//	@Autowired
//	DataSource dataSource;

	public void generateNewProject(Inputs inputs) throws SQLException, IOException, TemplateException {
		DataSourceConfiguration dataSourceConfig = new DataSourceConfiguration();
		DataSource dataSource = dataSourceConfig.getDataSource(inputs.getUrl(), inputs.getUserName(),
				inputs.getPassword(), inputs.getDriverClassName());
		DataSourceConnectionProvider connectionProvider = new DataSourceConnectionProvider(dataSource, null, null);
		Connection connection = connectionProvider.getConnection();
		DatabaseMetaData metaData = connection.getMetaData();
		ResultSet resultSet = metaData.getCatalogs();
		List<String> schemas = new ArrayList<>();
		String[] projectLits = inputs.getProjectList();
		for (String schema : projectLits) {
			inputs.setPaths(schema);
			while (resultSet.next()) {
				String schemaName = resultSet.getString(1);
				if (schemaName.equalsIgnoreCase(schema))
					schemas.add(schemaName);
				break;
			}
			CodeGenerator.generateDefaultFiles(inputs);
			MetaDataUtil metaDataUtil = new MetaDataUtil(metaData);
			Map<String, TupleType> map = metaDataUtil.getAllTablesAsMap(schemas);
			for (TupleType tuple : map.values()) {
				Table table = new Table(tuple, inputs.getPackageName());
				CodeGenerator.generateFile(inputs, table);
			}
		}
		connection.close();
	}

	public static void main(String[] args) throws SQLException, IOException, TemplateException {

		String url = "jdbc:mariadb://192.168.1.103:3306";
		String userName = "hema";
		String password = "secret";
		String driverClassName = "org.mariadb.jdbc.Driver";
		String group = "com.palmyralabs";
		String projectName = "sample";
		String projectPath = "/home/pavithra/Desktop/new/Test2";
		Inputs inputs = new Inputs(url, userName, password, driverClassName, group, projectName, projectPath);
		ProjectGeneratorApplication projectGeneration = new ProjectGeneratorApplication();
		projectGeneration.generateNewProject(inputs);
	}

}
