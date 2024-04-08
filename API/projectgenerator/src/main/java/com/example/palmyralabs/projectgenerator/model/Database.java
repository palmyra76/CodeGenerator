package com.example.palmyralabs.projectgenerator.model;

import com.zitlab.palmyra.common.util.TextUtil;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Database {
	private String name;
	private String convertedName;
	
	Database(String name) {
		this.name = name;
		this.convertedName=TextUtil.camelCase(name);
	}
}