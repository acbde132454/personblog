<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width"/>
    <title>${article.title}</title>
    <link rel="stylesheet" href="/blog/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="/blog/layui/css/layui.css"/>
    <link rel="stylesheet" href="/blog/css/fore/master.css"/>
    <link rel="stylesheet" href="/blog/css/fore/global.css"/>
    <link rel="stylesheet" href="/blog/css/fore/nprogress.css"/>
    <link rel="stylesheet" href="/blog/css/fore/blog.css"/>
    <link rel="stylesheet" href="/blog/css/fore/admin.css">
    <link rel="stylesheet" href="/blog/css/fore/message.css" />
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shcore.css"/>
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shthemedefault.css"/>
    <link href="/blog/css/fore/css.css" rel="stylesheet">

    <link rel="stylesheet" href="/blog/css/fore/style.css" />
    <link rel="stylesheet" href="/blog/bootstrap-3.3.7-dist/css/bootstrap.css" />

    <script language="javascript" type="text/javascript" src="/blog/js/code.js"></script>
    <script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>

    <%--editormd--%>
    <link rel="stylesheet" href="/blog/editormd/css/editormd.css"/>
    <script src="/blog/editormd/lib/marked.min.js"></script>
    <script src="/blog/editormd/lib/prettify.min.js"></script>
    <script src="/blog/editormd/lib/raphael.min.js"></script>
    <script src="/blog/editormd/lib/underscore.min.js"></script>
    <script src="/blog/editormd/lib/flowchart.min.js"></script>
    <script src="/blog/editormd/lib/jquery.flowchart.min.js"></script>
    <script src="/blog/editormd/editormd.js"></script>

    <%--KingEditor--%>
    <script charset="utf-8" src="/blog/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="/blog/kindeditor/lang/zh-CN.js"></script>

     <%--异步上传js--%>
    <script src="/blog/js/ajaxfileupload.js"></script>
</head>
<body>
${article.comments}
<div class="header">
</div>
<header class="gird-header">
    <div class="header-fixed">
        <div class="header-inner">
            <a href="javascript:void(0)" class="header-logo" id="logo">Andy.Hu</a>
            <nav class="nav" id="nav">
                <ul>
                    <li><a href="http://www.lzqcode.com">首页</a></li>
                    <li><a href="/Blog">博客</a></li>
                    <li><a href="/Yuanma">源码</a></li>
                    <!--  <li><a href="/Tool">工具</a></li> -->
                    <li><a href="/message.html">留言</a></li>
                    <li><a href="/Diary">日记</a></li>
                    <li><a href="/Link">友链</a></li>
                    <li><a href="/About">关于</a></li>
                </ul>
            </nav>
            <div class="blog-user">

                <c:if test="${user eq null}">
                    <button class="login-btn" id="btn1" onclick="login()" style="font-size: 12px">登录</button>
                    <button class="login-btn" onclick="regist()"  style="color:#fff;font-size: 12px;background: rgb(62,196,131)">注册</button>
                    <img id="userImg" style="border-radius: 100%;display: none" src="" />
                </c:if>
                <c:if test="${user != null}">
                    <button class="login-btn" onclick="regist()"  style="color:#fff;font-size: 12px;background: rgb(62,196,131)">注册</button>
                    <img id="userImg" style="border-radius: 100%;" src="${user.img}" />
                </c:if>
            </div>
        </div>
    </div>
