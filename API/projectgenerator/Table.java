package com.example.palmyralabs.projectgenerator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;
import com.zitlab.palmyra.common.util.TextUtil;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleAttribute;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Table {
	private String code;
	private String name;
	private String schema;
	private String convertedName;
	private List<Field> fields;
	private Map<String, TupleAttribute> attribute;
	private Database database;

	public Table(TupleType tuple) {
		this.code = tuple.getTable();
		this.name = tuple.getName();
		this.schema = tuple.getSchema();
		this.convertedName = TextUtil.camelCase(tuple.getTable());
		this.attribute = tuple.getAllFields();
		this.fields = getFields(tuple);
		this.database = new Database(tuple.getSchema());
	}

	private static List<Field> getFields(TupleType tuple) {
		Map<String, TupleAttribute> fields = tuple.getAllFields();
		List<Field> fieldList = new ArrayList<Field>();
		for (TupleAttribute attribute : fields.values()) {
			Field field = new Field(tuple, attribute);
			fieldList.add(field);
		}
		return fieldList;
	}
}
