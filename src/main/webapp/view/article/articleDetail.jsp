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
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shcore.css"/>
    <link type="text/css" rel="stylesheet" href="/blog/css/fore/shthemedefault.css"/>
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
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?d37cd8cdbb97246df80b9f4762c17003";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    <script language="javascript" type="text/javascript" src="/blog/js/dedeajax2.js"></script>
    <script language="javascript" type="text/javascript">

        function CheckLogin() {
            var taget_obj = document.getElementById('_userlogin');
            myajax = new DedeAjax(taget_obj, false, false, '', '', '');
            myajax.SendGet2("/member/ajax_loginsta.php");
            DedeXHTTP = null;
        }
    </script>
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
                <!--<a href="/oauth/index_do.php?action=oauth&type=qq" class="blog-user">
                      <i class="fa fa-qq"></i>
                  </a>-->
                 <script language="javascript" type="text/javascript">CheckLogin();</script>
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
                        <link href="/blog/css/fore/css.css" rel="stylesheet">
                        <div class="dedemao-comment">
                            <div class="dedemao-comment-box">
                                <!-- <img class="b-head-img" src="static/picture/default_head_img.gif">-->
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
                                    <li class="" style="float: left;"><h5 class="custom-title">
                                        <i class="fa fa-comments-o fa-fw icon"></i>
                                        <span style="color: #cccccc"> | </span>
                                        <strong><span class="comment-count"
                                                      style="color: #2C662D">0</span>&nbsp;评论</strong>
                                    </h5></li>
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
                            <div class=" b-user-comment">
                                <div class="comment-load" style="display: none;"><img src="/blog/images/loader.gif"
                                                                                      alt=""></div>
                                <div class="row b-user b-parent comm_list">
                                    <ul class="list" id="ulcommentlist">
                                        <div class="empty-prompt-w">
                                            <span class="prompt-null-w">还没有评论，快来抢沙发吧！</span>
                                            <li>
                                                <small><img src="/blog/images/12948bc65bb641ae80600b2dde38d345.gif"><a
                                                        href="#">随缘（滁州）</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：不错的文章
                                            </li>
                                            <li>
                                                <small><img src="/blog/images/default_head_img.gif"><a href="#">321</a>
                                                    评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/kkl.gif title=快哭了
                                            </li>
                                            <li>
                                                <small><img src="static/picture/default_head_img.gif"><a
                                                        href="#">123123</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/fd.gif title=发呆
                                            </li>
                                            <li>
                                                <small><img src="static/picture/default_head_img.gif"><a
                                                        href="#">123123</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：hello,world
                                            </li>
                                            <li>
                                                <small><img src="static/picture/default_head_img.gif"><a
                                                        href="#">1515</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：各个环节根据海关监管环境更加
                                            </li>
                                            <li>
                                                <small><img src="/blog/images/26b3040f40414ac68a86b510cfe25303.gif"><a
                                                        href="#">醒不来的梦°</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/fd.gif title=发呆
                                            </li>
                                            <li>
                                                <small><img src="static/picture/26b3040f40414ac68a86b510cfe25303.gif"><a
                                                        href="#">醒不来的梦°</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/fd.gif title=发呆
                                            </li>
                                            <li>
                                                <small><img src="/blog/images/default_head_img.gif"><a
                                                        href="#">nanchen</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：dsadasdsad
                                            </li>
                                            <li>
                                                <small><img src="static/picture/default_head_img.gif"><a href="#">呐喊</a>
                                                    评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/bs.gif title=鄙视
                                            </li>
                                            <li>
                                                <small><img src="static/picture/93f9ef1d8be544c89b476be4be36cdb4.gif"><a
                                                        href="#">HelloBird</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：O(∩_∩)O
                                            </li>
                                            <li>
                                                <small><img src="static/picture/93f9ef1d8be544c89b476be4be36cdb4.gif"><a
                                                        href="#">HelloBird</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：请稍等休息一下！
                                            </li>
                                            <li>
                                                <small><img src="static/picture/93f9ef1d8be544c89b476be4be36cdb4.gif"><a
                                                        href="#">HelloBird</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：img src=/plus/dedemao-comment/face/qiang.gif title=强
                                            </li>
                                            <li>
                                                <small><img src="static/picture/93f9ef1d8be544c89b476be4be36cdb4.gif"><a
                                                        href="#">HelloBird</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：img src=/plus/dedemao-comment/face/qiang.gif title=强
                                            </li>
                                            <li>
                                                <small><img src="static/picture/89078e548e88481fa9706ed0c25da933.gif"><a
                                                        href="#">HelloBird</a> 评论 <a href="/plus/view.php?aid=6">Java学习路线推荐</a>
                                                </small>
                                                ：img src=/plus/dedemao-comment/face/ku.gif title=酷
                                            </li>
                                            <li>
                                                <small><img src="static/picture/36c28829a0cd4e369c1a80e2b868ae50.gif"><a
                                                        href="#">禁止香菜</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：Hi~nbsp;o(*￣▽￣*)ブ
                                            </li>
                                            <li>
                                                <small><img src="static/picture/36c28829a0cd4e369c1a80e2b868ae50.gif"><a
                                                        href="#">禁止香菜</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/hx.gif title=害羞
                                            </li>
                                            <li>
                                                <small><img src="static/picture/fb6f5cf442254618b9d0c88d2b6f82ac.gif"><a
                                                        href="#">Zain</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ：img src=/plus/dedemao-comment/face/fd.gif title=发呆
                                            </li>
                                            <li>
                                                <small><img src="static/picture/myface.png"><a href="#">小刘</a> 评论 <a
                                                        href="/plus/view.php?aid=6">Java学习路线推荐</a></small>
                                                ： 好玩吧
                                            </li>
                                        </div>

                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="">
                                        <div class="b-border"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="">
                                    <div class="b-border"></div>
                                </div>
                            </div>
                            <div class="section-page-w"></div>
                        </div>

                        <script>
                            var jDedemao = jQuery.noConflict(true);
                            jDedemao(function () {
                                jDedemao(".comment-load").show();
                                get_ajax_comment('6', 0, 10);
                                getHeadPic();
                            });
                            jDedemao("input[name='commentorder']").change(function () {
                                jDedemao(".comment-load").show();
                                var orderWay = $(this).val();
                                get_ajax_comment('6', 0, 10, orderWay, 'refresh');
                            });
                            var showZan = '1';
                            var comment_tips = '说点什么吧';
                            var show_floor = '1';
                            var showQQ = '1';
                            var comment_ipaddr = '1';
                            var PLUS_URL = "/plus";
                            var visitor_fill = "电子邮箱";
                            var is_login = 0;
                            var comment_at = "1";
                            var comment_basecolor = "#6bc30d";
                        </script>


                        <script>
                            var a = jDedemao.noConflict(true);
                            //其它库的代码
                            window.$ = window.jQuery = a;
                        </script>
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
<script src="/blog/js/pagemessage.js"></script>
<script src="/blog/js/logreg.js"></script>
<script src="/blog/js/comment.js"></script>


<script>NProgress.start();</script>

<script>
    window.onload = function () {
        NProgress.done();
    };
    (function () {
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

<script type="text/javascript">
    $(function () {
        $(".nav-search-box ul li a span").addClass(function (index) {
            return "hot" + index;
        })
    });
</script>
</body>
</html>