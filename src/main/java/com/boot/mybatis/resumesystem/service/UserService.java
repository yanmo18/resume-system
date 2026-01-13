package com.boot.mybatis.resumesystem.service;

import com.boot.mybatis.resumesystem.entity.User;
import com.boot.mybatis.resumesystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // 根据用户ID查询用户
    public Optional<User> getUser(Long id) {
        return userRepository.findById(id);
    }

    // 保存用户
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    // 更新用户头像
    public User updateAvatar(Long userId, String avatarFileName) {
        // 查询用户并处理不存在的情况
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("用户不存在，ID: " + userId));
        // 设置新头像文件名
        user.setAvatar(avatarFileName);
        // 保存更新
        return userRepository.save(user);
    }
}