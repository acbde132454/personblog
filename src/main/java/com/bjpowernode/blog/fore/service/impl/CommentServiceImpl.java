package com.bjpowernode.blog.fore.service.impl;

import com.bjpowernode.blog.back.bean.Article;
import com.bjpowernode.blog.back.bean.Comment;
import com.bjpowernode.blog.back.mapper.ArticleMapper;
import com.bjpowernode.blog.base.util.DateTimeUtil;
import com.bjpowernode.blog.fore.mapper.CommentMapper;
import com.bjpowernode.blog.fore.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void saveComments(Comment comment) {
        //查询文章信息
        Article article = articleMapper.selectByPrimaryKey(comment.getAid());
        comment.setIsLock("0");
        comment.setCreate_time(DateTimeUtil.getSysTime());
        //是否是一级评论
        if(article.getIsCommented().equals("0")){
            comment.setPid(null);
        }
        int count = commentMapper.insertSelective(comment);
    }
}
