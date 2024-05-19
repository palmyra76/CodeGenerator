package com.palmyralabs.pcg.commons.options;

public enum DatabaseType {
	MySQL("mysql"), MariaDB("mariadb"), Oracle("oracle"), Postgres("postgres"), SQLServer("mssql"), DB2LUW("db2luw"),
	DB2Z("db2z");

	public final String value;

	private DatabaseType(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}

	public static DatabaseType byValue(String v) {
		for (DatabaseType b : DatabaseType.values()) {
			if (b.value.equalsIgnoreCase(v)) {
				return b;
			}
		}
		return null;
	}
}
