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
    <title>我的博客</title>
    <link rel="stylesheet" href="/blog/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/blog/layui/css/layui.css" />
    <link rel="stylesheet" href="/blog/css/fore/master.css" />
    <link rel="stylesheet" href="/blog/css/fore/global.css" />
    <link rel="stylesheet" href="/blog/css/fore/nprogress.css" />
    <link rel="stylesheet" href="/blog/css/fore/blog.css" />
    <link rel="stylesheet" href="/blog/css/fore/style.css" />
    <link rel="stylesheet" href="/blog/bootstrap-3.3.7-dist/css/bootstrap.css" />
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
                    <li><a href="index.html">首页</a></li>
                    <li><a href="article.html">博客</a></li>
                    <li><a href="message.html">留言</a></li>
                    <li><a href="diary.html">日记</a></li>
                    <li><a href="link.html">友链</a></li>
                </ul>
            </nav>
            <div class="blog-user">
                <button class="login-btn" onclick="login()" style="font-size: 14px">登录</button>
                <button class="login-btn" onclick="regist()"  style="color:#fff;font-size: 14px;background: rgb(62,196,131)">注册</button>
            </div>
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
        <div class="col-content">
            <div class="inner">
                <article class="article-list bloglist" id="LAY_bloglist" >
                <c:forEach items="${articles}" var="article">
                    <section class="article-item zoomIn article">
                        <div class="fc-flag">置顶</div>
                        <h5 class="title">
                            <span class="fc-blue">【原创】</span>
                            <a href="read.html">${article.title}</a>
                        </h5>
                        <div class="time">
                            <span class="day">${fn:substring(article.create_time,8 ,10)}</span>
                            <span class="month fs-18">${fn:substring(article.create_time,5 ,7)}<span class="fs-14">月</span></span>
                            <span class="year fs-18 ml10">${fn:substring(article.create_time,0 ,4)}</span>
                        </div>
                        <div class="content">
                            <a href="/blog/article/queryByIdToDetail?aid=${article.aid}" class="cover img-light">
                                <img src="${article.logo}">
                            </a>
                            ${article.digest}
                        </div>
                        <div class="read-more">
                            <a href="read.html" class="fc-black f-fwb">详细内容</a>
                        </div>
                        <aside class="f-oh footer">
                            <div class="f-fl tags">
                                <span class="fa fa-tags fs-16"></span>
                                <a class="tag"> ${article.tagNames}</a>
                            </div>
                            <div class="f-fr">
									<span class="read">

										<a href="javascript:void(0)">
                                            <i class="fa fa-eye fs-16"></i>
                                            <i class="num">${article.visit_count}</i>
                                        </a>
									</span>
                                <span class="ml20">
                                    <a href="javascript:void(0)" onclick="addThumbsUp(${article.aid},$('#thumbs${article.aid}'))">
										<i class="fa fa-thumbs-up fs-16"></i>
                                        <i class="num" id="thumbs${article.aid}">${article.thumbsUp}</i>
                                    </a>
								</span>
                            </div>
                        </aside>
                    </section>
                </c:forEach>
                </article>
            </div>
        </div>
        <div class="col-other">
            <div class="inner">
                <div class="other-item" id="categoryandsearch">
                    <div class="search">
                        <label class="search-wrap">
                            <input type="text" id="searchtxt" placeholder="输入关键字搜索" />
                            <span class="search-icon">
					                <i class="fa fa-search"></i>
					            </span>
                        </label>
                        <ul class="search-result"></ul>
                    </div>
                    <ul class="category mt20" id="category">
                        <li data-index="0" class="slider"></li>
                        <li data-index="1"><a href="/Blog/Article">全部文章</a></li>
                        <li data-index="2"><a href="/Blog/Article/1/">Java</a></li>
                        <li data-index="3"><a href="/Blog/Article/2/">前端</a></li>
                        <li data-index="4"><a href="/Blog/Article/3/">Python</a></li>
                        <li data-index="5"><a href="/Blog/Article/4/">PHP</a></li>
                        <li data-index="6"><a href="/Blog/Article/5/">其它</a></li>
                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="layui-icon">&#xe603;</i></div>
                <div class="article-category">
                    <div class="article-category-title">分类导航</div>
                    <a href="/Blog/Article/1/">Java</a>
                    <a href="/Blog/Article/2/">前端</a>
                    <a href="/Blog/Article/3/">Python</a>
                    <a href="/Blog/Article/4/">PHP</a>
                    <a href="/Blog/Article/5/">其它</a>
                    <div class="f-cb"></div>
                </div>
                <!--遮罩-->
                <div class="blog-mask animated layui-hide"></div>
                <div class="other-item">
                    <h5 class="other-item-title">热门文章</h5>
                    <div class="inner">
                        <ul class="hot-list-article">
                            <li> <a href="/Blog/Read/9">SpringBoot 入门爬虫项目实战</a></li>
                            <li> <a href="/Blog/Read/12">SpringBoot 2.x 教你快速入门</a></li>
                            <li> <a href="/Blog/Read/13">java学习路线</a></li>
                            <li> <a href="/Blog/Read/4">基于SpringBoot+JWT+Redis跨域单点登录的实现</a></li>
                            <li> <a href="/Blog/Read/7">SpringBoot 中如何使用SwaggerAPI接口文档？</a></li>
                            <li> <a href="/Blog/Read/11">小白轻松入门Redis</a></li>
                            <li> <a href="/Blog/Read/14">微信一键登录功能的实现</a></li>
                            <li> <a href="/Blog/Read/8">NPOI导入导出Excel</a></li>
                        </ul>
                    </div>
                </div>
                <div class="other-item">
                    <h5 class="other-item-title">置顶推荐</h5>
                    <div class="inner">
                        <ul class="hot-list-article">
                            <li> <a href="/Blog/Read/16">java学习路线</a></li>
                            <li> <a href="/Blog/Read/14">基于SpringBoot+JWT+Redis跨域单点登录的实现</a></li>
                            <li> <a href="/Blog/Read/9">小白轻松入门Redis</a></li>
                        </ul>
                    </div>
                </div>
                <div class="other-item">
                    <h5 class="other-item-title">最近访客</h5>
                    <div class="inner">
                        <dl class="vistor">
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/72388EA977643E8F97111222675720B1/100"><cite>Anonymous</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/342F777E313DDF5CCD6E3E707BB0770B/100"><cite>Dekstra</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/EA5D00A72C0C43ECD8FC481BD274DEEC/100"><cite>惜i</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/EF18CEC98150D2442183AA30F05AAD7B/100"><cite>↙Aㄨ计划 ◆莪↘</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/3D8D91AD2BAFD36F5AC494DA51E270E6/100"><cite>.</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/B745A110DAB712A0E6C5D0B633E905D3/100"><cite>Lambert.</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/E9BA3A2499EC068B7917B9EF45C4D13C/100"><cite>64ღ</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/09F92966169272DD7DD9999E709A0204/100"><cite>doBoor</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/59991D53192643A1A651383847332EB6/100"><cite>毛毛小妖</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/FF34F311DDC43E2AF63BE897BCA24F05/100"><cite>NULL</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/59AA25A7627284AE62C8E6EBDC6FE417/100"><cite>吓一跳</cite></a></dd>
                            <dd><a href="javasript:;"><img src="https://thirdqq.qlogo.cn/qqapp/101465933/28B021E0F5AF0A4B9B781A24329FE897/100"><cite>如初</cite></a></dd>
                        </dl>
                    </div>
                </div>
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
                    <a href="https://wpa.qq.com/msgrd?v=3&uin=930054439&site=qq&menu=yes" class="qq" target="_blank" title="930054439"><i class="fa fa-qq"></i></a>
                    <a href="https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=gbiysbG0tbWyuMHw8K-i7uw" class="email" target="_blank" title="930054439@qq.com"><i class="fa fa-envelope"></i></a>
                    <a href="javascript:void(0)" class="weixin"><i class="fa fa-weixin"></i></a>
                </div>
                <p class="mt05">
                    Copyright &copy; 2019-2020 Andy博客 All Rights Reserved V.3.1.3 Power by ZQ博客
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
        <form action="#" method="post" class="signin-form">
            <div class="form-input">
                <span class="fa fa-user-o" aria-hidden="true"></span>
                <input autofocus type="email" name="email"
                       placeholder="用户名" required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="password" placeholder="密码"
                                                                          required />
            </div>
            <div class="login-remember d-grid" style="color: black">
                <button style="width: 330px" class="btn theme-button">登录</button>
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
        <form action="#" method="post" class="signin-form">
            <div class="form-input">
                <span class="fa fa-user-o" aria-hidden="true"></span>
                <input autofocus type="text" name="email" placeholder="请输入用户名" required />
            </div>
            <div class="form-input">
                <span class="fa fa-envelope-o" aria-hidden="true"></span>
                <input type="email" name="email" placeholder="请输入邮箱" required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="password" placeholder="请输入密码"
                                                                         required />
            </div>
            <div class="form-input">
                <span class="fa fa-key" aria-hidden="true"></span>
                <input type="password" name="password" placeholder="再次确认密码"
                                                                          required />
            </div>

            <div class="login-remember d-grid">

                <button style="width: 330px" class="btn theme-button">注册</button>
            </div>
        </form>
    </div>
</div>
<style type="text/css">
    .login {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 3000px;
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
<script>NProgress.start();</script>
<script src="/blog/js/yss/article.js"></script>
<script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script>
    window.onload = function () {
        NProgress.done();
    };
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

    //异步增加点赞数
    function addThumbsUp(aid,thumb) {
        $.get("/blog/article/addThumbsUp",{'aid':aid},
        function (data) {
            if(data.ok){
                thumb.text(data.mess);
            }
        },'json'
        );
    }

</script>
</body>
</html>
