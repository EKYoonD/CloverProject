package com.clover.spring.ckeditor.fileUpload;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

//import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RestController
@RequestMapping("/upload")
public class FileUploadController {

    private final FileManager fileManager;

    FileUploadController(FileManager fileManager){
        this.fileManager = fileManager;
    }

    @PostMapping("/image")
    public JSONObject image(@RequestParam(name = "upload")CommonsMultipartFile file){
        JSONObject json = new JSONObject();
        if(file == null || file.isEmpty()){
            json.put("uploaded",false);
            json.put("url","");
            return json;
        }
        if(file.getOriginalFilename().isEmpty() || file.getOriginalFilename() == "" || file.getOriginalFilename().equals(" ") || !isAllow(file.getOriginalFilename())){
            json.put("uploaded",false);
            json.put("url","");
            return json;
        }
        
        String url = fileManager.upload(file);
        if(url.isEmpty() || url == "" || url.equals(" ")){
            json.put("uploaded",false);
            json.put("url","");
            return json;
        }else{
            json.put("uploaded",true);
            json.put("url",url);
            return json;
        }
    }

    private boolean isAllow(String fileName){
        String[] allowFiles = {".gif",".png",".jpg",".jpeg",".bpm",".svg"};
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        List<String> suffixList = Arrays.stream(allowFiles).collect(Collectors.toList());
        return suffixList.contains(suffix);
    }
}
