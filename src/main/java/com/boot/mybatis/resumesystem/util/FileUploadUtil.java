// src/main/java/com/boot/mybatis/resumesystem/util/FileUploadUtil.java
package com.boot.mybatis.resumesystem.util;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class FileUploadUtil {

    /**
     * 上传文件并返回文件名
     * @param file 上传的文件
     * @param uploadDir 上传目录
     * @return 生成的唯一文件名
     */
    public static String uploadFile(MultipartFile file, String uploadDir) throws IOException {
        // 创建目录（如果不存在）
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // 生成唯一文件名（避免重名）
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString() + suffix;

        // 保存文件
        File dest = new File(uploadDir + fileName);
        file.transferTo(dest);

        return fileName;
    }
}