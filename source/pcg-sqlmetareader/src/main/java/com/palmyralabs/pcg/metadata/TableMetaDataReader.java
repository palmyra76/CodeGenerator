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
import com.zitlab.palmyra.sqlstore.base.dbmeta.UniqueKey;
import com.zitlab.palmyra.store.schema.Schema;

public class TableMetaDataReader implements UniqueColumnProvider {

	public Map<String, Table> getTable(Schema schema, UserOptions options) {
		Map<String, TupleType> tuples = schema.getEntityMap();
		Map<String, Table> tables = new HashMap<String, Table>();

		for (TupleType tuple : tuples.values()) {
			Table table = new Table();
			table.setName(tuple.getName());
			table.setSplitedName(NameUtil.splitData(tuple.getName()));
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
			field.setSplitedColumnName(NameUtil.splitData(attribute.getAttribute()));
			field.setMandatory(attribute.isMandatory());
			field.setPrimaryKey(attribute.isPrimaryKey());
			field.setForeignKey(attribute.getForeignKeyCount());

			ForeignKey foreignKey = tuple.getForeignKey(attribute.getAttribute());

			if (foreignKey != null) {
				field.setTargetSchema(foreignKey.getTargetSchema());
				field.setTargetTable(TextUtil.camelCase(foreignKey.getTargetTable()));
				field.setConvertedTargetTableName(TextUtil.camelCaseFirstLetterUpperCase(foreignKey.getTargetTable()));
				field.setTargetAttribute(foreignKey.getTargetAttributes().get(0));

				UniqueColumn uniqueColumn = getUniqueColumn(foreignKey.getTargetType());

				field.setTargetTableColumn(uniqueColumn.getName());
				field.setTargetColumnJavaType(uniqueColumn.getJavaDataType());
				field.setTargetColumnReactType(uniqueColumn.getReactDataType());
			}

			fieldList.add(field);
		}
		return fieldList;
	}

	@Override
	public UniqueColumn getUniqueColumn(TupleType tuple) {
		UniqueColumn uniqueColumn = new UniqueColumn();
		
		Map<String, UniqueKey> uniqueKey = tuple.getUniqueKeyMap();
		UniqueKey selectedKey = null;
		int satisifedCriterias = 0;
		

		for (UniqueKey uq : uniqueKey.values()) {
			if (uq.size() == 1) {
				if (0 == satisifedCriterias) {
					selectedKey = uq;
					satisifedCriterias = 1;
				}

				String uqColumn = uq.getColumns().keySet().iterator().next().toLowerCase();

				if (uqColumn.equals("name"))
					break;

				else if (uqColumn.contains("name") && satisifedCriterias < 3) {
					selectedKey = uq;
					satisifedCriterias = 3;
					continue;
				} else if (uqColumn.contains("code") && satisifedCriterias < 2) {
					selectedKey = uq;
					satisifedCriterias = 2;
					continue;
				}
			}
		}
		
		int dataType = selectedKey.getColumns().entrySet().iterator().next().getValue().getDataType();
		uniqueColumn.setName(selectedKey.getColumns().keySet().iterator().next());
		uniqueColumn.setJavaDataType(DataTypeConvertor.javaTypeConvert(dataType));
		uniqueColumn.setReactDataType(DataTypeConvertor.reactTypeConvert(dataType));
		
		return uniqueColumn;
	}

}
