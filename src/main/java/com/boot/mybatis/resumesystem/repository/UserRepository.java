package com.boot.mybatis.resumesystem.repository;

import com.boot.mybatis.resumesystem.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import org.springframework.stereotype.Repository;

@Repository
// UserRepository.java
public interface UserRepository extends JpaRepository<User, Long> {
    // 方法名与User的属性name对应
    Optional<User> findByName(String name);
}