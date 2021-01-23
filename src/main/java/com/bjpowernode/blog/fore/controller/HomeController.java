package com.bjpowernode.blog.fore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/22
 * Description :
 */
@Controller
public class HomeController {

    //首页
    @RequestMapping("/")
    public String index(){
        return "redirect:/view/index.jsp";
    }
}
