package com.bjpowernode.blog.base.interceptor;

import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.base.constants.BlogConstants;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取用户的请求地址
        String requestURL = request.getRequestURL().toString();
        //已经登录过的用户得放行
        User user = (User) request.getSession().getAttribute(BlogConstants.LOGIN_USER);
        if(user != null){
            //用户登录了
            return true;
        }
        //重定向到登录页面
        response.sendRedirect("/blog/login.jsp");
        return false;
    }
}
