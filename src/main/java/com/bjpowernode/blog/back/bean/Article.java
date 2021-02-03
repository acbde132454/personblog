package com.bjpowernode.blog.back.bean;

import lombok.Data;
import lombok.ToString;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/12
 * Description :
 */
@Data
@ToString
@Table(name = "t_article")
@NameStyle(Style.normal)
public class Article {

    @Id
    private String aid;
    private String title;//标题
    private String digest;//摘要
    private String content;//内容
    private String cid;//所属种类
    private String visit_count;//访问量
    private String create_time;//创建时间
    private String update_time;//更新时间
    private String is_hot;//是否热门
    private String logo;//logo
    private String uid;//创建者
    private String isOpen;//是否公开
    private String tagNames;//关联标签
    private String thumbsUp;//点赞
    private String isCommented;//是否被评论 0:没有 1:被评论过

    private User user;//发布者
    private List<Comment> comments;//文章的评论

}