</header>
<div class="modal fade nav-search-box in" id="search-box" style="display: none;">
    <div class="modal-backdrop fade in"></div>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 15px;">
                <button type="button" class="close" data-dismiss="modal" style="margin-top: 10px;">
                    <span aria-hidden="true">×</span></button>
                <h4 style="font-weight: 700;"><i class="fa fa-search"></i>搜索文章</h4>
            </div>
            <div class="modal-body">
                <form action="/plus/search.php" method="post" class="form-horizontal searchForm" id="searchForm"
                      name="formsearch">
                    <input type="hidden" name="mid" value="1"/><input type="hidden" name="dopost" value="search"/>
                    <input type="hidden" name="kwtype" value="0"/> <input type='hidden' name='typeid' value="1">
                    <div class="input-group bottom-line">
                        <input type="text" class="form-control br-none" name="q" value="" required="required"
                               placeholder="输入搜索内容">
                        <span class="input-group-btn">
			  <button class="btn btn-default br-none nav-search-btn pointer" type="submit">
			  <i class="fa fa-search"></i> 搜索</button> 
			  </span>
                    </div>
                    <div class="clear"></div>
                    <ul class="list-unstyled list-inline search-hot">
                        <li><strong style="position: relative;top: 2px;color: #999999;">热门搜索：</strong></li>
                        <li><a href='/plus/search.php?keyword=%E5%8D%9A%E5%AE%A2' class='pointer'
                               rel='external nofollow'><span class='label'>博客</span></a></li>
                        <li><a href='/plus/search.php?keyword=%E5%93%8D%E5%BA%94%E5%BC%8F' class='pointer'
                               rel='external nofollow'><span class='label'>响应式</span></a></li>
                        <li><a href='/plus/search.php?keyword=Java' class='pointer' rel='external nofollow'><span
                                class='label'>Java</span></a></li>
                        <li><a href='/plus/search.php?keyword=%E5%AD%A6%E4%B9%A0%E8%B7%AF%E7%BA%BF' class='pointer'
                               rel='external nofollow'><span class='label'>学习路线</span></a></li>
                        <li><a href='/plus/search.php?keyword=web' class='pointer' rel='external nofollow'><span
                                class='label'>web</span></a></li>
                        <li><a href='/plus/search.php?keyword=dedecms' class='pointer' rel='external nofollow'><span
                                class='label'>dedecms</span></a></li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="doc-container" id="doc-container">
    <div class="container-fixed">
        <div class="layui-row" style="margin-top: 15px;">
            <div class="layui-col-md12">
                <div class="home-tips shadow">
                    <i class="layui-icon"></i>
                    <span class="layui-breadcrumb" lay-separator=">" style="visibility: visible;">
                   <a href='http://www.lzqcode.com/'>主页</a> > <a href='/Blog/'>博客</a> > <a href='/Blog/Java/'>Java</a> > ><a><cite>Java学习路线推荐</cite></a>
            </span>
                </div>
            </div>
        </div>
        <div class="col-content" style="width:100%">
            <div class="inner">
                <article class="article-list">
                    <input type="hidden" value="@Model.BlogTypeID" id="blogtypeid"/>
                    <section class="article-item">
                        <aside class="title" style="line-height:1.5;">
                            <h4>${article.title}</h4>
                            <p class="fc-grey fs-14">
                                <small>
                                    作者：<a href="javascript:void(0)" target="_blank" class="fc-link">${article.user.nickname} </a>
                                </small>
                                <small class="ml10">围观群众：${article.visit_count}</small>
                                <small class="ml10">更新于 <label>${article.update_time}</label></small>
                            </p>
                        </aside>
                        <div class="time mt10" style="padding-bottom:0;">
                            <span class="day">${fn:substring(article.create_time,8 ,10)}</span>
                            <span class="month fs-18">${fn:substring(article.create_time,5 ,7)}
                                <small class="fs-14">月</small></span>
                            <span class="year fs-18">${fn:substring(article.create_time,0 ,4)}</span>
                        </div>
                        <div class="article-desc mt20"><strong>摘要：</strong>
                            ${article.digest}
                        </div>
                        <div class="content artiledetail"
                             style="border-bottom: 1px solid #e1e2e0; padding-bottom: 20px;">

                            <div>
                                <div id="test-editor" style="margin-left: -20px">
                                    <textarea>
                                        ${article.content}
                                    </textarea>
                                </div>
                            </div>
                            <script type="text/javascript">
                                var editor;
                                $(function () {
                                    editor = editormd.markdownToHTML("test-editor", {
                                        width: "80%",
                                        height: "500px"
                                    });
                                });
                            </script>
                            <br/>

                            <div class="copyright mt20">
                                <p class="f-toe fc-black">
                                    非特殊说明，本文版权归ZQ博客所有，转载请注明出处.
                                </p>
                                <p class="f-toe">
                                    本文类型：
                                    <a href="/Blog/Java/" class="r-title"> Java</a>
                                </p>
                                <p class="f-toe">
                                    本文网址：
                                    <a href="//Blog/Java/6.html">http://www.lzqcode.com/Blog/Java/6.html</a>
                                </p>
                            </div>
                            <div id="aplayer" style="margin:5px 0"></div>
                            <h6>延伸阅读</h6>
                            <ol class="b-relation">
                                <li class="f-toe">上一篇：<a href="">没有了 </a></li>
                                <li class="f-toe">下一篇：<a href="">没有了 </a></li>
                            </ol>
                        </div>

                        <div class="f-cb"></div>
                        <div class="mt20 f-fwn fs-24 fc-grey comment"
                             style="border-top: 1px solid #e1e2e0; padding-top: 20px;">
                        </div>
                        <h3>发表评论</h3>

                        <!-- //AJAX评论区 开始 -->
                        <div class="dedemao-comment">
                            <div class="dedemao-comment-box">
                                <div class="b-box-textarea">
                                    <div class="b-box-textarea-body" >
                                         
                                         <img src="/blog/images/comment_bg.png" style="position: absolute ;right: 0;bottom: 60px" />
                                         <textarea id="editor_id" name="content"
                                                   style="width:100%;height:300px;">

                                        </textarea>
                                    </div>
                                    <ul class="b-emote-submit">
                                        <li class="b-submit-button">
                                            <input type="button" value="评 论" aid="6" pid="0" onclick="punishComment()"
                                                   style="background-color: #6bc30d;">
                                        </li>
                                        <li class="b-clear-float"></li>
                                    </ul>
                                    <div class="error-tip" id="msgBox"></div>
                                    <div id="progressOuter" class="progress progress-striped active"
                                         style="display: none">
                                        <div id="progressBar" class="progress-bar progress-bar-success"
                                             role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 0%">
                                        </div>
                                    </div>
                                    <div class="dedemao-img-list"></div>
                                    <div id="dedemao-upload-box" style="display: none"></div>
                                </div>

                                <div class="b-clear-float"></div>
                            </div>
                            <div class="dedemao-comment-title" style="border-bottom: 1px solid #6bc30d;">
                                <ul class="row">
                                    <li class="" style="float: left;">
                                        <h5 class="custom-title">
                                            <i class="fa fa-comments-o fa-fw icon"></i>
                                            <span style="color: #cccccc"> | </span>
                                            <strong><span class="comment-count"
                                                          style="color: #2C662D">0</span>&nbsp;评论</strong>
                                        </h5>
                                    </li>
                                    <li class=" text-right" style="float: right;">
                                        <span class="icon2">
                                            <input type="radio" name="commentorder" id="commentnew" checked="checked" value="DESC">
                                            <label for="commentnew">最新</label>
                                            <input type="radio" name="commentorder" id="commentlatest" value="ASC">
                                            <label for="commentlatest">最早</label>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="mt20">
                                <ul class="message-list" id="message-list">
                                    <c:forEach items="${article.comments}" var="comment">

                                    <li class="zoomIn article">
                                        <div class="comment-parent">
                                            <a name="remark-1"></a>
                                            <c:if test="${comment.thumb_img eq null}">
                                                <img src="/blog/images/Admin.png" />
                                            </c:if>
                                            <c:if test="${not empty comment.thumb_img}">
                                                <img src="${comment.thumb_img}" />
                                            </c:if>
                                            <div class="info">
                                                <span class="username">${comment.nickname}</span>
                                            </div>
                                            <div class="comment-content">
                                                ${comment.content}
                                            </div>
                                            <p class="info info-footer">
                                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                <span class="comment-time">  ${comment.create_time}</span>
                                                <a href="javascript:;" class="btn-reply" data-targetid="1" data-targetname="冰">回复</a>
                                            </p>
                                        </div>
                                        <hr />
                                        <c:forEach items="${comment.secondComments}" var="secondComment">
                                            <div class="comment-child">
                                                <a name="reply-1"></a>
                                                <img style="margin-left: 50px" src="http://www.lzqcode.com/uploads/userup/57/myface.png">
                                                <div class="info">
                                                    <span class="username">${secondComment.nickname}</span>
                                                    <span style="padding-right:0;margin-left:-5px;">回复</span>
                                                    <span class="username">${comment.nickname}</span>
                                                    <span>${secondComment.content}</span>
                                                </div>
                                                <p class="info">
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                    <span class="comment-time">${secondComment.create_time}</span>
                                                    <a href="javascript:;" class="btn-reply" data-targetid="2" data-targetname="小刘">回复</a>
                                                </p>
                                            </div>
                                        </c:forEach>
                                        <div class="replycontainer layui-hide">
                                            <img src="/blog/images/comment_bg.png"
                                                 style="position: absolute ;right: 0;top:375px;width:162px;height: 75px" />
                                            <textarea class="editor" name="content"
                                                          style="width:100%;height:300px;">

                                            </textarea>
                                            <div class="layui-form-item">
                                                <button class="layui-btn layui-btn-xs" lay-submit="formReply" lay-filter="formReply">提交</button>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- //AJAX评论区 结束 -->
                    </section>
                </article>
            </div>
        </div>
    </div>
