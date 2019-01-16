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
<title>文章修改 - 个人学习笔记管理系统</title>
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
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String name = request.getParameter("article_id");//用request得到 
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
      <div class="row">
        
          <div class="col-md-9">
            <h1 class="page-header">文章修改</h1>
            <div class="form-group">
              <label for="article-title" class="sr-only">标题</label>
              <input type="text" id="article-title" name="title" class="form-control" placeholder="在此处输入标题"  required autofocus autocomplete="off">
            </div>
            <div class="form-group">
              <label for="article-content" class="sr-only">内容</label>
              <script id="article-content" name="content" type="text/plain"></script>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>关键字</span></h2>
              <div class="add-article-box-content">
              	<input type="text" class="form-control" placeholder="请输入关键字"  name="keywords" autocomplete="off">
                <span class="prompt-text">多个标签请用英文逗号,隔开。</span>
              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>描述</span></h2>
              <div class="add-article-box-content">
              	<textarea class="form-control" name="describe" autocomplete="off"></textarea>
                <span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>栏目</span></h2>
               <div class="add-article-box-content">
                  <ul class="category-list">
                  </ul>
                  <ul id="paginationpagenav" ></ul>

              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>标签</span></h2>
              <div class="add-article-box-content">
                <input type="text" class="form-control" placeholder="输入新标签"  name="tags" autocomplete="off">
                <span class="prompt-text">多个标签请用英文逗号,隔开</span> </div>
            </div>
             <div class="add-article-box">
              <h2 class="add-article-box-title"><span>标题图片</span></h2>
              <div class="add-article-box-content">
             	<form id="uploadForm" enctype='multipart/form-data'>
              	 <input id="pop_file" type="file" accept=".jpg,.jpeg,.png" v-on:change="uploadFile($event)" name="pic" ref="file"  />
    			
				</form>
				 <input class="pop_but" type="submit" onClick="upload()" value="提交"/>
       			
              	<div >
              	
              	<img style="width: auto;  
				    height: auto;  
				    max-width: 100%;  
				    max-height: 100%;     
              	" id="img" /></div>
              	
              </div>
              </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>发布</span></h2>
              <div class="add-article-box-content">
              	<p><label>状态：</label><span class="article-status-display">已发布</span></p>
                <p><label>公开度：</label><input type="radio" name="visibility" value="0" />公开 <input type="radio" name="visibility" value="1" />加密</p>
                <p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime" name="time1" value="2016-01-09 17:29:37" /></span></p>
              </div>
              <div class="add-article-box-footer">
				<button class="btn btn-primary" type="submit" name="submit" onClick="updateArticle()">更新</button>              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
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
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
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
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script>
<script src="lib/ueditor/ueditor.config.js"></script> 
<script src="lib/ueditor/ueditor.all.min.js"> </script> 
<script src="lib/ueditor/lang/zh-cn/zh-cn.js"></script>  
<script id="uploadEditor" type="text/plain" style="display:none;"></script>
<script type="text/javascript">
var imgUrl = "";
var imgUrlOrd = "";
var uploadPath="..//..//upload//";
var PAGES =1;
var pageMax = 1;
selectAllColumnByPage(2,PAGES);
getPageNum();
var id = "${param.article_id}";
var user_id=0;
console.log("文章的id"+id);

var editor = UE.getEditor('article-content');
window.onresize=function(){
    window.location.reload();
}
selectArticleById(id);

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
	  		objBegin.style.display="inline-block";
	  		objPrevious.style.display="inline-block";
	  		objNow.style.display="inline-block";
	  		objNext.style.display="inline-block";
	  		objEnd.style.display="inline-block";
	  		
	  		objBegin.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+2+","+1+")' aria-label='Next'> <span aria-hidden='true'>&nbsp;首页&nbsp;</span> </a>";
	  		objPrevious.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+1+","+PAGES+")' aria-label='Previous'> <span aria-hidden='true'>&nbsp;&laquo;&nbsp;</span> </a>";
	  		objNow.innerHTML="<a href='javascript:;' >&nbsp;"+ PAGES+"&nbsp;</a>";
	  		objNext.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+3+","+PAGES+")' > <span aria-hidden='true'>&nbsp;&raquo;&nbsp;</span> </a>";
	  		objEnd.innerHTML="<a href='javascript:;' onClick='selectAllColumnByPage("+2+","+pageNum+")' > <span aria-hidden='true'>&nbsp;尾页&nbsp;</span> </a>";
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
		  		$('.category-list').html(str);
		  	  for (i in list) {
		  		
		  		  str+="<li>"+
                  "<label>"+
                  "<input name='category' type='radio' value='"
                  +list[i].column_id+"' >"+
                  list[i].column_name+" <em class='hidden-md'>( 栏目ID: <span>"+list[i].column_id+"</span> )</em></label>";
		          
		      }
		  	$('.category-list').html(str);
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

