package com.palmyralabs.pcg.template.generator;

import com.palmyralabs.pcg.commons.TemplateInfo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor	
public class DefaultTemplateInfo implements TemplateInfo{

	private final String name;
	private final String location;

}
