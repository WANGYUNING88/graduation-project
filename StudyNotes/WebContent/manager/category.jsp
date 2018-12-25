<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page import="com.common.bean.AdminInfo" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>栏目 - 异清轩博客管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<!-- 提示的插件 -->
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
            <li><a href="">消息 <span class="badge"></span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a  onClick="if(confirm('是否确认退出？'))  quitAdmin();">退出登录</a></li>
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
        <li><a href="article.html">文章</a></li>
        <li><a href="notice.html">公告</a></li>
        <li><a href="comment.html">评论</a></li>
        <li><a data-toggle="tooltip" data-placement="top" title="网站暂无留言功能">留言</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li class="active"><a href="category.jsp">栏目</a></li>
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
      <div class="row">
        <div class="col-md-5">
          <h1 class="page-header">添加</h1>
          
            <div class="form-group">
              <label for="category-name" >栏目名称</label>
              <input type="text" id="name" name="name" class="form-control" placeholder="在此处输入栏目名称" required autocomplete="off">
              <span class="prompt-text">这将是它在站点上显示的名字。</span> </div>
            <div class="form-group">
              <label for="category-alias">栏目别名</label>
              <input type="text" id="alias" name="alias"  class="form-control" placeholder="在此处输入栏目别名" required autocomplete="off">
              <span class="prompt-text">“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。</span> </div>
            <div class="form-group">
              <label for="category-fname" >父节点</label>
              <select id="fid" class="form-control" name="fid" >
                <option value="0" selected>无</option>                
              </select>
              <span class="prompt-text">栏目是有层级关系的，您可以有一个“音乐”分类目录，在这个目录下可以有叫做“流行”和“古典”的子目录。</span> </div>
            <div class="form-group">
              <label for="category-keywords">关键字</label>
              <input type="text" id="keywords" name="keywords" class="form-control" placeholder="在此处输入栏目关键字" autocomplete="off">
              <span class="prompt-text">关键字会出现在网页的keywords属性中。</span> </div>
            <div class="form-group">
              <label for="category-describe">描述</label>
              <textarea class="form-control" id="describe" name="describe" rows="4" autocomplete="off"></textarea>
              <span class="prompt-text">描述会出现在网页的description属性中。</span> </div>
            <input type="submit" class="btn btn-primary" id ="addNewColumn" value="添加新栏目" >
         
        </div>
        <div class="col-md-7">
          <h1 class="page-header">管理 <span class="badge">3</span></h1>
          <div class="table-responsive">
            <table class="table table-striped table-hover">
              <thead>
                <tr>
                  <th><span class="glyphicon glyphicon-paperclip"></span> <span class="visible-lg">ID</span></th>
                  <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">名称</span></th>
                  <th><span class="glyphicon glyphicon-list-alt"></span> <span class="visible-lg">别名</span></th>
                  <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">总数</span></th>
                  <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                </tr>
              </thead>
              <tbody id="tbody">         
                
              </tbody>
            </table>
            <ul id="paginationpagenav" class="pagination pagenav">
             
            </ul>
            <span class="prompt-text"><strong>注：</strong>删除一个栏目也会删除栏目下的文章和子栏目,请谨慎删除!</span> </div>
        </div>
      </div>
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
<!-- 修改栏目 -->
<div class="modal fade" id="update-category" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	 <h4 class="modal-title" >修改栏目</h4>
 </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
             <tbody>
             <tr id="tr1" style="display:none"><td><input type='text' id = 'id1' /></td></tr>
       		<tr>
                <td rowspan='2'  wdith="20%">栏目名称:</td>
                <td width="80%"><input type="text" id="name1" name="name"  class="form-control" placeholder="在此处输入栏目名称" required autocomplete="off" maxlength="10"  /></td>
				
              </tr>
			  <tr><td colspan='1'><span class="prompt-text">这将是它在站点上显示的名字。</span></td></tr>
              <tr>
                <td  rowspan='2' wdith="20%">栏目别名:</td>
                <td width="80%"><input id="alias1" name="alias"  class="form-control" placeholder="在此处输入栏目别名"  maxlength="10" autocomplete="off" /></td>
				
              </tr>
			  <tr><td> <span class="prompt-text">“别名”是在URL中使用的别称，它可以令URL更美观。通常使用小写，只能包含字母，数字和连字符（-）。</span> </td></tr>

              <tr>
                <td rowspan='2' wdith="20%">父节点:</td>
                <td width="80%"><select id="fid1" class="form-control" name="fid">
									<option value="0" >无</option></select></td>	
								
				
              </tr>
			  <tr><td><span class="prompt-text">栏目是有层级关系的，您可以有一个“音乐”分类目录，在这个目录下可以有叫做“流行”和“古典”的子目录。</span></td></tr>
              <tr>
                <td rowspan='2' wdith="20%">关键字:</td>
                <td width="80%"><input type="text" id="keywords1" name="keywords" class="form-control" placeholder="在此处输入栏目关键字" maxlength="18" autocomplete="off" /></td>
             
			  </tr>
			   <tr><td><span class="prompt-text">关键字会出现在网页的keywords属性中。</span><td></tr>
              <tr>
                <td rowspan='2' wdith="20%">描述:</td>
                <td width="80%"> <textarea class="form-control" id="describe1" maxlength="18" name="describe" rows="4" autocomplete="off"></textarea></td >
				
              </tr>
              <tr><td><span class="prompt-text">描述会出现在网页的description属性中。</span></td></tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onClick='updateColumn()'>更新</button>
        </div>
      </div>
    </div>
  </div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span><span id="admin_Login_ip"></span></li>
    <li class="list-group-item"><span>地址：</span>河北省石家庄市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span><span id="liulanqi"></span><span id="liulanqi"></span></li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script> 

