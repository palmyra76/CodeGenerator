package com.palmyralabs.pcg.main.input;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.UserOptions;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GeneratorContextImpl implements GeneratorContext{
	private UserOptions userOptions;
	private String dataModel;
}
