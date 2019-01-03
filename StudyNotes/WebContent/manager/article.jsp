<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="com.common.bean.AdminInfo" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章 - 个人学习笔记管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
 <script type="text/javascript" language="javascript" src="js/common.js"></script>
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
<%
	AdminInfo adminLoginIng;
	adminLoginIng = (AdminInfo)request.getSession().getAttribute("adminLoginIng");
	if(adminLoginIng==null){
		adminLoginIng = new AdminInfo();
		adminLoginIng.setAdmin_id(-1);
		response.sendRedirect("login.jsp");
	}
%>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">YlsatCMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="">消息 <span class="badge">1</span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a href="login.jsp" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="index.jsp">报告</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li class="active"><a href="article.jsp">文章</a></li>
        <li><a href="notice.html">公告</a></li>
        <li><a href="comment.html">评论</a></li>
        <li><a data-toggle="tooltip" data-placement="top" title="网站暂无留言功能">留言</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="category.jsp">栏目</a></li>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
          <ul class="dropdown-menu" aria-labelledby="otherMenu">
            <li><a href="flink.html">友情链接</a></li>
            <li><a href="loginlog.html">访问记录</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a href="#">管理用户组</a></li>
            <li><a href="manage-user.html">管理用户</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="loginlog.html">管理登录日志</a></li>
          </ul>
        </li>
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="setting.html">基本设置</a></li>
            <li><a href="readset.html">用户设置</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">安全配置</a></li>
            <li role="separator" class="divider"></li>
            <li class="disabled"><a>扩展菜单</a></li>
          </ul>
        </li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="/Article/checkAll" method="post" >
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="add-article.jsp">增加文章</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge"></span></h1><input type="button" class="btn btn-primary" id= "qiehuan" onClick="qieHuan1()" value="切换"/>
        <font id = "tishi" size ="-2" color = "gray"></font>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">栏目</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">标签</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody id= 'tbody'>
              
             
            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
                <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            <ul id="paginationpagenav" class="pagination pagenav"></ul>
          </nav>
        </footer>
      </form>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
             <tr id="tr1" style="display:none"><td><input type='text' id ='admin_id' value='${sessionScope.adminLoginIng.admin_id}' /></td></tr>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value='${sessionScope.adminLoginIng.admin_cn}' class="form-control" id="adminCn" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="${sessionScope.adminLoginIng.admin_name}" class="form-control" id="adminName" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">邮箱:</td>
                <td width="80%"><input type="text" value="${sessionScope.adminLoginIng.admin_email}" class="form-control" id="adminEamil" maxlength="30" autocomplete="off" /></td>
              </tr>
               <tr>
                <td wdith="20%">权限:</td>
                <td  width="80%">
                <input   id='level1' type="radio" name="radio" value="1">超级管理员
				<input   id='level2' type="radio" name="radio" value="2">普通管理员
              </tr>
              <tr id="tr2" style="display:none"><td><input type='text' id ='admin_password' value='${sessionScope.adminLoginIng.admin_password}' /></td></tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" id="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" id="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" id="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onClick='updateAdmin()'>提交</button>
        </div>
      </div>
   
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
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
<!--提示模态框-->
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
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问个人学习笔记</li>
    <li class="list-group-item"><span>IP：</span><span id="admin_Login_ip"></span></li>
    <li class="list-group-item"><span>地址：</span>河北省石家庄市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span><span id="liulanqi"></span><span id="liulanqi"></span></li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script> 
<script>
var PAGES =1;
var pageMax = 1;
getPageNum();


yanZheng();

var level = '${sessionScope.adminLoginIng.admin_level}';
var flag = true;
if(level==1){
	flag = true;
	selectAllArticleByPage(2,PAGES);
	$('#tishi').html("这是全部用户的文章。");
}else{
	flag = false;
	selectUserArticleByPage(2,PAGES);
	$('#tishi').html("这是当前用户的文章。");
}
console.log(level);



if(level == 1){
	$("#level1").prop("checked",true);
	$("#level2").prop("checked",false);
	var cb = document.getElementById("level2");
    cb.disabled = true;
    var cb = document.getElementById("level1");
    cb.disabled = false;
	   			
}else if(level == 2){
	$("#level1").prop("checked",false);
	$("#level2").prop("checked",true);
	var cb = document.getElementById("level1");
    cb.disabled = true;
    var cb = document.getElementById("level2");
    cb.disabled = false;
}

//是否确认删除
$(function(){   
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		if (event.srcElement.outerText == "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/Article/delete",
					data: "id=" + id,
					cache: false, //不缓存此页面   
					success: function (data) {
						window.location.reload();
					}
				});
			};
		};
	});   
});

/*
 * 切换
 */
