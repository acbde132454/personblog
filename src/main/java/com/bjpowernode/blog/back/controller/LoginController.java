package com.bjpowernode.blog.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :    基本视图跳转
 */
@Controller
public class LoginController {

    //跳转到后台登录页面
    @RequestMapping("/login")
    public String toLogin(){
        return "redirect:/login.jsp";
    }

    //跳转到后台首页
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "../index";
    }
}
