package com.bjpowernode.blog.base.bean;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/9
 * Description :    给客户端返回的消息对象
 */
@Data
@ToString
public class ResultVo<T> {

    private boolean isOk;//是否成功
    private String mess;//返回给客户端的具体消息
    private List<T> data;//给客户端返回的数据
    private T t;//返回单个对象
}
