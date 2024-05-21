package com.palmyralabs.pcg.commons;

import java.sql.Types;

public class DataTypeConvertor {
	public static String convert(int dataType) {

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
	
 public static String splitData(String data) {
	 return data.replace((char)46, (char)47);
 }
}
