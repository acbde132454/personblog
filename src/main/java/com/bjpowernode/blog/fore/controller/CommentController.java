package com.bjpowernode.blog.fore.controller;

import com.bjpowernode.blog.back.bean.Comment;
import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.base.bean.ResultVo;
import com.bjpowernode.blog.base.constants.BlogConstants;
import com.bjpowernode.blog.base.exception.BlogException;
import com.bjpowernode.blog.fore.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/article/saveComments")
    @ResponseBody
    public ResultVo saveComments(Comment comment, HttpSession session){
        ResultVo resultVo = new ResultVo();
        //获取登录用户
        User user = (User) session.getAttribute(BlogConstants.LOGIN_USER);
        if(user == null){
            //用户没有登录
            resultVo.setOk(false);
            resultVo.setMess("对不起，您还没有登录");
        }else{
            //保存用户的评论信息
            try {
                //获取登录用户信息
                comment.setFrom_uid(user.getUid());
                comment.setNickname(user.getNickname());
                comment.setThumb_img(user.getImg());
                commentService.saveComments(comment);
                resultVo.setOk(true);
                resultVo.setMess("发表评论成功");
            } catch (BlogException e) {
                resultVo.setOk(false);
                resultVo.setMess("发表评论失败");
            }
        }
        return resultVo;
    }
}
