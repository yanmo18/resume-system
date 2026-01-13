package com.boot.mybatis.resumesystem.controller;

import com.boot.mybatis.resumesystem.entity.Project;
import com.boot.mybatis.resumesystem.entity.Skill;
import com.boot.mybatis.resumesystem.entity.User;
import com.boot.mybatis.resumesystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.boot.mybatis.resumesystem.service.SkillService;
import com.boot.mybatis.resumesystem.service.ProjectService;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Value;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SkillService skillService;

    @Autowired
    private ProjectService projectService;
    // 从配置文件读取头像路径（替代硬编码）
    @Value("${avatar.upload.path}")
    private String avatarUploadPath;

    @Value("${avatar.access.path}")
    private String avatarAccessPath;

    // 头像存储路径（项目根目录的uploads/avatars，跨环境有效）
    private static final String AVATAR_UPLOAD_DIR = System.getProperty("user.dir") + "/uploads/avatars/";
    // 头像访问前缀（前端通过/avatars/文件名访问）
    private static final String AVATAR_ACCESS_PREFIX = "/avatars/";

    // 显示查看简历页面
    @GetMapping("/resume/{id}")
    public String viewUserResume(@PathVariable Long id, Model model) {
        Optional<User> userOptional = userService.getUser(id);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            List<Skill> skills = skillService.getSkillsByUserId(id);
            List<Project> projects = projectService.getProjectsByUserId(id);

            model.addAttribute("user", user);
            model.addAttribute("skills", skills);
            model.addAttribute("projects", projects);

            return "resume";
        } else {
            return "error";
        }
    }

    // 显示编辑简历页面
    @GetMapping("/resume/edit/{id}")
    public String editUserResume(@PathVariable Long id, Model model) {
        Optional<User> userOptional = userService.getUser(id);
        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get());
            return "resume-edit";
        } else {
            return "error";
        }
    }

    // 处理编辑表单提交，返回JSON数据（适配前端AJAX）
    @PostMapping("/resume/update/{id}")
    @ResponseBody
    public Map<String, Object> updateUserResume(
            @PathVariable Long id,
            @RequestParam String name,
            @RequestParam String school,
            @RequestParam String major,
            @RequestParam String phone,
            @RequestParam String email,
            @RequestParam String introduction,
            @RequestParam(required = false) String avatar,
            @RequestParam(value = "avatarFile", required = false) MultipartFile avatarFile,
            @RequestParam(required = false) String position) {

        Map<String, Object> result = new HashMap<>();
        Optional<User> userOptional = userService.getUser(id);
        if (userOptional.isPresent()) {
            User user = userOptional.get();

            // 1. 更新基本信息（前端position是required，直接赋值）
            user.setName(name);
            user.setSchool(school);
            user.setMajor(major);
            user.setPhone(phone);
            user.setEmail(email);
            user.setIntroduction(introduction);
            user.setPosition(position);

            // 2. 处理头像上传（修复后缀空指针问题）
            if (avatarFile != null && !avatarFile.isEmpty()) {
                // 创建存储目录（递归创建）
                File uploadDir = new File(AVATAR_UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // 生成唯一文件名
                String originalFilename = avatarFile.getOriginalFilename();
                String fileSuffix = "";
                // 避免空指针：判断文件名非空且有后缀
                if (originalFilename != null && originalFilename.lastIndexOf(".") > 0) {
                    fileSuffix = originalFilename.substring(originalFilename.lastIndexOf("."));
                }
                String newFileName = UUID.randomUUID().toString() + fileSuffix;

                // 保存文件
                try {
                    File destFile = new File(AVATAR_UPLOAD_DIR + newFileName);
                    avatarFile.transferTo(destFile);
                    // 更新头像路径
                    user.setAvatar(AVATAR_ACCESS_PREFIX + newFileName);
                } catch (IOException e) {
                    e.printStackTrace();
                    result.put("success", false);
                    result.put("message", "头像上传失败：" + e.getMessage());
                    return result;
                }
            } else {
                // 未上传新头像，保留原有头像（可选：删除此逻辑，直接使用user原有avatar）
                if (avatar != null && !avatar.isEmpty()) {
                    user.setAvatar(avatar);
                }
            }

            // 3. 保存用户信息
            userService.saveUser(user);

            // 返回成功结果
            result.put("success", true);
            result.put("redirectUrl", "/resume/" + id);
            return result;
        } else {
            result.put("success", false);
            result.put("message", "用户不存在");
            return result;
        }
    }
}