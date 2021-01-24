package com.bjpowernode.blog.base.exception;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :
 */
public enum  BlogExceptionEnum{

    LOGIN_USER_PASS("001-001"),//用户名或密码错误
    LOGIN_STATE("001-002"),//账户被锁定
    LOGIN_CODE("001-003"),//验证码输入错误
    USER_UPDATE("001-004"),//用户信息更新失败

    ARTICLE_ADD("002-001"),//添加文章失败
    ARTICLE_ISOPEN("002-002"),//修改状态失败
    ARTICLE_UPDATE("002-003"),//修改文章失败
    ARTICLE_DELETE("002-004"),//删除文章失败
    ARTICLE_THUMBSUP("002-005");//更新点赞数失败

    private String type;

    BlogExceptionEnum(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
