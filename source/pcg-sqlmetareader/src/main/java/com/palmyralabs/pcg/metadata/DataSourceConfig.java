package com.palmyralabs.pcg.metadata;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class DataSourceConfig {

	private final DataSourceInputs inputs;
	private final JdbcUrlProvider urlProvider;
	private final DriverClassNameProvider driverClassNameProvider;

	@Bean
	public DataSource getDataSource() {
		return DataSourceBuilder.create().url(urlProvider.getJdbcUrl()).username(inputs.getUsername())
				.password(inputs.getPassword()).driverClassName(driverClassNameProvider.getDriverClassName()).build();
	}
}