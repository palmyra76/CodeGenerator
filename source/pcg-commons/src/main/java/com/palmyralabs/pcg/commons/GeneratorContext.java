package com.palmyralabs.pcg.commons;

import java.util.Map;

import com.zitlab.palmyra.store.schema.Schema;

public interface GeneratorContext {
	UserOptions getUserOptions();

	Schema getDataModel();
	
	Map<String, Table> getTables();
	
}
