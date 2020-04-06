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
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("username")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 跳转登陆
     *
     * @return
     */
    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }

    /**
     * 跳转注册
     *
     * @return
     */
    @RequestMapping("/register")
    public String toRegister() {
        return "register";
    }

    /**
     * 验证登录
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
        User user = userService.findUserByName(username);
        if (user == null) return -1; //用户不存在
        else if(!password.equals(user.getPassword())) return 0;  //密码错误
        else return 1; //登陆成功
    }

    /**
     * 注册验证
     * 使用 @ResponseBody 在ajax异步获取数据时使用。
     */
    @RequestMapping(value = "register_check", method = RequestMethod.POST)
    @ResponseBody
    public int register(String username, String password, String invCode) {
        if(!invCode.equals("123456"))return -1;
        User user = userService.findUserByName(username);
        if(user != null)return 0;
        else{
            try {
                password = MD5.md5(password);
            } catch (Exception e) {
                e.printStackTrace();
            }
            userService.addUser(username,password);
            return 1;
        }
    }

}
