package com.bjpowernode.blog.back.service.impl;

import cn.hutool.crypto.SecureUtil;
import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.back.mapper.UserMapper;
import com.bjpowernode.blog.back.service.UserService;
import com.bjpowernode.blog.base.exception.BlogException;
import com.bjpowernode.blog.base.exception.BlogExceptionEnum;
import com.bjpowernode.blog.base.util.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //用户后台登录功能
    @Override
    public User login(User user,String code,String correctCode) {
        String IP = user.getLoginIp();
        user.setLoginIp(null);
        //加密密码
        String password = SecureUtil.md5(user.getPassword());
        user.setPassword(password);

        List<User> users = userMapper.select(user);
        //先判断输入的验证码正确与否
        if(!correctCode.equals(code)){
            throw new BlogException(BlogExceptionEnum.LOGIN_CODE);
        }else{
            if(users.size() == 0){
                throw new BlogException(BlogExceptionEnum.LOGIN_USER_PASS);
            }else{
                //用户账号是否被锁定
                user = users.get(0);
                if("0".equals(user.getState())){
                    throw new BlogException(BlogExceptionEnum.LOGIN_STATE);
                }else{
                    //更新用户登录时间和登录次数和登录IP
                    user.setLoginCout(Integer.parseInt(user.getLoginCout()) + 1 + "");
                    user.setLastLoginTime(DateTimeUtil.getSysTime());
                    user.setLoginIp(IP);
                    userMapper.updateByPrimaryKeySelective(user);
                }
            }
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        int count = userMapper.updateByPrimaryKeySelective(user);
        if(count == 0){
            throw new BlogException(BlogExceptionEnum.USER_UPDATE);
        }
    }
}
