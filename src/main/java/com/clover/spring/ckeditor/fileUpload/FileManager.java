package com.clover.spring.ckeditor.fileUpload;

import java.util.Collection;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public interface FileManager {
    String upload(CommonsMultipartFile multipartFile);
    boolean remove(String url);
    void remove(Collection<String> urls);
}
