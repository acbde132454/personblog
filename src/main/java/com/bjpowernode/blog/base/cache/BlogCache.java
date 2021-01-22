package com.bjpowernode.blog.base.cache;

import com.bjpowernode.blog.back.bean.Category;
import com.bjpowernode.blog.back.bean.Tag;
import com.bjpowernode.blog.back.mapper.CategoryMapper;
import com.bjpowernode.blog.back.mapper.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/12
 * Description : 缓冲类
 */
@Component
public class BlogCache {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private TagMapper tagMapper;

    @PostConstruct
    public void init(){
        //查询所有栏目
        List<Category> categories = categoryMapper.selectAll();

        //查询栏目下所有的标签
        for (Category category : categories) {
            Tag tag = new Tag();
            tag.setCid(category.getCid());
            List<Tag> tags = tagMapper.select(tag);
            category.setTags(tags);
        }

        servletContext.setAttribute("categories",categories);
    }
}
