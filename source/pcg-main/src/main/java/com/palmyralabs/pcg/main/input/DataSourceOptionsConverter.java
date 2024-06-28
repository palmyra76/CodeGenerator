package com.palmyralabs.pcg.main.input;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_PASSWORD;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_SCHEMAS;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_TYPE;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_USERNAME;
import static com.palmyralabs.pcg.main.input.CommandLineOptions.L_DATABASE_HOST;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.commons.options.DatabaseType;

public class DataSourceOptionsConverter {
	public DataSourceOptions convert(List<KeyValue> options) {
		DataSourceOptionsImpl r = new DataSourceOptionsImpl();

		Map<String, String> valueMap = new HashMap<>();
		for (KeyValue kv : options) {
			valueMap.put(kv.getKey(), kv.getValue());
		}
		
		r.setDbType(getDbType(valueMap.get(L_DATABASE_TYPE)));
		r.setJdbcUrl(getJdbcUrl(r.getDbType(), valueMap));
		r.setUserName(valueMap.get(L_DATABASE_USERNAME));
		r.setPassword(valueMap.get(L_DATABASE_PASSWORD));
		r.setSchemas(valueMap.get(L_DATABASE_SCHEMAS));
		return r;
	}

	private String getJdbcUrl(DatabaseType dbType, Map<String, String> valueMap) {
		return "jdbc:mariadb:" + valueMap.get(L_DATABASE_HOST)  + ":3306";
	}

	private DatabaseType getDbType(String type) {
		return DatabaseType.byValue(type);
	}

}
