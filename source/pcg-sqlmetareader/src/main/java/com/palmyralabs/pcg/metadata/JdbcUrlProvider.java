package com.palmyralabs.pcg.metadata;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JdbcUrlProvider {
	private final DataSourceInputs inputs;

	public String getJdbcUrl() {
		switch (inputs.getDatabaseSystem().toLowerCase()) {
		case "oracle":
			return "jdbc:oracle:thin:@" + inputs.getHostname() + ":" + inputs.getPort() + ":orcl";
		case "mysql":
			return "jdbc:mysql://" + inputs.getHostname() + ":" + inputs.getPort();
		case "mariadb":
			return "jdbc:mariadb://" + inputs.getHostname() + ":" + inputs.getPort();
		default:
			return null;
		}

	}
}
