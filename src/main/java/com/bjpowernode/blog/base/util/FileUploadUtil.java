package com.bjpowernode.blog.base.util;

import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.base.constants.BlogConstants;
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
 * Description : 文件上传工具栏
 */
public class FileUploadUtil {

    public static Map<String,Object> fileUpload(MultipartFile img, HttpServletRequest request){
        HttpSession session = request.getSession();
        //创建文件上传的目录 结构为:upload/日期/用户名/文件名
        String path = File.separator + "upload" + File.separator + DateTimeUtil.getDate();
        String realPath = session.getServletContext().
                getRealPath(path);
        File file = new File(realPath);
        //创建上传文件目录 用户名+upload
        if(!file.exists()){
            file.mkdirs();
        }

        //获取上传文件名
        String fileName = img.getOriginalFilename();
        //防止上传文件重名
        fileName = System.currentTimeMillis() + fileName;

        //给editor返回的json数据
        Map<String,Object> map = new HashMap<>();

        //图片回调地址
        String url = "http://localhost:8080" + request.getContextPath() + path + File.separator + fileName;
        //将回调地址存储在session中
        session.setAttribute("url",url);
        try {
            //调用上传文件方法
            img.transferTo(new File(realPath + File.separator + fileName));
            map.put("success",1);//只能写数字1
            map.put("message","上传图片成功");
            map.put("url",url);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("success","0");
            map.put("message","上传失败");
        }
        return map;
    }
}
