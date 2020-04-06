package com.red.LEM.dao;

import com.red.LEM.entity.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDaoTest extends BaseTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void testfindUser(){
        User a = userDao.findUserByName("red");
        System.out.println(a.getPassword());
        System.out.println(a.getUsername());
        //System.out.println(userDao.findUser("ed","123456"));
    }
}