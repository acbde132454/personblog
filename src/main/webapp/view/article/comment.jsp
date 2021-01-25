<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <meta name="author" content="www.lzqcode.com" />
    <meta name="robots" content="all" />
    <title>留言板</title>
    <link rel="stylesheet" href="/blog/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="/blog/layui/css/layui.css" />
    <link rel="stylesheet" href="/blog/css/fore/master.css" />
    <link rel="stylesheet" href="/blog/css/fore/gloable.css" />
    <link rel="stylesheet" href="/blog/css/fore/nprogress.css" />
    <link rel="stylesheet" href="/blog/css/fore/message.css" />
</head>
<body>
    <div class="header">
    </div>
    <header class="gird-header">
        <div class="header-fixed">
            <div class="header-inner">
                <a href="javascript:void(0)" class="header-logo" id="logo">Mr.liu</a>
                <nav class="nav" id="nav">
                    <ul>
                        <li><a href="index.html">首页</a></li>
                        <li><a href="article.html">博客</a></li>
                        <li><a href="message.html">留言</a></li>
						<li><a href="diary.html">日记</a></li>
                        <li><a href="link.html">友链</a></li>
                    </ul>
                </nav>
                <a href="#" class="blog-user">
                    <i class="fa fa-qq"></i>
                </a>
                <a class="phone-menu">
                    <i></i>
                    <i></i>
                    <i></i>
                </a>
            </div>
        </div>
    </header>
    <div class="doc-container" id="doc-container">
        <div class="container-fixed">
    <div class="container-inner">
        <section class="msg-remark">
            <h1>留言板</h1>
            <p>
                沟通交流，拉近你我！
            </p>
        </section>
        <div class="textarea-wrap message" id="textarea-wrap">
            <form class="layui-form blog-editor" action="">
                <div class="layui-form-item">
                    <textarea name="editorContent" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="formLeaveMessage" lay-filter="formLeaveMessage">提交留言</button>
                </div>
            </form>
        </div>
    </div>
    <div class="f-cb"></div>
    <div class="mt20">
        <ul class="message-list" id="message-list">
            <li class="zoomIn article">
                <div class="comment-parent">
                    <a name="remark-1"></a>
                    <img src="http://qzapp.qlogo.cn/qzapp/101871412/EE7AAE629D162B783C00149B4EDE3502/100" />
                    <div class="info">
                        <span class="username">冰</span>
                    </div>
                    <div class="comment-content">
                        大哥带一下
                    </div>
                    <p class="info info-footer">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>深圳</span>
                        <span class="comment-time">2020-07-01</span>
                        <a href="javascript:;" class="btn-reply" data-targetid="1" data-targetname="冰">回复</a>
                    </p>
                </div>
                <hr />
                <div class="comment-child">
                    <a name="reply-1"></a>
                    <img src="http://www.lzqcode.com/uploads/userup/57/myface.png">
                    <div class="info">
                        <span class="username">小刘</span>
                        <span style="padding-right:0;margin-left:-5px;">回复</span>
                        <span class="username">冰</span>
                        <span>哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或</span>
                    </div>
                    <p class="info">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>深圳</span>
                        <span class="comment-time">2018-01-01</span>
                        <a href="javascript:;" class="btn-reply" data-targetid="2" data-targetname="小刘">回复</a>
                    </p>
                </div>
                <div class="replycontainer layui-hide">
                    <form class="layui-form" action="">
                        <input type="hidden" name="remarkId" value="1">
                        <input type="hidden" name="targetUserId" value="0">
                        <div class="layui-form-item">
                            <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-xs" lay-submit="formReply" lay-filter="formReply">提交</button>
                        </div>
                    </form>
                </div>
            </li>
            <li class="zoomIn article">
                <div class="comment-parent">
                    <a name="remark-1"></a>
                    <img src="http://qzapp.qlogo.cn/qzapp/101871412/EE7AAE629D162B783C00149B4EDE3502/100" alt="{{name}}" />
                    <div class="info">
                        <span class="username">冰</span>
                    </div>
                    <div class="comment-content">
                       一天很短，开心了就笑，不开心了就过会儿再笑。
                    </div>
                    <p class="info info-footer">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>深圳</span>
                        <span class="comment-time">2018-01-01</span>
                        <a href="javascript:;" class="btn-reply" data-targetid="1" data-targetname="冰">回复</a>
                    </p>
                </div>
                <div class="replycontainer layui-hide">
                    <form class="layui-form" action="">
                        <input type="hidden" name="remarkId" value="1">
                        <input type="hidden" name="targetUserId" value="0">
                        <div class="layui-form-item">
                            <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-xs" lay-submit="formReply" lay-filter="formReply">提交</button>
                        </div>
                    </form>
                </div>
            </li>
            <li class="zoomIn article">
                <div class="comment-parent">
                    <a name="remark-1"></a>
                    <img src="http://www.lzqcode.com/uploads/userup/57/myface.png"/>
                    <div class="info">
                        <span class="username">小刘</span>
                    </div>
                    <div class="comment-content">
                        哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或
                    </div>
                    <p class="info info-footer">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                        <span>深圳</span>
                        <span class="comment-time">2018-01-01</span>
                        <a href="javascript:;" class="btn-reply" data-targetid="1" data-targetname="小刘">回复</a>
                    </p>
                </div>
                <hr />
                <div class="replycontainer layui-hide">
                    <form class="layui-form" action="">
                        <input type="hidden" name="remarkId" value="1">
                        <input type="hidden" name="targetUserId" value="0">
                        <div class="layui-form-item">
                            <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-xs" lay-submit="formReply" lay-filter="formReply">提交</button>
                        </div>
                    </form>
                </div>
            </li>
        </ul>
    </div>
</div>
    </div>
    <footer class="grid-footer">
        <div class="footer-fixed">
            <div class="copyright">
                <div class="info">
                    <div class="contact">
                        <a href="javascript:void(0)" class="github" target="_blank"><i class="fa fa-github"></i></a>
                        <a href="#" class="qq" target="_blank" ><i class="fa fa-qq"></i></a>
                        <a href="#" class="email" target="_blank" ><i class="fa fa-envelope"></i></a>
                        <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                    </div>
                    <p class="mt05">
                        Copyright &copy; 2019-2020 ZQ博客 All Rights Reserved V.3.1.3 Power by ZQ博客
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <script src="/blog/layui/layui.js"></script>
    <script src="/blog/js/yss/gloable.js"></script>
    <script src="/blog/js/plugins/nprogress.js"></script>
    <script>NProgress.start();</script>
    <script src="/blog/js/pagemessage.js"></script>
    <script>NProgress.start();</script>
    <script> 
        window.onload = function () {
            NProgress.done();
        };
    </script>
</body>
</html>
