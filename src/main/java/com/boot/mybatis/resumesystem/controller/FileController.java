// src/main/java/com/boot/mybatis/resumesystem/controller/FileController.java
package com.boot.mybatis.resumesystem.controller;

import com.boot.mybatis.resumesystem.service.UserService;
import com.boot.mybatis.resumesystem.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/file")
public class FileController {

    @Value("${avatar.upload.path}")
    private String avatarUploadPath;

    @Value("${avatar.access.path}")
    private String avatarAccessPath;

    @Autowired
    private UserService userService;

    /**
     * 处理头像上传
     */
    @PostMapping("/upload-avatar")
    public Map<String, Object> uploadAvatar(
            @RequestParam("file") MultipartFile file,
            @RequestParam("userId") Long userId) {

        Map<String, Object> result = new HashMap<>();
        try {
            // 验证文件类型（只允许图片）
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                result.put("success", false);
                result.put("message", "请上传图片文件");
                return result;
            }

            // 上传文件
            String fileName = FileUploadUtil.uploadFile(file, avatarUploadPath);

            // 更新用户头像
            userService.updateAvatar(userId, fileName);

            result.put("success", true);
            result.put("message", "上传成功");
            result.put("avatarUrl", avatarAccessPath + fileName);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "上传失败：" + e.getMessage());
        }
        return result;
    }
}