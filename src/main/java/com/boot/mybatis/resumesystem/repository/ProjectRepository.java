package com.boot.mybatis.resumesystem.repository;

import com.boot.mybatis.resumesystem.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {
    // 根据 user_id 查询项目
    List<Project> findByUserId(Long userId);
}