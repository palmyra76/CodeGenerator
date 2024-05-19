package com.palmyralabs.pcg.commons;

import com.zitlab.palmyra.store.schema.Schema;

public interface GeneratorContext {
	UserOptions getUserOptions();

	Schema getDataModel();
}
