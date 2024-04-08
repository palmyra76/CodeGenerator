package com.example.palmyralabs.projectgenerator.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileUtil {

	public static boolean createDir(String path) {
		File folder = new File(path);
		if (!folder.exists())
			return (folder.mkdirs());
		return false;
	}

	public static boolean createFile(String path) throws IOException {
		File file = new File(path);
		if (!file.exists())
			return (file.createNewFile());
		return false;
	}
	
	public static boolean writeFile(String path, StringBuilder data) throws IOException {
		File file = new File(path);
		FileWriter writer=new FileWriter(file);
		writer.close();
		return false;
	}
}
