package com.palmyralabs.pcg.main;

import java.util.List;
import java.util.Map;

import com.palmyralabs.pcg.commons.DataSourceOptions;
import com.palmyralabs.pcg.commons.GeneratorContext;
import com.palmyralabs.pcg.commons.KeyValue;
import com.palmyralabs.pcg.commons.Table;
import com.palmyralabs.pcg.commons.UserOptions;
import com.palmyralabs.pcg.commons.options.Framework;
import com.palmyralabs.pcg.main.input.DataSourceOptionsConverter;
import com.palmyralabs.pcg.main.input.GeneratorContextImpl;
import com.palmyralabs.pcg.main.input.UserInputs;
import com.palmyralabs.pcg.main.input.UserOptionsConverter;
import com.palmyralabs.pcg.metadata.SchemaMetaDataProvider;
import com.palmyralabs.pcg.metadata.TableMetaDataReader;
import com.palmyralabs.pcg.template.TemplateProcessor;
import com.palmyralabs.pcg.template.TemplateProcessorFactory;
import com.palmyralabs.pcg.validator.cmdline.CommandLineValidator;
import com.zitlab.palmyra.store.schema.Schema;

public class CodeGenMain {

	public static void main(String[] args) {
		List<KeyValue> userChoices = getUserInput(args);

		if (userChoices.isEmpty())
			System.exit(0);

		Schema schema = getSchema(userChoices);
		if (null == schema) {
			System.out.println("Not able to read metadata from database, exiting");
			return;
		}

		generate(userChoices, schema);

		System.out.println("The project was generated in the \"" + getOutputPath(userChoices) + "\" directory.");

	}

	private static List<KeyValue> getUserInput(String[] args) {
		CommandLineValidator validator = new CommandLineValidator();
		return validator.validate(UserInputs.getProvider(), args);
//		return new DummyUserOptions().getOptions();
	}

	private static void generate(List<KeyValue> userChoices, Schema schema) {
		UserOptions options = new UserOptionsConverter().convert(userChoices);
		DataSourceOptions dsOptions = new DataSourceOptionsConverter().convert(userChoices);
		Map<String, Table> tables = new TableMetaDataReader().getTable(schema, options);

		if (tables.isEmpty()) {
			System.out.println("Not able to read metadata from database, exiting");
			return;
		}
		GeneratorContext ctx = new GeneratorContextImpl(dsOptions, options, schema, tables);
		List<TemplateProcessor> processors = TemplateProcessorFactory.getProcessors(options);
		for (TemplateProcessor tp : processors) {
			tp.process(options, ctx);
		}
	}

	private static Schema getSchema(List<KeyValue> userChoices) {
		DataSourceOptionsConverter dsConverter = new DataSourceOptionsConverter();
		DataSourceOptions dsOptions = dsConverter.convert(userChoices);
		SchemaMetaDataProvider metadataProvider = new SchemaMetaDataProvider(dsOptions);
		return metadataProvider.getSchema();
	}

	private static String getOutputPath(List<KeyValue> userChoices) {
		UserOptions options = new UserOptionsConverter().convert(userChoices);

		if (options.getFramework().equals(Framework.SpringBoot)) {
			String path = options.getBaseOutputFolder().toAbsolutePath().toString();
			return path + "/service";
		}

		else if (options.getFramework().equals(Framework.React)) {
			String path = options.getBaseOutputFolder().toAbsolutePath().toString();
			return path + "/web";
		}

		return options.getBaseOutputFolder().toString();
	}

}
