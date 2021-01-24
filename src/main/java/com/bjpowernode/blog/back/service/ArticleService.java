package com.bjpowernode.blog.back.service;

import com.bjpowernode.blog.back.bean.Article;

import java.util.List;

public interface ArticleService {
    void saveOrUpdateArticle(Article article,String aid);

    List<Article> list(String uid,String title);

    void updateIsOpen(String isOpen, String aid);

    Article queryById(String aid);

    void deleteArticle(String aid);

    List<Article> queryTop6();

    String addThumbsUp(String aid);
}
