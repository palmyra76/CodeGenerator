package com.palmyralabs.pcg.main.input;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.BuildTool;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.commons.options.Mode;

import static com.palmyralabs.pcg.main.input.CommandLineOptions.*;

public class UserOptionsConverter {
	public UserOptions convert(List<KeyValue> options) {
		UserOptionsImpl r = new UserOptionsImpl();

		Map<String, String> valueMap = new HashMap<>();
		for (KeyValue kv : options) {
			valueMap.put(kv.getKey(), kv.getValue());
		}

		r.setFramework(getFramework(valueMap.get(L_FRAMEWORK)));
		r.setBuildTool(getBuildTool(valueMap.get(L_FRAMEWORK)));
		r.setMode(getMode(valueMap.get(L_MODE)));

		r.setPackageName(valueMap.get(L_PACKAGE));

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
}
