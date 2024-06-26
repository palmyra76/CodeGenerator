package com.palmyralabs.pcg.commons;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Field {
	private String columnName;
	private String splitedName;
	private String javaDataType;
	private String reactDataType;
	private boolean mandatory;
	private Boolean isPrimaryKey;
	private Integer isForeignKey;
	private String targetSchema;
	private String targetTable;
	private String convertedTargetTableName;
	private String targetAttribute;
	private String targetTableColumn;
}
