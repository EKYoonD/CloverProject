package com.clover.spring.ckeditor.common;

import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Consts {
	public static String FILE_STORAGE_ROOT = getRootPath();

    private static String getRootPath(){
        try {
            Resource resource = new ClassPathResource("");
            return resource.getFile().getAbsolutePath(); //C:\ProjectSprigRPG\MovieMania\target\classes
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