</div>
<footer class="grid-footer">
    <div class="footer-fixed">
        <div class="copyright">
            <div class="info">
                <div class="contact">
                    <a href="javascript:void(0)" class="github" target="_blank"><i class="fa fa-github"></i></a>
                    <a href="https://wpa.qq.com/msgrd?v=3&uin=1435469178&site=qq&menu=yes" class="qq" target="_blank"
                       title="1435469178"><i class="fa fa-qq"></i></a>
                    <a href="https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=1435469178@qq.com" class="email"
                       target="_blank" title="1435469178@qq.com"><i class="fa fa-envelope"></i></a>
                    <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                </div>
                <p class="mt05">
                    Copyright © 2019-2020 ZQ博客 版权所有 <a href="/" target="_blank">Power by ZQ博客</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<%--遮罩层--%>
<div class="login" style="display: none"></div>
<%--登录模态窗口--%>
<div class="loginWrapper" style="position: fixed;left: 460px;top:100px;z-index: 100000;display: none">
    <div style="background: #F8F8F8;width: 370px;height: 40px;position: fixed">
        <h3 style="font-size: 14px;margin:10px 10px">欢迎回来</h3>
    </div>
    <div class="form-inner-cont">
        <span id="loginClose">X</span>
        <form id="loginForm" method="post" class="signin-form">
            <div class="form-input">
                <span class="fa fa-user-o" aria-hidden="true"></span>
                <input autofocus type="text" name="username"
                       placeholder="用户名" required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="password" placeholder="密码"
                       required />
            </div>
            <div class="login-remember d-grid" style="color: black">
                <button type="button" id="loginBtn" style="width: 330px" class="btn theme-button">登录</button>
            </div>
            <div style="height:20px">
            </div>
        </form>
    </div>
