package com.red.LEM.service;

import com.red.LEM.entity.User;

public interface UserService {
    User findUser(String username,String password);
}
