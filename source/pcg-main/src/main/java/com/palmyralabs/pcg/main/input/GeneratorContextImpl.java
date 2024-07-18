package com.palmyralabs.pcg.main.input;

import java.util.Map;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.Table;
import com.palmyralabs.pcg.commons.UserOptions;
import com.zitlab.palmyra.store.schema.Schema;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GeneratorContextImpl implements GeneratorContext{
	private DataSourceOptions dataSourceOptions;
	private UserOptions userOptions;
	private Schema dataModel;
	private Map<String, Table> tables;
}