<script>
/*
 * 初始化
 */
 var yanzheng = 0;
var PAGES =1;
var pageMax = 1;
selectAllColumnByPage(2,PAGES);
getPageNum();
selectFatherColumn();
yanZheng();
var level = '${sessionScope.adminLoginIng.admin_level}';
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

$("#name1").change(function(){
	var text = $("#name1").val();
	var patt1 = new RegExp(/\s+/g);
    if (patt1.test(text)) {
    	text = Trim(text,"g");
    	$("#name1").val(text);
    	toastr.warning("检测到栏目名称中空格，已删除空格!");
	}	
	
}) ;
$("#name").change(function(){
	var text = $("#name").val();
	var patt1 = new RegExp(/\s+/g);
    if (patt1.test(text)) {
    	text = Trim(text,"g");
    	$("#name").val(text);
    	toastr.warning("检测到栏目名称中包含空格，已删除空格!");
	}	
	
});
$("#alias1").change(function(){
	var text = $("#alias1").val();
	var patt1 = new RegExp(/\s+/g);
    if (patt1.test(text)) {
    	text = Trim(text,"g");
    	$("#alias1").val(text);
    	toastr.warning("检测到栏目别名中包含空格，已删除空格!");
	}	
	
}) ;
$("#alias").change(function(){
	var text = $("#alias").val();
	var patt1 = new RegExp(/\s+/g);
    if (patt1.test(text)) {
    	text = Trim(text,"g");
    	$("#alias").val(text);
    	toastr.warning("检测到栏目别名中包含空格，已删除空格!");
	}	
	
}) ;

