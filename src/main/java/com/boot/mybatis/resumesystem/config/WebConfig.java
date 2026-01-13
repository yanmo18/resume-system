package com.boot.mybatis.resumesystem.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.beans.factory.annotation.Value;

/**
 * 静态资源映射配置类
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    // 头像上传的物理路径（从配置文件读取）
    @Value("${avatar.upload.path}")
    private String avatarUploadPath;

    // 头像的访问路径前缀（从配置文件读取）
    @Value("${avatar.access.path}")
    private String avatarAccessPath;

    /**
     * 配置静态资源映射规则：前端/avatars/** → 本地物理路径
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 关键修正：确保访问路径是/**（如/avatars/**），物理路径以file:开头
        registry.addResourceHandler(avatarAccessPath + "**")
                .addResourceLocations("file:" + avatarUploadPath); // file:表示本地文件系统路径
    }
}