package com.bjpowernode.blog.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/12
 * Description :视图跳转Controller
 */
@Controller
public class ViewController {

    //跳转所有视图    required:默认是true,每次必须给该变量传值，false可以传值，也可以不传值
    @RequestMapping({"/toView/{firstView}/{secondView}/{finalView}","/toView/{firstView}/{finalView}","/toView/{finalView}"})
    public String toView(
            @PathVariable(value = "firstView",required = false) String firstView,
            @PathVariable(value = "secondView",required = false) String secondView,
            @PathVariable("finalView") String finalView){

        if(firstView != null){
            if(secondView != null){
                return firstView + File.separator + secondView + File.separator + finalView;
            }
            return firstView + File.separator + finalView;
        }else{
            return finalView;
        }
    }
}
