package com.palmyralabs.pcg.metadata;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.DataTypeConvertor;
import com.palmyralabs.pcg.commons.Field;
import com.palmyralabs.pcg.commons.NameUtil;
import com.palmyralabs.pcg.commons.Table;
import com.palmyralabs.pcg.commons.UserOptions;
import com.zitlab.palmyra.common.util.TextUtil;
import com.zitlab.palmyra.sqlstore.base.dbmeta.ForeignKey;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleAttribute;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;
import com.zitlab.palmyra.store.schema.Schema;

public class TableMetaDataReader {

	public Map<String, Table> getTable(Schema schema, UserOptions options) {
		Map<String, TupleType> tuples = schema.getEntityMap();
		Map<String, Table> tables = new HashMap<String, Table>();

		for (TupleType tuple : tuples.values()) {
			Table table = new Table();
			table.setName(tuple.getName());
			table.setConvertedName(TextUtil.camelCase(tuple.getTable()));
			table.setFields(getFields(tuple));
			table.setPackageName(options.getPackageName());
			tables.put(TextUtil.camelCase(tuple.getTable()), table);
		}

		return tables;
	}

	private List<Field> getFields(TupleType tuple) {

		Map<String, TupleAttribute> fields = tuple.getAllFields();

		List<Field> fieldList = new ArrayList<Field>();

		for (TupleAttribute attribute : fields.values()) {
			Field field = new Field();
			field.setColumnName(attribute.getAttribute());
			field.setJavaDataType(DataTypeConvertor.javaTypeConvert(attribute.getDataType()));
			field.setReactDataType(DataTypeConvertor.reactTypeConvert(attribute.getDataType()));
			field.setSplitedName(NameUtil.splitData(attribute.getAttribute()));
			field.setMandatory(attribute.isMandatory());
			field.setIsPrimaryKey(attribute.isPrimaryKey());
			field.setIsForeignKey(attribute.getForeignKeyCount());

			ForeignKey foreignKey = tuple.getForeignKey(attribute.getAttribute());

			if (foreignKey != null) {
				field.setTargetSchema(foreignKey.getTargetSchema());
				field.setTargetTable(TextUtil.camelCase(foreignKey.getTargetTable()));
				field.setConvertedTargetTableName(TextUtil.camelCaseFirstLetterUpperCase(foreignKey.getTargetTable()));
				field.setTargetAttribute(foreignKey.getTargetAttributes().get(0));

				String uniqueColumn = null;
				Map<String, TupleAttribute> targetFields = foreignKey.getTargetType().getFirstAvailableUniqueKey()
						.getColumns();
				for (TupleAttribute targetAttribute : targetFields.values()) {
					if (targetAttribute.getColumnName().contains("name")
							|| targetAttribute.getColumnName().contains("code")) {
						uniqueColumn = targetAttribute.getColumnName();
						break;
					}
				}
				if (null == uniqueColumn)
					uniqueColumn = foreignKey.getTargetAttributes().get(0);

				field.setTargetTableColumn(uniqueColumn);
			}

			fieldList.add(field);
		}
		return fieldList;
	}
}