function qieHuan1(){
	if(level==2){
		toastr.waring("权限不够！");
	}else{
		if(flag==true){
			flag = false;
			selectUserArticleByPage(2,PAGES);
			$('#tishi').html("这是当前用户的文章。");
		}else{
			flag = true;
			selectAllArticleByPage(2,PAGES);
			$('#tishi').html("这是全部用户的文章。");
		}
	}
}
/*
 * 查询全部
 设置页数
 */
 function getPageNum(){
	$.ajax({
	    type: "POST",
	    url: "selectAllArticle.do", 
	    dataType: "json",
	  //  async: false, 
	    success:function(data){	
	  		var pageNum = data.result;
	  		pageMax=pageNum;
	  		var html = "";
	  		$('.badge').html(data.articleNum);
	  		$("#paginationpagenav").find("li").remove();
	  		var ul=document.getElementById("paginationpagenav");

	  		var objPrevious=document.createElement("li");
	  		var objNext=document.createElement("li");
	  		var objNow=document.createElement("li");
	  		var objBegin=document.createElement("li");
	  		var objEnd=document.createElement("li");
	  		objBegin.innerHTML="<a href='javascript:;' onClick='selectAllArticleByPage("+2+","+1+")' aria-label='Next'> <span aria-hidden='true'>首页</span> </a>";
	  		objPrevious.innerHTML="<a href='javascript:;' onClick='selectAllArticleByPage("+1+","+PAGES+")' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span> </a>";
	  		objNow.innerHTML="<a href='javascript:;' >"+PAGES+"</a>";
	  		objNext.innerHTML="<a href='javascript:;' onClick='selectAllArticleByPage("+3+","+PAGES+")' > <span aria-hidden='true'>&raquo;</span> </a>";
	  		objEnd.innerHTML="<a href='javascript:;' onClick='selectAllArticleByPage("+2+","+pageNum+")' > <span aria-hidden='true'>尾页</span> </a>";
	  		ul.appendChild(objBegin);	
	  		ul.appendChild(objPrevious);
	  		ul.appendChild(objNow);
	  		ul.appendChild(objNext);
	  		ul.appendChild(objEnd);
	  		
	  		if(PAGES==1){
	  			objBegin.className=("disabled");
	  			objPrevious.className=("disabled");
	  		}else{
	  			objBegin.className=("");
	  			objPrevious.className=("");
	  		}
			if(pageNum==PAGES){
				objNext.className=("disabled");
				objEnd.className=("disabled");
			}else{
				objNext.className=("");
				objEnd.className=("");
			}
	   		console.log(data);
	             
	    },
	    error:function(xhr,state,errorThrown){
					//requesFail(xhr);
	   	 console.log(xhr);
		}
		
	
	  
	});
}


/*
 * 分页查询(1:减一2:不变3:加一)
 */
function selectAllArticleByPage(type,page){
	if(type==1){
		if(page!=1)
		PAGES = page-1;
	}
	else if(type==2){
		PAGES = page;
	}else if(type==3){
		if(PAGES!=pageMax)
		PAGES = page+1;
	}
	if(PAGES>pageMax){
		PAGES=pageMax;
	}
	if(page!=null&&page!=''){

		$.ajax({
		    type: "POST",
		    url: "selectAllArticleByPage.do", 
		    dataType: "json",
		    data:{"page":PAGES},
  success:function(data){	
		    	
		  		var list = data.result;
		  		var str = "";
		  		$('#tbody').html(str);
		  	  for (var i in list) {

		          str += "<tr>" +
		              "<td>  <input type='checkbox' class='input-control' name='checkbox[]' value='" + list[i][0] + "' /></td>" +
		              "<td class='article-title'>" + list[i][1]+ "</td>" +
		              "<td >" + list[i][9] + "</td>" +
		              "<td class='hidden-sm'>" + list[i][6] + "</td>" +
		              "<td class='hidden-sm'>"+0+"</td>"+
		              "<td>"+ list[i][3] + "</td>"+
		              "<td id='td'><a href='update-article.jsp?article_id="
		              + list[i][0] +
		            		  "' >修改</a> <a id='a' rel='"+
		            		  list[i][0] +"'>删除</a></td>"+
		    
		              "</tr>";
		      }
		  	  $('#tbody').html(str);
		  	  getPageNum();
		  	  
		             
		    },
		    error:function(xhr,state,errorThrown){
						//requesFail(xhr);
		   	 console.log(xhr);
			}
			
		
		  
		});
	}else{
		console.log("meiyouPage");
	}
};
function selectUserArticleByPage(type,page){
	if(type==1){
		if(page!=1)
		PAGES = page-1;
	}
	else if(type==2){
		PAGES = page;
	}else if(type==3){
		if(PAGES!=pageMax)
		PAGES = page+1;
	}
	if(PAGES>pageMax){
		PAGES=pageMax;
	}
	if(page!=null&&page!=''){
		
		var id = '${sessionScope.adminLoginIng.admin_id}';
		console.log("damin_id "+id);
		$.ajax({
		    type: "POST",
		    url: "selectUserArticleByPage.do", 
		    dataType: "json",
		    data:{
		    	"page":PAGES,
		    	"user_id":id	
		    },
		    success:function(data){	
		    	
		  		var list = data.result;
		  		var str = "";
		  		$('#tbody').html(str);
		  	  for (var i in list) {

		          str += "<tr>" +
		              "<td>  <input type='checkbox' class='input-control' name='checkbox[]' value='" + list[i][0] + "' /></td>" +
		              "<td class='article-title'>" + list[i][1]+ "</td>" +
		              "<td >" + list[i][8] + "</td>" +
		              "<td class='hidden-sm'>" + list[i][6] + "</td>" +
		              "<td class='hidden-sm'>"+0+"</td>"+
		              "<td>"+ list[i][3] + "</td>"+
		              "<td id='td'><a href='update-article.jsp?article_id="
		              + list[i][0] +
		            		  "' >修改</a> <a id='a' rel='"+
		            		  list[i][0] +"'>删除</a></td>"+
		    
		              "</tr>";
		      }
		  	  $('#tbody').html(str);
		  	 Console.log("hehe   "+list);
		  	  getPageNum();
		  	  
		             
		    },
		    error:function(xhr,state,errorThrown){
						//requesFail(xhr);
		   	 console.log(xhr);
			}
			
		
		  
		});
	}else{
		console.log("meiyouPage");
	}
};
</script>
</body>
</html>
