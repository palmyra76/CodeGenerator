package com.example.palmyralabs.projectgenerator.config;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class DataSourceConfiguration implements DataSourceConfig {

	@Override
	@Bean
	public DataSource getDataSource(String url, String userName, String password, String driverClassName) {
		return DataSourceBuilder.create().url(url).username(userName).password(password)
				.driverClassName(driverClassName).build();
	}
}
