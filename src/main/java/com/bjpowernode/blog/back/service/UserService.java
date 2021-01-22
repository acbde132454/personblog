package com.bjpowernode.blog.back.service;

import com.bjpowernode.blog.back.bean.User;

public interface UserService {
    User login(User user,String code,String correctCode);

    void updateUser(User user);
}
