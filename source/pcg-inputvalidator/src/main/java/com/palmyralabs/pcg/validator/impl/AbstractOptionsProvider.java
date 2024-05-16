package com.palmyralabs.pcg.validator.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.cli.Options;

import com.palmyralabs.pcg.validator.OptionsProvider;
import com.palmyralabs.pcg.validator.ValidOption;

import lombok.Getter;

@Getter
public abstract class AbstractOptionsProvider implements OptionsProvider {
	private final Options options = new Options();

	private final Map<String, List<ValidOption>> optionListMap = new HashMap<>();

	public void addOption(ValidOption vo, String... keys) {
		options.addOption(vo);
		for (String key : keys) {
			add(vo, key);
		}
	}

	private void add(ValidOption vo, String key) {
		List<ValidOption> optionList = optionListMap.get(key);
		if (null == optionList) {
			optionList = new ArrayList<>();
			optionListMap.put(key, optionList);
		}
		optionList.add(vo);
	}

	public List<ValidOption> getOptions(String primaryFilterValue) {
		return optionListMap.get(primaryFilterValue);
	}
}
