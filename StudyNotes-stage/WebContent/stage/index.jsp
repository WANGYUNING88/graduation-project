<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人学习笔记</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/nprogress.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<link href="build/toastr.min.css" rel="stylesheet" />
<link href="build/toastr.css" rel="stylesheet" />
<script src="js/jquery-2.1.4.min.js"></script>
<script src="build/toastr.min.js"></script>
<script type="text/javascript">

        toastr.options.positionClass = 'toast-bottom-right';
 </script>
<script src="js/nprogress.js"></script>
<script src="js/jquery.lazyload.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select">
<header class="header">
  <nav class="navbar navbar-default" id="navbar">
    <div class="container">
      <div class="header-topbar hidden-xs link-border">
        <ul class="site-nav topmenu">
          <li><a href="tags.html">标签云</a></li>
          <li><a href="readers.html" rel="nofollow">读者墙</a></li>
          <li><a href="links.html" rel="nofollow">友情链接</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
            <ul class="dropdown-menu header-topbar-dropdown-menu">
              <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
              <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
              <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> RSS</a></li>
            </ul>
          </li>
        </ul>
        <c:choose>
	<c:when test="${sessionScope.userLogin==null}">
	 <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>&nbsp;&nbsp;<a data-toggle="modal" data-target="#registerModal" register class="register" rel="nofollow">我要注册</a>&nbsp;&nbsp;<a href="" rel="nofollow">找回密码</a> 
	</c:when>
	<c:otherwise>
	 <span>欢迎，<span id= "timeQuantum"></span><font color="orange">${userLogin.user_cn}</font></span>&nbsp;&nbsp;<a data-toggle="modal" data-target="#updateModal" class="update" rel="nofollow">个人资料</a> &nbsp;&nbsp;<a href="javascript:;" class="quit" rel="nofollow" onclick="quit()">退出登录</a> 
	</c:otherwise>
</c:choose> 
       </div>
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <h1 class="logo hvr-bounce-in"><a href="" title=""><img src="images/logo.png" alt=""></a></h1>
      </div>
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden-index active"><a data-cont="个人学习笔记首页" href="index.jsp">个人学习笔记首页</a></li>
          <li><a href="category.html">前端技术</a></li>
          <li><a href="category.html">后端程序</a></li>
          <li><a href="category.html">管理系统</a></li>
          <li><a href="category.html">授人以渔</a></li>
          <li><a href="category.html">程序人生</a></li>
        </ul>
        <form class="navbar-form visible-xs" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
  </nav>
