package com.example.palmyralabs.projectgenerator.model;

import java.util.List;

import com.example.palmyralabs.projectgenerator.util.DataUtil;
import com.zitlab.palmyra.common.util.TextUtil;
import com.zitlab.palmyra.sqlstore.base.dbmeta.ForeignKey;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleAttribute;
import com.zitlab.palmyra.sqlstore.base.dbmeta.TupleType;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Field {

	private String code;
	private String columnName;
	private Integer type;
	private String dataType;
	private Boolean isPrimaryKey;
	private Integer isForeignKey;
	private String targetSchema;
	private String targetTable;
	private List<String> targetAttributes;

	public Field(TupleType table, TupleAttribute attribute) {
		this.code = attribute.getAttribute();
		this.columnName = attribute.getColumnName();
		this.type = attribute.getDataType();
		this.dataType = DataUtil.convert(type);
		this.isPrimaryKey = attribute.isPrimaryKey();
		this.isForeignKey = attribute.getForeignKeyCount();
		ForeignKey foreignKey = table.getForeignKey(attribute.getAttribute());
		if (foreignKey != null) {
			this.targetSchema = foreignKey.getTargetSchema();
			this.targetTable = TextUtil.camelCaseFirstLetterUpperCase(foreignKey.getTargetTable());
			this.targetAttributes = foreignKey.getTargetAttributes();
		}

	}

}