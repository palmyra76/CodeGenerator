package com.palmyralabs.pcg.metadata;

import javax.sql.DataSource;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class DataSourceFactory {

	private final DataSourceOptions dsOptions;
	private DataSource dataSource;

	public DataSource getDataSource() {
		if (null == dataSource)
			this.dataSource = initDataSource();
		return dataSource;
	}

	private DataSource initDataSource() {
		HikariConfig config = new HikariConfig();
		config.setJdbcUrl(dsOptions.getJdbcUrl());
		config.setUsername(dsOptions.getUserName());
		config.setPassword(dsOptions.getPassword());
		return new HikariDataSource(config);
	}
}