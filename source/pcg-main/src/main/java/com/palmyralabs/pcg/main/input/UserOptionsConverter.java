package com.palmyralabs.pcg.main.input;

import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;
import com.zitlab.palmyra.common.util.TextUtil;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.*;

public class UserOptionsConverter {
	public UserOptions convert(List<KeyValue> options) {
		UserOptionsImpl r = new UserOptionsImpl();

		Map<String, String> valueMap = new HashMap<>();
		for (KeyValue kv : options) {
			valueMap.put(kv.getKey(), kv.getValue());
		}

		r.setFramework(getFramework(valueMap.get(L_FRAMEWORK)));
		r.setBuildTool(getBuildTool(valueMap.get(L_SPRING_BUILD)));
		r.setMode(getMode(valueMap.get(L_MODE)));

		r.setPackageName(valueMap.get(L_PACKAGE));
		r.setBaseOutputFolder(Paths
				.get(valueMap.get(L_OUTPUT_PATH) + "/codeGen/" + valueMap.get(L_PROJECT_NAME).toLowerCase() + "/"));

		r.setGroup(getGroup(valueMap.get(L_PACKAGE)));
		r.setProjectName(valueMap.get(L_PROJECT_NAME).toLowerCase());
		r.setConvertedProjectName(getConvertedProjectName(valueMap.get(L_PACKAGE)));
		return r;
	}

	private Mode getMode(String v) {
		return Mode.byValue(v);
	}

	private BuildTool getBuildTool(String v) {
		return BuildTool.byValue(v);
	}

	private Framework getFramework(String v) {
		return Framework.byValue(v);
	}

	private String getGroup(String v) {
		int lastIndex = v.lastIndexOf('.');
		return v.substring(0, lastIndex);
	}

//	private String getProjectName(String v) {
//		int lastIndex = v.lastIndexOf('.');
//		return v.substring(lastIndex + 1);
//	}

	private String getConvertedProjectName(String v) {
		int lastIndex = v.lastIndexOf('.');
		String projectName = v.substring(lastIndex + 1);
		return TextUtil.camelCaseFirstLetterUpperCase(projectName);
	}
}
