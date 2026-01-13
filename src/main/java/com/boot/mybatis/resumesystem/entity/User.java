package com.boot.mybatis.resumesystem.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table; // 导入Table注解

@Entity
@Table(name = "user") // 显式指定映射的数据库表名（与数据库表名一致）
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String school;
    private String major;
    private String phone;
    private String email;
    private String introduction;
    private String avatar;
    private String position; // 应聘职位
    // User.java
    private String username; // 添加该属性，并补充getter/setter

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getAvatar() {

        return avatar;
    }

    public void setAvatar(String avatar) {

        this.avatar = avatar;
    }// 补充username的getter/setter

    // 生成getter
    public String getPosition() {
        return position;
    }


    // 生成setter（解决“无法解析方法setPosition”错误）
    public void setPosition(String position) {
        this.position = position;
    }
}
