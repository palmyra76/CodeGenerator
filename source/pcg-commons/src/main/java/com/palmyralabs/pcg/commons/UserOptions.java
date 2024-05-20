package com.palmyralabs.pcg.commons;

import java.nio.file.Path;

import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;

public interface UserOptions {
	Framework getFramework();

	BuildTool getBuildTool();

	Mode getMode();

	String getPackageName();

	Path getBaseOutputFolder();
	
	String getGroup();
	
	String getProjectName();
	
	String getConvertedProjectName();
}