function showPhoto(a){
	   if(a!=null&&a!=''){
		   
		 var url = "showPhoto.do?url="+a;
	    var xhr = new XMLHttpRequest();
	    xhr.open('POST', url, true);
	    xhr.responseType = "blob";
	    //xhr.setRequestHeader("client_type", "DESKTOP_WEB");
	    //xhr.setRequestHeader("desktop_web_access_key", _desktop_web_access_key);
	    xhr.onload = function () {
	        if (this.status == 200) {
	            var blob = this.response;
	            var img = document.getElementById("img");
	            img.onload = function (e) {
	                window.URL.revokeObjectURL(img.src);
	            };
	            img.src = window.URL.createObjectURL(blob);
	            $("#img").html(img);
	        }
	    }
	    xhr.send();

		   
	    	   $.ajax({
	    		   url:"showPhoto.do",
	    		   data:{
	    			   "url":a
	    		   },
	    		   dataType:"json",
				   type:"POST",
				   success:function(data){
					   
					   $("#img").attr("src",data);
				   },
				   error:function(data){
					   console.log(data);
				   }
	    	   });
	   }
  }


function upload(){
	 var oFiles = document.getElementById("pop_file").files;

	 var formData = new FormData();//创建FormData对象，将所需的信息封装到内部，以键值对的方式

	 formData.append("pic",oFiles[0]);//参数封装格式,可以是文件，亦可以是普通的字符串

	 if(oFiles[0]==null){
		 toastr.warning("请选择一个图片");	
	 }else {
		 
		 
		 $.ajax({
			
			url:"upload.do",
			data:formData,
			dataType:"json",
			type:"POST",
			contentType: false,
			processData: false,
			success:function(data){
				var img = data.path;
				imgUrl=img;
				showPhoto(img);
				
			}
		});
	 }
}

function selectArticleById(aid){
	if(aid==""||aid==null){
		toastr.warning("获取id失败","文章");
	}else{
		 $.ajax({
				
				url:"selectArticleById.do",
				data:{
					"article_id":aid
				},
				dataType:"json",
				type:"POST",
				success:function(data){
					
					var list = data.result;
					article_id = list[0][0];
					user_id = list[0][7];;
					console.log("admin_id "+user_id);
					$("input[type='radio'][name='category'][value='"+list[0][10]+"']").attr("checked",true);  
					$("input[type='radio'][name='visibility'][value='"+list[0][8]+"']").attr("checked",true);					$("#time1").html(list[0][3]);
					$('#article-title').val(list[0][1]);
					var  article_content = '';
					//对编辑器的操作最好在编辑器ready之后再做
					editor.ready(function() {				   
					    //插入html内容，返回: <p>hello</p>
					    editor.setContent(list[0][2], true);
					});
					$("input[name='keywords']").val(list[0][4]);
					
					$("input[name='tags']").val(list[0][6]);
					$("input[name='time1']").val(list[0][3]);
					$("textarea[name='describe']").val(list[0][9]);
					imgUrlOrd=(list[0][5]);
					showPhoto(list[0][5]);
				}
			});
	}
}
function updateArticle(){
	var id = user_id;
	console.log("user_id "+id);
	var column_id = $("input[name='category']:checked").val();
	var state = $("input[name='visibility']:checked").val();
	var nowTime =  $("input[name='time1']").val();
	var  article_title  = $('#article-title').val();
	var  article_content = '';
	//对编辑器的操作最好在编辑器ready之后再做
	editor.ready(function() {
	   
	    //获取html内容，返回: <p>hello</p>
	    article_content += editor.getContent();
	});
	var keywords = $("input[name='keywords']").val();
	var describe = $("input[name='describe']").val();
	var tags = $("input[name='tags']").val();
	if(imgUrl==""){
		imgUrl=imgUrlOrd;
	}
	console.log("describe"+describe+
	    	"keywords"+keywords+
	    	"article_content"+article_content+
	    	"article_title"+article_title+
	    	"nowTime"+nowTime+
	    	"column_id"+column_id+
	    	"tags"+tags+
	    	"user_id"+id+
	    	"state"+state+
	    	"imgUrl"+imgUrl);
	$.ajax({
	    type: "POST",
	   //url: "insertArticle.do", 
	    dataType: "json",
	    data:{
	    	"describe":describe,
	    	"keywords":keywords,
	    	"article_content":article_content,
	    	"article_title":article_title,
	    	"nowTime":nowTime,
	    	"column_id":column_id,
	    	"tags":tags,
	    	"user_id":id,
	    	"state":state,
	    	"imgUrl":imgUrl
	    },
	    success:function(data){	
	    	var result = data.result;
	    	if(result==true){
	    		toastr.success("修改成功","文章");
	    	}else{
	    		toastr.error("修改失败","文章");
	    	}
	    	
	    },
	    error:function(data){
	    	console.log(data);
	    	toastr.error("连接服务器失败","文章");
	    }
	});
}

</script>
</body>
</html>