package com.bjpowernode.blog.back.controller;

import com.bjpowernode.blog.back.bean.Article;
import com.bjpowernode.blog.back.bean.Category;
import com.bjpowernode.blog.back.bean.Tag;
import com.bjpowernode.blog.back.bean.User;
import com.bjpowernode.blog.back.service.ArticleService;
import com.bjpowernode.blog.base.bean.PaginationVo;
import com.bjpowernode.blog.base.bean.ResultVo;
import com.bjpowernode.blog.base.constants.BlogConstants;
import com.bjpowernode.blog.base.exception.BlogException;
import com.bjpowernode.blog.base.util.FileUploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2021/1/12
 * Description :
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    //增加点赞数
    @RequestMapping("/article/addThumbsUp")
    @ResponseBody
    public ResultVo addThumbsUp(String aid){
        ResultVo resultVo = new ResultVo();
        try {
            String thumbsUp = articleService.addThumbsUp(aid);
            resultVo.setOk(true);
            resultVo.setMess(thumbsUp);
        }catch (BlogException e){
            resultVo.setOk(true);
            e.printStackTrace();
        }
        return resultVo;
    }

    //前提查询文章
    @RequestMapping("/article/articleList")
    public String articleList(Model model){
        //查询最新发布的前6篇文章
        List<Article> articles = articleService.queryTop6();
        model.addAttribute("articles",articles);
        return "../../view/article/article";
    }
    //根据主键查询文章信息
    @RequestMapping("/article/queryById")
    public String queryById(String aid, Model model){
        Article article = articleService.queryById(aid);
        model.addAttribute("article",article);
        return "updateArticle";
    }

    //根据主键查询文章信息,跳转到前台文章详情页
    @RequestMapping("/article/queryByIdToDetail")
    public String queryByIdToDetail(String aid, Model model){
        Article article = articleService.queryById(aid);
        model.addAttribute("article",article);
        return "../../view/article/articleDetail";
    }

    //异步更新文章是否公开
    @RequestMapping("/article/updateIsOpen")
    @ResponseBody
    public ResultVo updateIsOpen(String isOpen,String aid){
        ResultVo resultVo = new ResultVo();
        try {
            articleService.updateIsOpen(isOpen,aid);
            resultVo.setOk(true);
            if("1".equals(isOpen)){
                //公开
                resultVo.setMess("已将文章设为公开");
            }else{
                //私密
                resultVo.setMess("已将文章设为私密");
            }

        } catch (BlogException e) {
            e.printStackTrace();
            resultVo.setOk(false);
            if("1".equals(isOpen)){
                //公开
                resultVo.setMess("已将文章设为公开失败");
            }else{
                //私密
                resultVo.setMess("已将文章设为私密失败");
            }
        }
        return resultVo;
    }

    //选中栏目查询栏目下所有的标签
    @RequestMapping("/article/queryByCategory")
    @ResponseBody
    public List<Tag> queryByCategory(String cid,HttpSession session){
        //从ServletContext中获取栏目信息
        List<Category> categories =
                (List<Category>) session.getServletContext().getAttribute("categories");
        List<Tag> tags = null;
        for (Category category : categories) {
            if(cid.equals(category.getCid())){
                //获取栏目下对应的标签
               tags = category.getTags();
            }
        }
        return tags;
    }

    //文章列表和条件查询列表
    @RequestMapping("/article/list")
    @ResponseBody
    public PaginationVo list(@RequestParam(defaultValue = "1",required = false) int page,
                             @RequestParam(defaultValue = "2",required = false) int pageSize,
                             String title, HttpSession session){
        //开启分页功能 limit a,b
        PageHelper.startPage(page, pageSize);
        //获取当前登录用户信息
        User user = (User) session.getAttribute(BlogConstants.LOGIN_USER);
        //查询所有文章信息
        List<Article> articles = articleService.list(user.getUid(),title);
        PageInfo<Article> pageInfo = new PageInfo<>(articles);
        //把前台分页插件需要的数据都封装到paginationVo
        PaginationVo<Article> paginationVo = new PaginationVo<>(pageInfo);
        return paginationVo;
    }

    //发布和修改文章
    @RequestMapping("/article/saveOrUpdateArticle")
    public String saveOrUpdateArticle(Article article, HttpServletRequest request,
                                        MultipartFile img,String[] tid,String aid){
        //获取文章LOGO图片
        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);
        String logo = (String) map.get("url");
        article.setLogo(logo);

        //文章标签
        article.setTagNames(Arrays.toString(tid));

        //将登录用户主键设置到外键中
        User user =
                (User) request.getSession().getAttribute(BlogConstants.LOGIN_USER);
        article.setUid(user.getUid());
        ResultVo resultVo = new ResultVo();
        try{
            articleService.saveOrUpdateArticle(article,aid);
        }catch (BlogException e){
            System.out.println("添加文章失败");
        }

        return "article";
    }

    //异步删除文章
    @RequestMapping("/article/deleteArticle")
    @ResponseBody
    public ResultVo deleteArticle(String aid){
        ResultVo resultVo = new ResultVo();
        try {
            articleService.deleteArticle(aid);
            resultVo.setOk(true);
            resultVo.setMess("删除文章成功");
        } catch (BlogException e) {
            e.printStackTrace();
            resultVo.setOk(false);
        }
        return resultVo;
    }
}