</div>

<%--注册模态窗口--%>
<div class="registWrapper" style="position: fixed;left: 460px;top:100px;z-index: 100000;display: none">
    <div style="background: #F8F8F8;width: 370px;height: 40px;position: fixed">
        <h3 style="font-size: 14px;margin:10px 10px">账号注册</h3>
    </div>
    <div class="form-inner-cont">
        <span id="registClose">X</span>
        <form id="registForm" method="post" class="signin-form">
            <input type="hidden" id="img" name="img" />
            <div class="form-input">
                <span class="fa fa-user-o" aria-hidden="true"></span>
                <input autofocus type="text" id="username" name="username" placeholder="请输入用户名" required />
            </div>
            <div class="form-input">
                <span class="fa fa-user-o" aria-hidden="true"></span>
                <input autofocus type="text" name="nickname" placeholder="请输入昵称" required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="password" placeholder="请输入密码"
                       required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="confirmPassword" placeholder="确认密码"
                       required />
            </div>
                <a href="javascript:;" class="a-upload">
                    <input type="file" name="img" id="uploadLogo" />上传头像
                </a>
            <div class="login-remember d-grid">
                <button style="width: 330px" id="registBtn" type="button" class="btn theme-button">注册</button>
            </div>
        </form>
    </div>
</div>
</a>
<style type="text/css">
    .a-upload {
        padding: 5px 10px;
        position: relative;
        cursor: pointer;
        background: #fafafa;
        border: 1px solid #ddd;
        border-radius: 4px;
        overflow: hidden;
        display: inline-block;
        zoom: 1;
        color:white;
        background: #00a0e9;
        display: inline-block;
        width : 100%;
        text-align: center;
        height: 46px;
        line-height: 46px;
        margin-top: 20px;
        text-align: center;
    }

    .a-upload  input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
        filter: alpha(opacity=0);
        cursor: pointer
    }

    .a-upload:hover {
        text-decoration: none
    }
    .login {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 100000px;
        z-index: 100000;
        background: rgba(0,0,0,.3);
    }

    #loginClose,#registClose{
        font-size:16px;position:relative;left: 320px;top: -12px
    }
    #loginClose:hover,#registClose:hover{
        cursor: pointer;
    }
