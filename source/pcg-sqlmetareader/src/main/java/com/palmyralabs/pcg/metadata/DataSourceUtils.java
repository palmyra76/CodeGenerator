package com.palmyralabs.pcg.metadata;

import com.palmyralabs.pcg.commons.options.DatabaseType;

public class DataSourceUtils {	

	public static String getDriverClassName(DatabaseType dbType) {
		switch (dbType) {
		case Oracle:
			return "oracle.jdbc.OracleDriver";
		case MySQL:
			return "com.mysql.jdbc.Driver";
		case MariaDB:
			return "org.mariadb.jdbc.Driver";
		case DB2LUW:
			return "db2.driver";
		case DB2Z:
			return "db2z.driver";
		case Postgres:
			return "postgres";
		default:
			return null;
		}

	}

}
