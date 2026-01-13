package com.boot.mybatis.resumesystem.service;

import com.boot.mybatis.resumesystem.entity.Skill;
import com.boot.mybatis.resumesystem.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkillService {

    @Autowired
    private SkillRepository skillRepository;

    // 根据用户ID获取技能
    public List<Skill> getSkillsByUserId(Long userId) {
        return skillRepository.findByUserId(userId);
    }
}