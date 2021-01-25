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
    <link rel="stylesheet" href="/blog/css/fore/gloable.css"/>
    <link rel="stylesheet" href="/blog/css/fore/nprogress.css"/>
    <link rel="stylesheet" href="/blog/css/fore/blog.css"/>
    <link rel="stylesheet" href="/blog/css/fore/admin.css">
    <link rel="stylesheet" href="/blog/css/fore/message.css" />
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shcore.css"/>
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shthemedefault.css"/>
    <link href="/blog/css/fore/css.css" rel="stylesheet">
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
</head>
<body>
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
            <div class="none"><span class="pull-right nav-search main-search" data-toggle="modal"
                                    data-target=".nav-search-box"><i class="fa fa-search"></i></span></div>
            <span id="_userlogin" class="pr">
               <div class="blog-user">
                    <button class="login-btn" id="login-btn">登录</button>
                </div>
                 </span>
            <a class="phone-menu">
                <i></i>
                <i></i>
                <i></i>
            </a>
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
                                    作者：<a href="javascript:void(0)" target="_blank" class="fc-link">${article.uid} </a>
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
                        <h6>发表评论</h6>

                        <!-- //AJAX评论区 开始 -->
                        <div class="dedemao-comment">
                            <div class="dedemao-comment-box">
                                <div class="b-box-textarea">
                                    <div class="b-box-textarea-body">
                                        <div class="b-box-content" contenteditable="true" onfocus="delete_hint(this)">
                                            说点什么吧
                                        </div>
                                    </div>
                                    <ul class="b-emote-submit">
                                        <li class="b-emote">
                                            <a class="ds-toolbar-button ds-add-emote" title="插入表情"
                                               onclick="getTuzki(this)"></a>
                                            <!--   <input class="b-email" onkeyup="getQQInfo(this)" type="text" name="email" data-type="电子邮箱" placeholder="你的电子邮箱" value="">-->
                                            <div class="b-tuzki"></div>
                                        </li>
                                        <li class="b-submit-button">
                                            <input type="button" value="评 论" aid="6" pid="0" onclick="comment(this)"
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
<script src="/blog/layui/layui.js"></script>
<script src="/blog/js/yss/gloable.js"></script>
<script src="/blog/js/plugins/nprogress.js"></script>

<script src="/blog/js/logreg.js"></script>
<script src="/blog/js/comment.js"></script>
<script src="/blog/js/pagemessage.js"></script>


<script>NProgress.start();</script>

<script>
    window.onload = function () {
        NProgress.done();
    };
</script>

</body>
</html>