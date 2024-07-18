package com.palmyralabs.pcg.metadata;

import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;

public interface UniqueColumnProvider {
	String getUniqueColumn(TupleType tuple);
}