/*
 * 查询父节点
 */
 function selectFatherColumn(){
	 
	$.ajax({
	    type: "POST",
	    url: "selectFatherColumn.do", 
	    dataType: "json",
	    data:{},
	    success:function(data){	
	  		var list = data.result;
	  		var html ="";
	  		var div = document.getElementById("fid");
	  		while(div.hasChildNodes()) //当div下还存在子节点时 循环继续  
	  		    {
	  		        div.removeChild(div.firstChild);
	  		    }
	  		$("#fid").append("<option value='0' selected>无</option>");
	  		var div1 = document.getElementById("fid1");
	  		if(div1!=null){
		  		while(div1.hasChildNodes()) //当div下还存在子节点时 循环继续  
		  		    {
		  		        div1.removeChild(div1.firstChild);
		  		    }
		  		$("#fid1").append("<option value='0' selected>无</option>");
	    	}
	  		for(i in list) {
				//添加option元素
				html+=("<option value='" + list[i].column_id + "'>" + list[i].column_name + "</option>");
			}
	  		$("#fid").append(html);
	  		$("#fid1").append(html);
	  		console.log(html);
	   		console.log("父节点"+data);
	             
	    },
	    error:function(xhr,state,errorThrown){
					//requesFail(xhr);
	   	 console.log(xhr);
		}
		
	
	  
	  
	});
}
/*
 * 查询全部
 设置页数
 */
 function getPageNum(){
	$.ajax({
	    type: "POST",
	    url: "selectAllColumn.do", 
	    dataType: "json",
	  //  async: false, 
	    success:function(data){	
	  		var pageNum = data.result;
	  		pageMax=pageNum;
	  		var html = "";
	  		$('.badge').html(data.columnNum);
	  		$("#paginationpagenav").find("li").remove();
	  		var ul=document.getElementById("paginationpagenav");

	  		var objPrevious=document.createElement("li");
	  		var objNext=document.createElement("li");
	  		var objNow=document.createElement("li");
	  		var objBegin=document.createElement("li");
	  		var objEnd=document.createElement("li");
	  		objBegin.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+2+","+1+")' aria-label='Next'> <span aria-hidden='true'>首页</span> </a>";
	  		objPrevious.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+1+","+PAGES+")' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span> </a>";
	  		objNow.innerHTML="<a href='javascript:;' >"+PAGES+"</a>";
	  		objNext.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+3+","+PAGES+")' > <span aria-hidden='true'>&raquo;</span> </a>";
	  		objEnd.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+2+","+pageNum+")' > <span aria-hidden='true'>尾页</span> </a>";
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
function selectAllColumnByPage(type,page){
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
		    url: "selectAllColumnByPage.do", 
		    dataType: "json",
		    data:{"page":PAGES},
		    success:function(data){	
		  		var list = data.result;
		  		var str = "";
		  		$('#tbody').html(str);
		  	  for (i in list) {
		  		
		          str += "<tr>" +
		              "<td >" + list[i].column_id + "</td>" +
		              "<td >" + list[i].column_name + "</td>" +
		              "<td >" + list[i].column_byname + "</td>" +
		              "<td >" + 2 + "</td>" +
		              "<td id='td'><a id='updatecategory' data-toggle='modal' data-target='#update-category' rel='"
		              +list[i].column_id+
		            		  "'' >修改</a> <a id='a' rel='"+ 
		            				  list[i].column_id +"'>删除</a></td>"+
		    
		              "</tr>";
		      }
		  	  $('#tbody').html(str);
		  	getPageNum();
		  	console.log(data);
		             
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
/*
 * 绑定修改的事件
 */
 $(document).on("click","#updatecategory", function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		console.log("修改的id"+id);
		
			$.ajax({
				 type: "POST",
				 url: "selectColumnById.do", 
				 dataType: "json",
				 data:{"column_id":id},
				
				 success:function(data){	
					var result = data.result;
					if(result!=null){
						$("#id1").val(result.column_id);
						$("#name1").val(result.column_name);
						$("#alias1").val(result.column_byname);
						$("#fid1").val(result.column_father_node);
						$("#keywords1").val(result.column_keyword);
						$("#describe1").html(result.column_describe);
						 $("#fid1  option[value="+result.column_father_node+"] ").attr("selected",true)
					}else{
						toastr.error('获取失败');
					}
					console.log("获取"+result);
						  
				 },
				 error:function(xhr,state,errorThrown){
							//requesFail(xhr);
					 console.log(xhr);
				}
				

		   
		   
		    });
		

});


//是否确认删除
  $(document).on("click","#a", function(){
	  			var name = $(this);
				var id = name.attr("rel"); //对应id  
				console.log("删除的id"+id);
				if(window.confirm("此操作不可逆，是否确认？")){
					$.ajax({
						 type: "POST",
						 url: "deleteColumn.do", 
						 dataType: "json",
						 data:{"column_id":id},
						
						 success:function(data){	
							var result = data.result;
							if(result==true){
								toastr.success('id: '+id+'删除成功');
								getPageNum();
								selectAllColumnByPage(2,PAGES);
								selectFatherColumn();
							}else{
								toastr.error('id: '+id+'删除失败');
							}
							console.log("删除"+result);
								  
						 },
						 error:function(xhr,state,errorThrown){
									//requesFail(xhr);
							 console.log(xhr);
						}
						

				   
				   
				    });
				};

	});
   

/*
 * addNewColumn
 */
 $('#addNewColumn').click(function(){
	 var name = $("#name").val();
	 var alias = $("#alias").val();
	 var fid = $("#fid").val();
	 var keywords = $("#keywords").val();
	 var describe = $("#describe").val();
	 if((name!='')&&(alias!="")){
	
		 $.ajax({
			    type: "POST",
			    url: "insertColumn.do", 
			    dataType: "json",
			    data:{"name":name,
			    	  "alias":alias,
			    	  "fid":fid,
			    	  "keywords":keywords,
			    	  "describe":describe},
			    success:function(data){	
			  		var result = data.result;
			  		
			  		if(result==true){
			  			toastr.success('添加成功');
			  			getPageNum();
			  			selectAllColumnByPage(2,PAGES);
			  			selectFatherColumn();
			  		}else{
			  			toastr.error('添加失败');
			  		}
			   		console.log("插入"+result);
			             
			    },
			    error:function(xhr,state,errorThrown){
							//requesFail(xhr);
			   	 console.log(xhr);
				}
				
	
			  
			  
			});
	 }else{ 
		 if(name==""){
			 toastr.warning("项目名称不能为空");
		 	}else if(alias==""){
				toastr.warning("项目别名不能为空");
			 	
		 	}
		 
		 console.log("name : "+name+"alias : "+alias);
	 }
});


/*/
 * 修改栏目
 */
function updateColumn(){
	var id = $('#id1').val();
	 var name = $("#name1").val();
	 var alias = $("#alias1").val();
	 var fid = $("#fid1").val();
	 var keywords = $("#keywords1").val();
	 var describe = $("#describe1").val();
	 if((name!='')&&(alias!="")){
	
		 $.ajax({
			    type: "POST",
			    url: "updateColumn.do", 
			    dataType: "json",
			    data:{"id1":id,
			    	"name1":name,
			    	  "alias1":alias,
			    	  "fid1":fid,
			    	  "keywords1":keywords,
			    	  "describe1":describe},
			    success:function(data){	
			  		var result = data.result;
			  		
			  		if(result==true){
			  			toastr.success('id: '+id+'修改成功');
			  			getPageNum();
			  			selectAllColumnByPage(2,PAGES);
			  			selectFatherColumn();
			  		}else{
			  			toastr.error('id: '+id+'修改失败');
			  		}
			   		console.log("修改"+result);
			             
			    },
			    error:function(xhr,state,errorThrown){
							//requesFail(xhr);
			   	 console.log(xhr);
				}
				
	
			  
			  
			});
	 }else{ 
		 if(name==""){
			 toastr.warning("项目名称不能为空");
		 	}else if(alias==""){
				toastr.warning("项目别名不能为空");
			 	
		 	}
		 
		 console.log("name : "+name+"alias : "+alias);
	 }
}
</script>
</body>
</html>