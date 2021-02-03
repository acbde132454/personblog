package com.bjpowernode.blog.base.controller;

import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.base.bean.ResultVo;
import com.bjpowernode.blog.base.constants.BlogConstants;
import com.bjpowernode.blog.base.util.DateTimeUtil;
import com.bjpowernode.blog.base.util.FileUploadUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/12
 * Description : 文件上传
 */
@RestController
public class FileUploadController {

    //editormd文件上传
    @RequestMapping("/fileUpload")
    public Map<String,Object> fileUpload(
            @RequestParam(value = "editormd-image-file", required = false)MultipartFile img,
            HttpServletRequest request){
        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);
        return map;
    }

    //前台用户注册上传图片
    @RequestMapping("/imageUpload")
    @ResponseBody
    public Map<String,Object> imageUpload(MultipartFile img,HttpServletRequest request){
        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);
        return map;
    }
}
