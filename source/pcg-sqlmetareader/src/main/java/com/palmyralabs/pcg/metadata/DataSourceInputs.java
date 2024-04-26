package com.palmyralabs.pcg.metadata;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataSourceInputs {
	private String databaseConnectivity;
	private String databaseSystem;
	private String hostname;
	private String port;
	private String username;
	private String password;

}
