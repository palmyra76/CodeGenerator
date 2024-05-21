package com.palmyralabs.pcg.commons;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Table {
	private String name;
	private String convertedName;
	private List<Field> fields;
	private String packageName;
}
