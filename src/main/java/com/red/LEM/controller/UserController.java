package com.red.LEM.controller;

import com.red.LEM.entity.User;
import com.red.LEM.service.UserService;
import com.red.LEM.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    //跳转登录
    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }
    /*验证登录
     * 使用 @ResponseBody 在ajax异步获取数据时使用。返回0/1
     */
    @RequestMapping(value = "login_check", method = RequestMethod.POST)
    @ResponseBody
    public int login(String username, String password) {
        try {
            password = MD5.md5(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = userService.findUser(username,password);
        return (user == null)? 0:1;
    }

//    @RequestMapping("/login")
//    public String login(HttpServletRequest request,HttpServletResponse response) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        try {
//            password = MD5.md5(password);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        User user = userService.findUser(username,password);
//        if(user == null){
//            return "login";
//        }
//        return "redirect:listEquipment";
//    }
}
