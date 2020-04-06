package com.red.LEM.dao;

import com.red.LEM.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User findUserByName(@Param("username") String username);
    void addUser(@Param("username") String username,
                 @Param("password") String password);
}
