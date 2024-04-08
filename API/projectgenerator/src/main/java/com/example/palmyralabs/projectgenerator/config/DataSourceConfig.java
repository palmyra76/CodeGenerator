package com.example.palmyralabs.projectgenerator.config;

import javax.sql.DataSource;

public interface DataSourceConfig {
	public DataSource getDataSource(String url, String userName, String password, String driverClassName);
}
