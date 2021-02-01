package com.bjpowernode.blog.back.bean;


import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_comments")
@Data
@NameStyle(Style.normal)
public class Comment {

    @Id
    private String id;//主键
    private String aid;//文章id
    private String uid;//文章用户id
    private String content;//评论内容
    private String pid;//上一级评论
    private String isLock;//是否锁定
    private String create_time;//创建时间
    private String from_uid;//评论者id
    private String nickname;//评论者昵称
    private String thumb_img;//评论者头像

}
