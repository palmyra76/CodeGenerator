package com.palmyralabs.pcg.template.generator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class FileRef {
	private String templateName;
	private String outputFilePath;
}
