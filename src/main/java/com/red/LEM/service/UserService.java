package com.red.LEM.service;

import com.red.LEM.entity.User;

public interface UserService {
    User findUserByName(String username);
    void addUser(String username, String password);
}
