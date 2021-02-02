package com.bjpowernode.blog.fore.service.impl;

import com.bjpowernode.blog.back.bean.Comment;
import com.bjpowernode.blog.base.util.DateTimeUtil;
import com.bjpowernode.blog.fore.mapper.CommentMapper;
import com.bjpowernode.blog.fore.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void saveComments(Comment comment) {
        comment.setIsLock("0");
        comment.setCreate_time(DateTimeUtil.getSysTime());
        commentMapper.insertSelective(comment);
    }
}
