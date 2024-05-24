package com.palmyralabs.pcg.metadata;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.DataTypeConvertor;
import com.palmyralabs.pcg.commons.Field;
import com.palmyralabs.pcg.commons.Table;
import com.palmyralabs.pcg.commons.UserOptions;
import com.zitlab.palmyra.common.util.TextUtil;
import com.zitlab.palmyra.sqlstore.base.dbmeta.ForeignKey;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleAttribute;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;

public class TableMetaDataReader {

	public Map<String, Table> getTable(Map<String, TupleType> tuples, UserOptions options) {
		Map<String, Table> tables = new HashMap<String, Table>();

		for (TupleType tuple : tuples.values()) {
			Table table = new Table();
			table.setName(tuple.getName());
			table.setConvertedName(TextUtil.camelCase(tuple.getTable()));
			table.setFields(getFields(tuple));
			table.setPackageName(options.getPackageName());
			tables.put(tuple.getName(), table);
		}

		return tables;
	}

	private List<Field> getFields(TupleType tuple) {
		Map<String, TupleAttribute> fields = tuple.getAllFields();
		List<Field> fieldList = new ArrayList<Field>();
		for (TupleAttribute attribute : fields.values()) {
			Field field = new Field();
			field.setColumnName(attribute.getAttribute());
			field.setDataType(DataTypeConvertor.convert(attribute.getDataType()));
			field.setIsPrimaryKey(attribute.isPrimaryKey());
			field.setIsForeignKey(attribute.getForeignKeyCount());
			ForeignKey foreignKey = tuple.getForeignKey(attribute.getAttribute());
			if (foreignKey != null) {
				field.setTargetSchema(foreignKey.getTargetSchema());
				field.setTargetTable(TextUtil.camelCaseFirstLetterUpperCase(foreignKey.getTargetTable()));
				field.setTargetAttributes(foreignKey.getTargetAttributes());
			}
			fieldList.add(field);
		}
		return fieldList;
	}
}