package com.palmyralabs.pcg.commons;

import java.sql.Types;

public class DataTypeConvertor {
	
	public static String javaTypeConvert(int dataType) {

		switch (dataType) {
		case Types.CHAR:
		case Types.VARCHAR:
		case Types.LONGNVARCHAR:
		case Types.NCHAR:
			return "String";
		case Types.FLOAT:
		case Types.REAL:
		case Types.NUMERIC:
		case Types.DECIMAL:
			return "Float";
		case Types.SMALLINT:
			return "Short";
		case Types.INTEGER:
			return "Integer";
		case Types.BIGINT:
			return "Long";
		case Types.BIT:
		case Types.BOOLEAN:
			return "Boolean";
		case Types.TIMESTAMP:
		case Types.TIMESTAMP_WITH_TIMEZONE:
		case Types.TIME:
		case Types.TIME_WITH_TIMEZONE:
			return "LocalDateTime";
		case Types.DATE:
			return "LocalDate";
		default:
			return "String";
		}
	}

	public static String reactTypeConvert(int dataType) {

		switch (dataType) {
		case Types.CHAR:
		case Types.VARCHAR:
		case Types.LONGNVARCHAR:
		case Types.NCHAR:
			return "string";
		case Types.FLOAT:
		case Types.REAL:
		case Types.NUMERIC:
		case Types.DECIMAL:
		case Types.SMALLINT:
		case Types.INTEGER:
		case Types.BIGINT:
			return "number";
		case Types.BIT:
		case Types.BOOLEAN:
			return "boolean";
		case Types.TIMESTAMP:
		case Types.TIMESTAMP_WITH_TIMEZONE:
			return "datetime";
		case Types.DATE:
			return "date";
		case Types.TIME:
		case Types.TIME_WITH_TIMEZONE:
			return "time";
		default:
			return "string";
		}
	}

	public static String splitData(String data) {
		return data.replace((char) 46, (char) 47);
	}
}
