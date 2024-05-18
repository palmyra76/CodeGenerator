package com.palmyralabs.pcg.validator.impl;

import com.palmyralabs.pcg.validator.ValidOption;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class DefaultOptionsProvider extends AbstractOptionsProvider {

	private final ValidOption primaryOption;

}
