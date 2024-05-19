package com.palmyralabs.pcg.template.generator;

import java.nio.file.Path;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class TargetFileInfo {
	private String templateName;
	private String outputFile;
	private Path outputFilePath; // Path does not contain file name
}
