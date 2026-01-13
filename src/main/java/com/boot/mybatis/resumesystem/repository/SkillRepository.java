package com.boot.mybatis.resumesystem.repository;

import com.boot.mybatis.resumesystem.entity.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SkillRepository extends JpaRepository<Skill, Long> {
    // 根据 user_id 查询技能
    List<Skill> findByUserId(Long userId);
}