package com.bjpowernode.blog.base.bean;

import com.github.pagehelper.PageInfo;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/13
 * Description : 分页pojo对象
 */
@Data
@ToString
@NoArgsConstructor
public class PaginationVo<T> {

    private int page;//当前页码
    private long pageSize;//每页记录数
    private long total;//总记录数
    private long pages;//总页数

    private List<T> dataList;//每页的实际的数据

    public PaginationVo(PageInfo<T> pageInfo) {
        page = pageInfo.getPageNum();
        pageSize = pageInfo.getPageSize();
        total = pageInfo.getTotal();
        pages =pageInfo.getPages();
        dataList = pageInfo.getList();
    }
}