</header>
<section class="container">
  <div class="content-wrap">
    <div class="content">
      <div class="jumbotron">
        <h1>欢迎访问个人学习笔记</h1>
        <p>在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</p>
      </div>
      <div id="focusslide" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#focusslide" data-slide-to="0" class="active"></li>
          <li data-target="#focusslide" data-slide-to="1"></li>
          <li data-target="#focusslide" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active"> <a href="" target="_blank"><img src="images/banner/banner_01.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="images/banner/banner_02.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="images/banner/banner_03.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
        </div>
        <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>
      <article class="excerpt-minic excerpt-minic-index">
        <h2><span class="red">【今日推荐】</span><a href="" title="">从下载看我们该如何做事</a></h2>
        <p class="note">一次我下载几部电影，发现如果同时下载多部要等上几个小时，然后我把最想看的做个先后排序，去设置同时只能下载一部，结果是不到一杯茶功夫我就能看到最想看的电影。 这就像我们一段时间内想干成很多事情，是同时干还是有选择有顺序的干，结果很不一样。同时...</p>
      </article>
      <div class="title">
        <h3>最新发布</h3>
        <div class="more"><a href="">PHP</a><a href="">JavaScript</a><a href="">EmpireCMS</a><a href="">Apache</a><a href="">MySQL</a></div>
      </div>
      <article class="excerpt excerpt-1"><a class="focus" href="article.jsp" title=""><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></a>
        <header><a class="cat" href="program">后端程序<i></i></a>
          <h2><a href="article.jsp" title="">php如何判断一个日期的格式是否正确</a></h2>
        </header>
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-1-4 10:29:39</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span> <a class="comment" href="article.jsp#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        <p class="note">可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ... </p>
      </article>
      <article class="excerpt excerpt-2"><a class="focus" href="article.jsp" title=""><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></a>
        <header><a class="cat" href="program">后端程序<i></i></a>
          <h2><a href="article.jsp" title="">php如何判断一个日期的格式是否正确</a></h2>
        </header>
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-1-4 10:29:39</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span> <a class="comment" href="article.jsp#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        <p class="note">可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ... </p>
      </article>
      <article class="excerpt excerpt-3"><a class="focus" href="article.jsp" title=""><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></a>
        <header><a class="cat" href="program">后端程序<i></i></a>
          <h2><a href="article.jsp" title="">php如何判断一个日期的格式是否正确</a></h2>
        </header>
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-1-4 10:29:39</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span> <a class="comment" href="article.jsp#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        <p class="note">可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ... </p>
      </article>
      <article class="excerpt excerpt-4"><a class="focus" href="article.jsp" title=""><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></a>
        <header><a class="cat" href="program">后端程序<i></i></a>
          <h2><a href="article.jsp" title="">php如何判断一个日期的格式是否正确</a></h2>
        </header>
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-1-4 10:29:39</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span> <a class="comment" href="article.jsp#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        <p class="note">可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ... </p>
      </article>
      <article class="excerpt excerpt-5"><a class="focus" href="article.jsp" title=""><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></a>
        <header><a class="cat" href="program">后端程序<i></i></a>
          <h2><a href="article.jsp" title="">php如何判断一个日期的格式是否正确</a></h2>
        </header>
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> 2016-1-4 10:29:39</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共120人围观</span> <a class="comment" href="article.jsp#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        <p class="note">可以用strtotime()把日期（$date）转成时间戳，再用date()按需要验证的格式转成一个日期，来跟$date比较是否相同来验证这个日期的格式是否是正确的。所以要验证日期格式 ... </p>
      </article>
      <nav class="pagination" style="display: none;">
        <ul>
          <li class="prev-page"></li>
          <li class="active"><span>1</span></li>
          <li><a href="?page=2">2</a></li>
          <li class="next-page"><a href="?page=2">下一页</a></li>
          <li><span>共 2 页</span></li>
        </ul>
      </nav>
    </div>
  </div>
  <aside class="sidebar">
    <div class="fixed">
      <div class="widget widget-tabs">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane notice active" id="notice">
            <ul>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a href="" target="_blank">欢迎访问个人学习笔记</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这个小工具中最多可以调用五条</a></li>
            </ul>
          </div>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a data-toggle="modal" data-target="#loginModal" class="btn btn-primary">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:admin@ylsat.com" data-toggle="tooltip" data-placement="bottom" title="admin@ylsat.com">admin@ylsat.com</a></h2>
          </div>
        </div>
      </div>
      <div class="widget widget_search">
        <form class="navbar-form" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
    <div class="widget widget_sentence">
      <h3>每日一句</h3>
      <div class="widget-sentence-content">
        <h4>2016年01月05日星期二</h4>
        <p>Do not let what you cannot do interfere with what you can do.<br />
          别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
      </div>
    </div>
    <div class="widget widget_hot">
      <h3>热门文章</h3>
      <ul>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
      </ul>
    </div>
  </aside>
</section>
<footer class="footer">
  <div class="container">
    <p>&copy; 2016 <a href="">ylsat.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow">豫ICP备20151109-1</a> &nbsp; &nbsp; <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--该功能正在日以继夜的开发中-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--登录注册模态框-->
<div class="modal fade user-select" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="loginModalLabel">登录</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="loginModalUserNmae">用户名</label>
            <input type="text" class="form-control" id="loginModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="loginModalUserPwd">密码</label>
            <input type="password" class="form-control" id="loginModalUserPwd" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onclick="login()">登录</button>
        </div>
    </div>
  </div>
