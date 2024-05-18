package com.palmyralabs.pcg.main.input;

import java.util.ArrayList;
import java.util.List;

import com.palmyralabs.pcg.commons.KeyValue;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.*;

public class DummyUserOptions {
	private List<KeyValue> options;
	
	public List<KeyValue> getOptions(){
		if(null == options)
			options = initOptions();
		return options;
	}

	private List<KeyValue> initOptions() {
		List<KeyValue> r = new ArrayList<>();
		add(r, L_FRAMEWORK, "spring");
		add(r, L_MODE, "minimal");
		add(r, L_SPRING_BUILD, "gradle");
		add(r, L_PACKAGE,"com.palmyralabs.demo");
		
		add(r, L_DATABASE_HOST, "localhost");
		add(r, L_DATABASE_USERNAME, "dbuser");
		add(r, L_DATABASE_PASSWORD, "password");
		add(r, L_DATABASE_PORT, "3306");
		add(r, L_DATABASE_TYPE, "mariadb");
		add(r, L_DATABASE_SCHEMAS, "qbacc");
		return r;
	}

	private void add(List<KeyValue> r, String key, String value) {
		r.add(new KeyValue(key, value));		
	}
}
