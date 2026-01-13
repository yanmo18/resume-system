package com.boot.mybatis.resumesystem.service;

import com.boot.mybatis.resumesystem.entity.Project;
import com.boot.mybatis.resumesystem.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    // 根据用户ID获取项目
    public List<Project> getProjectsByUserId(Long userId) {
        return projectRepository.findByUserId(userId);
    }
}