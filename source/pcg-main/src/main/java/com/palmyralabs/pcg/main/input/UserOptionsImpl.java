package com.palmyralabs.pcg.main.input;

import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserOptionsImpl implements UserOptions {
	private Framework framework;
	private BuildTool buildTool;
	private Mode mode;
	private String packageName;
	private String baseOutputFolder;

}
