package com.palmyralabs.pcg.main.input;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.palmyralabs.pcg.commons.options.DatabaseType;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataSourceOptionsImpl implements DataSourceOptions{
	private DatabaseType dbType;
	private String jdbcUrl;
	private String userName;
	private String password;
	private String schemas;			
}
