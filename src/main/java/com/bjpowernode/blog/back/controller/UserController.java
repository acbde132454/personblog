package com.bjpowernode.blog.back.controller;

import cn.hutool.crypto.SecureUtil;
import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.back.service.UserService;
import com.bjpowernode.blog.base.bean.ResultVo;
import com.bjpowernode.blog.base.constants.BlogConstants;
import com.bjpowernode.blog.base.exception.BlogException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //前台用户登录
    @RequestMapping("/user/foreLogin")
    @ResponseBody
    public ResultVo foreLogin(User user,HttpSession session){
        ResultVo resultVo = new ResultVo();
        user = userService.foreLogin(user);
        resultVo.setOk(true);
        resultVo.setMess("登录成功");
        session.setAttribute(BlogConstants.LOGIN_USER,user);
        resultVo.setT(user);
        return resultVo;
    }


    //前台异步校验用户名是否被注册
    @RequestMapping("/user/verifyUsername")
    @ResponseBody
    public ResultVo verifyUsername(String username){
        ResultVo resultVo = new ResultVo();
        boolean isRegisted = userService.verifyUsername(username);
        resultVo.setOk(isRegisted);
        if(isRegisted){
            resultVo.setMess("用户名已被注册");
        }else{
            resultVo.setMess("该用户名可以被注册^_^");
        }
        return resultVo;
    }

    //前台用户注册
    @RequestMapping("/user/regist")
    @ResponseBody
    public ResultVo regist(User user){
        ResultVo resultVo = new ResultVo();
        userService.regist(user);
        resultVo.setOk(true);
        resultVo.setMess("恭喜您，注册成功");
        return resultVo;
    }

    /**
     * 登录功能
     */
    @RequestMapping("/user/login")
    @ResponseBody
    public ResultVo login(User user, String code, HttpSession session, HttpServletRequest request){
        ResultVo resultVo = new ResultVo();
        try {
            //获取正确的验证码
            String correctCode = (String) session.getAttribute("code");
            //登录IP
            user.setLoginIp(request.getRemoteAddr());
            user = userService.login(user,code,correctCode);
            //把用户信息保存在session中
            session.setAttribute(BlogConstants.LOGIN_USER,user);
            resultVo.setOk(true);
            resultVo.setMess("登录成功");
        } catch (BlogException e) {
            resultVo.setOk(false);
            if(e.getBlogExceptionEnum().getType().equals("001-001")){
                //用户名或密码错误
                resultVo.setMess("用户名或密码错误");
            }else if(e.getBlogExceptionEnum().getType().equals("001-002")){
                //账号被锁定
                resultVo.setMess("账号被锁定，请联系管理员");
            }else if(e.getBlogExceptionEnum().getType().equals("001-003")){
                //账号被锁定
                resultVo.setMess("验证码错误");
            }
        }
        return resultVo;
    }

    //登出功能
    @RequestMapping("/user/loginOut")
    public String loginOut(HttpSession session){
        //从session中移除用户
        session.removeAttribute(BlogConstants.LOGIN_USER);
        return "redirect:/login.jsp";
    }

    //校验用户修改信息输入旧密码是否正确
    @RequestMapping("/user/verifyPassword")
    @ResponseBody
    public ResultVo verifyPassword(HttpSession session,String oldPass){
        String password = SecureUtil.md5(oldPass);
        User user = (User) session.getAttribute("user");
        ResultVo resultVo = new ResultVo();
        if(!user.getPassword().equals(password)){
            resultVo.setOk(false);
            resultVo.setMess("输入的旧密码不对");
        }else{
            resultVo.setOk(true);
        }
        return resultVo;
    }

    //更新用户信息
    @RequestMapping("/user/updateUser")
    @ResponseBody
    public ResultVo updateUser(HttpSession session,User user){
        User sessionUser = (User) session.getAttribute("user");
        user.setUid(sessionUser.getUid());
        //加密密码
        String password = SecureUtil.md5(user.getPassword());
        user.setPassword(password);
        ResultVo resultVo = new ResultVo();
        try {
            userService.updateUser(user);
            resultVo.setOk(true);
            resultVo.setMess("更新用户信息成功");
            //更新session中的用户信息
            session.setAttribute(BlogConstants.LOGIN_USER + user.getUid(),user);
        } catch (BlogException e) {
            resultVo.setOk(false);
            resultVo.setMess("更新用户信息失败");
        }
        return resultVo;
    }
}
