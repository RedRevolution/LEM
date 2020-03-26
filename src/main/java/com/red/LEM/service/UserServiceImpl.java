package com.red.LEM.service;

import com.red.LEM.dao.UserDao;
import com.red.LEM.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User findUser(String username, String password) {
        User user = userDao.findUser(username,password);
        return user;
    }
}
