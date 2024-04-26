package com.palmyralabs.pcg.metadata;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class DriverClassNameProvider {
	private final DataSourceInputs inputs;

	public String getDriverClassName() {
		switch (inputs.getDatabaseSystem().toLowerCase()) {
		case "oracle":
			return "oracle.jdbc.OracleDriver";
		case "mysql":
			return "com.mysql.jdbc.Driver";
		case "mariadb":
			return "org.mariadb.jdbc.Driver";
		default:
			return null;
		}

	}

}
