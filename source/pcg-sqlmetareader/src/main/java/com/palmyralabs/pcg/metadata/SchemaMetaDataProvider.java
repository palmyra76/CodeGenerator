package com.palmyralabs.pcg.metadata;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.zitlab.palmyra.store.schema.MetadataSchemaFactory;
import com.zitlab.palmyra.store.schema.Schema;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class SchemaMetaDataProvider {
	private final DataSourceOptions options;

	public Schema getSchema() {
		DataSourceFactory factory = new DataSourceFactory(options);
		DataSource ds = factory.getDataSource();
		try (Connection c = ds.getConnection()) {
			MetadataSchemaFactory schemaFactory = new MetadataSchemaFactory(c.getMetaData());
			List<String> schemaList = new ArrayList<>();
			String schemas = options.getSchemas();
			for (String s : schemas.split(",")) {
				schemaList.add(s);
			}

			return schemaFactory.loadTables("dbgen", schemaList);
		} catch (Throwable t) {
			System.out.println(t);
		}
		return null;
	}
}