</style>
<script src="/blog/layui/layui.js"></script>
<script src="/blog/js/yss/gloable.js"></script>
<script src="/blog/js/plugins/nprogress.js"></script>

<script src="/blog/js/logreg.js"></script>
<script src="/blog/js/pagemessage.js"></script>
<script src="/blog/layui/lay/modules/layer.js"></script>


<script>NProgress.start();</script>

<script>
    window.onload = function () {
        NProgress.done();
    };
    
    //点击登录按钮，异步登录
    $('#loginBtn').click(function () {
        $.ajax({
            url: '/blog/user/foreLogin',
            data: $('#loginForm').serialize(),
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if(data.ok){
                    layer.alert(data.mess, {icon: 6});
                    //关闭模态窗口
                    $('.loginWrapper').css("display","none");
                    //关闭遮罩层
                    $('.login').css("display","none");
                    //登录按钮隐藏
                    $('#btn1').css("display","none");
                    //设置用户头像
                    $('#userImg').css("display","inline");
                    $('#userImg').prop('src',data.t.img);
                    return;
                }
            },
        });
    });

    //点击注册按钮，异步注册
    $('#registBtn').click(function () {
        $.ajax({
            url: '/blog/user/regist',
            data: $('#registForm').serialize(),
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if(data.ok){
                    layer.alert(data.mess, {icon: 1});
                    //关闭模态窗口
                    $('.registWrapper').css("display","none");
                    //关闭遮罩层
                    $('.login').css("display","none");
                    return;
                }
            },
        });
    })

    //异步校验用户名是否被注册
    $('#username').blur(function () {
        $.get("/blog/user/verifyUsername",{
            'username' : $(this).val()
        },function(data){
            if(data.ok){
                layer.alert(data.mess,{icon : 5});
            }else {
                layer.alert(data.mess,{icon : 6});
            }
            return;
        },'json');
    });



    //异步上传注册头像
    $('#uploadLogo').change(function () {
        $.ajaxFileUpload({
                url: '/blog/imageUpload', //用于文件上传的服务器端请求地址
                fileElementId: 'uploadLogo', //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                success : function (data,status) {

                    if(data.success == 1){
                        layer.alert(data.message, {icon: 1});
                        //在隐藏域保存上传图片路径
                        $('#img').val(data.url);
                        return;
                    }
                },
            }
        )
        return false;
    });

    //点击关闭登录窗口
    $('#loginClose').click(function () {
        $('.loginWrapper').css('display','none');
        $('.login').css('display','none');
    });

    //登录
    function login() {
        $('.loginWrapper').css('display','block');
        $('.login').css('display','block');
    }

    //点击关闭注册窗口
    $('#registClose').click(function () {
        $('.registWrapper').css('display','none');
        $('.login').css('display','none');
    });

    //登录
    function regist() {
        $('.registWrapper').css('display','block');
        $('.login').css('display','block');
    }


    //回复评论kingEditor
    KindEditor.ready(function(K) {
        window.editor = K.create('.editor');
    });
    //发表评论kingEditor
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('#editor_id');
    });

    //发布评论
    function punishComment() {
        //没有输入评论内容
        if(editor.html() == ""){
            layer.msg('请输入评论内容');
            return;
        }else{
            //评论不为空，发送异步请求添加评论
            $.get('/blog/article/saveComments',{
                'aid' : '${article.aid}',
                'uid' : '${article.uid}',
                'from_uid' : '${user.uid}',
                'content' : editor.html()
            },function (data) {
                    //用户没有登录
                    layer.msg(data.mess);
                    if(data.ok){

                    }
            },'json');
        }
    }
</script>

</body>
</html>