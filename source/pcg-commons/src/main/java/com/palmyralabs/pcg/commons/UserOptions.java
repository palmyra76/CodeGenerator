package com.palmyralabs.pcg.commons;

import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;

public interface UserOptions {
	Framework getFramework();

	String getBuildTool();

	Mode getMode();

	String getPackage();

	String getFolder();
}
