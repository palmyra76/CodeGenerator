package com.palmyralabs.pcg.main;

import java.util.List;

import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.main.input.GeneratorContextImpl;
import com.palmyralabs.pcg.main.input.UserInputs;
import com.palmyralabs.pcg.main.input.UserOptionsConverter;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorFactory;
import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;

public class CodeGenMain {

	public static void main(String[] args) {
		CommandLineValidator validator = new CommandLineValidator();
		List<KeyValue> userChoices = validator.validate(UserInputs.getProvider(), args);
//		List<KeyValue> userChoices = new DummyUserOptions().getOptions();

		UserOptions options = new UserOptionsConverter().convert(userChoices);
		System.out.println(options.getFramework());

		GeneratorContext ctx = new GeneratorContextImpl(options, "dummy");
		
		List<TemplateProcessor> processors = TemplateProcessorFactory.getProcessors(options);
		for (TemplateProcessor tp : processors) {
			tp.process(options, ctx);
		}
	}

}
