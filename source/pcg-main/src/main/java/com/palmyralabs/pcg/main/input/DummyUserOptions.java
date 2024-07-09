package com.palmyralabs.pcg.main.input;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.KeyValue;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.*;

public class DummyUserOptions {
	private List<KeyValue> options;

	public List<KeyValue> getOptions() {
		if (null == options)
			options = initOptions();
		return options;
	}

	private List<KeyValue> initOptions() {
		List<KeyValue> r = new ArrayList<>();
		add(r, L_FRAMEWORK, "react");
		add(r, L_MODE, "extended");
//		add(r, L_SPRING_BUILD, "gradle");
		add(r, L_REACT_BUILD, "vite");
		add(r, L_PACKAGE, "com.palmyralabs.qbacc");
		add(r, L_PROJECT_NAME, "qbacc");
		add(r, L_OUTPUT_PATH,"/home/pavithra/Desktop/jul5");

		add(r, L_DATABASE_HOST, "//192.168.1.11");
		add(r, L_DATABASE_USERNAME, "dbuser");
		add(r, L_DATABASE_PASSWORD, "dbuser");
		add(r, L_DATABASE_PORT, "3306");
		add(r, L_DATABASE_TYPE, "mariadb");
		add(r, L_DATABASE_SCHEMAS, "accounting");
		return r;
	}

	private void add(List<KeyValue> r, String key, String value) {
		r.add(new KeyValue(key, value));
	}
}
