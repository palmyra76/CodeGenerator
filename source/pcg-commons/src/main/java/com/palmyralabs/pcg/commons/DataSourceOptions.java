package com.palmyralabs.pcg.commons;

import com.palmyralabs.pcg.commons.options.DatabaseType;

public interface DataSourceOptions {
	DatabaseType getDbType();
	String getJdbcUrl();
	String getUserName();
	String getPassword();
	String getSchemas();	
}