</div>
<!--修改用户态框-->
<div class="modal fade user-select" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="updateModalLabel"></h4>
        </div>
        <div class="modal-body">
        <div class="form-group">
            <label for="updateModalUserNmae">id</label>
            <input type="text" class="form-control" id="updateModalUserId"  autofocus maxlength="15" autocomplete="off" required value="${userLogin.user_id}">
          </div>
          <div class="form-group">
            <label for="updateModalUserNmae">用户名</label>
            <input type="text" class="form-control" id="updateModalUserNmae"  autofocus maxlength="15" autocomplete="off" required value="${userLogin.user_name}">
          </div>
          <div class="form-group">
            <label for="updateModalUserCn">姓名</label>
            <input type="text" class="form-control" id="updateModalUserCn"  autofocus maxlength="15" autocomplete="off" required value="${userLogin.user_cn}">
          </div>
          <div class="form-group">
            <label for="updateModalUserEmail">邮箱</label>
            <input type="text" class="form-control" id="updateModalUserEmail"  maxlength="18" autocomplete="off" required value="${userLogin.user_email}">
          </div>
	        
	        <div class="form-group">
	            <label for="updateModalUserPwd1">旧密码</label>
	            <input type="password" class="form-control" id="updateModalUserPwd1" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
	          </div>
	          <div class="form-group">
	            <label for="updateModalUserPwd2">新密码</label>
	            <input type="password" class="form-control" id="updateModalUserPwd2" placeholder="请再输入密码确定" maxlength="18" autocomplete="off" required>
	          </div>
	           <div class="form-group">
	            <label for="updateModalUserPwd3">确认新密码</label>
	            <input type="password" class="form-control" id="updateModalUserPwd3" placeholder="请再输入密码确认" maxlength="18" autocomplete="off" required>
	          </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	          <button type="submit" class="btn btn-primary" onclick="update()">修改</button>
	        </div>
        </div>
    </div>
  </div>
</div>
<!--登录注册模态框-->
<div class="modal fade user-select" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="registerModalLabel">注册</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="registerModalUserNmae">用户名</label>
            <input type="text" class="form-control" id="registerModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="registerModalUserCn">姓名</label>
            <input type="text" class="form-control" id="registerModalUserCn" placeholder="请输入姓名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="registerModalUserPwd1">密码</label>
            <input type="password" class="form-control" id="registerModalUserPwd1" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
           <div class="form-group">
            <label for="registerModalUserPwd2">确定密码</label>
            <input type="password" class="form-control" id="registerModalUserPwd2" placeholder="请再输入密码确定" maxlength="18" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="registerModalUserEmail">邮箱</label>
            <input type="text" class="form-control" id="registerModalUserEmail" placeholder="请输入邮箱" maxlength="18" autocomplete="off" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onclick="register()">注册</button>
        </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问个人学习笔记</li>
    <li class="list-group-item"><span>IP：</span><span id="ip"></span></li>
    <li class="list-group-item"><span>地址：</span><span id="city"></span></li>
    <li class="list-group-item"><span>系统：</span><span id="system"></span> </li>
    <li class="list-group-item"><span>浏览器：</span><span id="liulanqi"></span></li>
  </ul>
</div>

<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.ias.js"></script> 
<script src="js/scripts.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">  
     console.log(returnCitySN["cip"]+','+returnCitySN["cname"])  
     $('#ip').html(returnCitySN["cip"]);
     $('#city').html(returnCitySN["cname"]);
</script>
<script src="js/common.js"></script>
<script >
/*
 * 初始化页面
 
 */
 var system = getSystem();
 console.log("system  "+system);
 $('#system').html(system);
 var liulanqi =getLiuLanQi();
 console.log("liulanqi   "+liulanqi);
 $('#liulanqi').html(liulanqi);
 var timeQuantum = getTimeQuantum();
 $('#timeQuantum').html(timeQuantum);
 setInterval(function(){
	 var timeQuantum = getTimeQuantum();
	 $('#TimeQuantum').html(timeQuantum);
	},1000*60*10);
 
</script>
</body>
</html>