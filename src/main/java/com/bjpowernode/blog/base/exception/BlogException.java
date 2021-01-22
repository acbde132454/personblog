package com.bjpowernode.blog.base.exception;

import com.bjpowernode.blog.base.bean.ResultVo;
import lombok.Data;
import lombok.ToString;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :
 */
@Data
@ToString
public class BlogException extends RuntimeException {

    private BlogExceptionEnum blogExceptionEnum;

    public BlogException(BlogExceptionEnum blogExceptionEnum){
        super();
        this.blogExceptionEnum = blogExceptionEnum;
    }
}
