package com.palmyralabs.pcg.commons;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Field {
	private String columnName;
	private String dataType;
	private Boolean isPrimaryKey;
	private Integer isForeignKey;
	private String targetSchema;
	private String targetTable;
	private List<String> targetAttributes;
}
