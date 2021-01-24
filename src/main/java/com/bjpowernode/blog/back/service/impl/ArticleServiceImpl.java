package com.bjpowernode.blog.back.service.impl;

import com.bjpowernode.blog.back.bean.Article;
import com.bjpowernode.blog.back.bean.Category;
import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.back.mapper.ArticleMapper;
import com.bjpowernode.blog.back.mapper.CategoryMapper;
import com.bjpowernode.blog.back.mapper.UserMapper;
import com.bjpowernode.blog.back.service.ArticleService;
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
 * Date : 2021/1/12
 * Description :
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public void saveOrUpdateArticle(Article article,String aid) {
        if(aid == null){
            //添加
            //访问量
            article.setVisit_count(0+"");
            //创建时间
            article.setCreate_time(DateTimeUtil.getSysTime());
            //是否热门
            article.setIs_hot(0+"");
            //点赞数
            article.setThumbsUp(0+"");
            int count = articleMapper.insertSelective(article);
            if(count == 0){
                throw new BlogException(BlogExceptionEnum.ARTICLE_ADD);
            }
        }else{
            //修改
            //更新时间
            article.setUpdate_time(DateTimeUtil.getSysTime());
            int count = articleMapper.updateByPrimaryKeySelective(article);
            if(count == 0){
                throw new BlogException(BlogExceptionEnum.ARTICLE_UPDATE);
            }
        }



    }

    @Override
    public List<Article> list(String uid,String title) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",uid);
        if(title != null && !"".equals(title)){
            criteria.andLike("title","%"+title+"%");
        }
        List<Article> articles = articleMapper.selectByExample(example);
        //查询每篇文章对应的栏目信息，设置到对应的cid中
        for (Article article1 : articles) {
            Category category = categoryMapper.selectByPrimaryKey(article1.getCid());
            article1.setCid(category.getCname());
        }
        return articles;
    }

    @Override
    public void updateIsOpen(String isOpen, String aid) {
        Article article = new Article();
        article.setAid(aid);
        article.setIsOpen(isOpen);
        int count = articleMapper.updateByPrimaryKeySelective(article);
        if(count == 0){
            throw new BlogException(BlogExceptionEnum.ARTICLE_ISOPEN);
        }
    }

    @Override
    public Article queryById(String aid) {
        Article article = articleMapper.selectByPrimaryKey(aid);
        User user = userMapper.selectByPrimaryKey(article.getUid());
        article.setUid(user.getNickname());
        return article;
    }

    @Override
    public void deleteArticle(String aid) {
        int count = articleMapper.deleteByPrimaryKey(aid);
        if(count == 0){
            throw new BlogException(BlogExceptionEnum.ARTICLE_DELETE);
        }
    }

    @Override
    public List<Article> queryTop6() {
        Example example = new Example(Article.class);
        example.setOrderByClause("create_time desc");
        example.createCriteria().andEqualTo("isOpen","1");
        return articleMapper.selectByExample(example);
    }

    //增加点赞数
    @Override
    public String addThumbsUp(String aid) {
        //查询当前文章
        Article article = articleMapper.selectByPrimaryKey(aid);

        article.setThumbsUp(Integer.parseInt(article.getThumbsUp()) + 1 + "");

        //更新点赞数
        int count = articleMapper.updateByPrimaryKeySelective(article);
        if(count == 0){
            throw new BlogException(BlogExceptionEnum.ARTICLE_THUMBSUP);
        }
        return article.getThumbsUp();
    }
}
