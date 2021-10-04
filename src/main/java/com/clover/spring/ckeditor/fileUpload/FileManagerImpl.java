package com.clover.spring.ckeditor.fileUpload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Objects;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.clover.spring.ckeditor.common.Consts;

@Service(value = "fileManager")
public class FileManagerImpl implements FileManager {
	private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyyMMdd");

	@Override
	public String upload(CommonsMultipartFile multipartFile) {
        String storageRoot = Consts.FILE_STORAGE_ROOT + File.separator+"static" + File.separator+"file" + File.separator + "board";
        String path = "";
        String suffix = Objects.requireNonNull(multipartFile.getOriginalFilename())
                .substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        String fileName = SIMPLE_DATE_FORMAT.format(new Date())+"-"
                + UUID.randomUUID().toString().replaceAll("-","").toLowerCase()
                + suffix;
        File file = new File(storageRoot+File.separator+fileName);
        if(!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
        }
        try {
            multipartFile.transferTo(file);
            path = "/file/board/"+fileName;
        }catch (IOException e){
            e.printStackTrace();
        }
        
        System.out.println("storageRoot = " + storageRoot);
        System.out.println("path = " + path);
        System.out.println("fileName = " + fileName);
        System.out.println("file = " + file);
        
        return path;
	}

	@Override
	public boolean remove(String url) {
        String path = Consts.FILE_STORAGE_ROOT+ File.separator+"images"+url;
        File file = new File(path);
        if(file.exists() && file.isFile()){
            return file.delete();
        }
        return false;
	}

	@Override
	public void remove(Collection<String> urls) {
        if(!CollectionUtils.isEmpty(urls)){
            urls.stream().allMatch(this::remove);
        }
    }

}
