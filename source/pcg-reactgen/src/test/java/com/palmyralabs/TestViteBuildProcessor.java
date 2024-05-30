package com.palmyralabs;

import java.nio.file.Paths;

import com.palmyralabs.pcg.react.ViteBuildTemplateProcessor;

public class TestViteBuildProcessor {

	public static void main(String[] args) {
		ViteBuildTemplateProcessor pr  = new ViteBuildTemplateProcessor();
		
		UserOptionsImpl uo = new UserOptionsImpl();
		uo.setBaseOutputFolder(Paths.get("/home/lingam/codgen"));
		pr.process(uo, null);
	}

}
