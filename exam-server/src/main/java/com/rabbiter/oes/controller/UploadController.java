package com.rabbiter.oes.controller;


import com.rabbiter.oes.entity.ApiResult;
import com.rabbiter.oes.entity.LLMQuestion;
import com.rabbiter.oes.service.UploadService;
import com.rabbiter.oes.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@RestController
public class UploadController {

    @Autowired
    private UploadService uploadService;

    private static final String UPLOAD_DIR = "D:\\SystemStorage\\Desktop\\研一课程相关资料\\高级软件工程\\大作业\\workspace\\LLMforCreateQuestion\\LLMforCreateQuestion\\exam-server\\src\\main\\python\\filedata\\"; // 本地存储目录

    @PostMapping("/upload")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("请上传文件");
        }
        try {
            // 生成唯一的文件名
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = UUID.randomUUID().toString() + fileExtension;

            // 创建文件保存路径
            File saveLocation = new File(UPLOAD_DIR + newFilename);

            // 保存文件
            file.transferTo(saveLocation);

            // 返回文件的本地存储路径
            return ResponseEntity.ok(saveLocation.getName());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件上传失败: " + e.getMessage());
        }
    }

    @PostMapping("/llmSubmit")
    public ApiResult handleSubmit(@RequestBody LLMQuestion llmQuestion) {
        System.out.println(llmQuestion);

        uploadService.handleSubmit(llmQuestion);

        return ApiResultHandler.success();
    }



}
