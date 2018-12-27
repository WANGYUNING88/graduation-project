
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人学习笔记管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
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

<body class="user-select">
<div class="container">
  <div class="siteIcon"><img src="images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用个人学习笔记管理系统" draggable="false" /></div>
  <form  method="post" autocomplete="off" class="form-signin">
    <h2 class="form-signin-heading">管理员登录</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="username" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="18">
    <font color ="red" id="nameError">&nbsp;</font>
    <label for="userPwd" class="sr-only">密码</label>
    <input type="password" id="userPwd"  name="userpwd" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18">
    <font color ="red" id="pwdError" >&nbsp;</font>
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">登录</button>
  </form>
  <div class="footer">
    <p><a data-toggle="modal" data-target="#resetting" data-placement="left" title="忘记密码？">忘记密码？→</a></p>
  </div>
</div>
<!--个人信息模态框-->
<div class="modal fade" id="resetting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >重置</h4>
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
                <td width="80%"><input type="text"  class="form-control" id="userCn1" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text"  class="form-control" id="userName1" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">邮箱:</td>
                <td width="80%"><input type="text" class="form-control" id="userEmail1" maxlength="30" autocomplete="off" /></td>
              </tr>             
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary" onClick='subminResetting()'>提交</button>
        </div>
      </div>
   
  </div>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="build/toastr.min.js"></script>
<script type="text/javascript">

        toastr.options.positionClass = 'toast-bottom-right';
 </script>
<script src="js/common.js"></script>
<script>

$('[data-toggle="tooltip"]').tooltip();

window.oncontextmenu = function(){
	//return false;
};
$('.siteIcon img').click(function(){
	window.location.reload();
}); 

 window.onload =function()
    {
        document.getElementById("signinSubmit").setAttribute("disabled", true);

       
    };
$("#userPwd").mouseout(function(){
			
	            if($("#userName").val()==""||$("#userPwd").val()=="")
	            {
	            	
	                $("#signinSubmit").attr('disabled',true);
	            }else
	            {
	            	
	                $("#signinSubmit").attr('disabled',false);
	            	
	            }
			
        });
$("#userPwd").keyup(function(){
	var text = $("#userPwd").val();
	var patt1 = new RegExp(/\s+/g);
    if (patt1.test(text)) {
		$('#pwdError').text('密码含有空格');
	}else{
		$('#pwdError').html("&nbsp;");
	}
});
$("#userName").keyup(function(){
	var text = $("#userName").val();
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\]. <>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
	var result = text.match(pattern);
	if (result){
    	$('#nameError').text('用户名含有特殊字符');
    	$("#signinSubmit").attr('disabled',true);
     }else{
    	$("#signinSubmit").attr('disabled',false);
    	$('#nameError').html("&nbsp;");
     }
	
}).change(function(){
	var text = $("#userName").val();
	text = Trim(text,"g");
	$("#userName").val(text);
	$("#signinSubmit").attr('disabled',false);
	$('#nameError').html("&nbsp;");
}) 


$('#signinSubmit').click(function(){
	$("#signinSubmit").text('正在验证...');
	$("#signinSubmit").attr('disabled',true);
    $.ajax({
    	
        type: "POST",
        url: "adminLogin.do",
        data: {username:$("#userName").val(), userpwd:$("#userPwd").val()},
        dataType: "json",
        success: function(data){
                   var admin_id = data.result;
                   console.log("admin_id"+admin_id);
                   if(admin_id !=  0){
                	   toastr.success('登录成功');
    				   setTimeout("window.location.href ='index.jsp'",1000);
                	   
                   }
                   
                   $("#signinSubmit").attr('disabled',false);
                   $("#signinSubmit").text('登录');
                   if(admin_id ==0){
                	   toastr.error('登录失败');
                	   $('#nameError').text('用户名密码不匹配');
                   }
                   
                 }
    });
});

/*
 * 
 */

/*
 * cn[0] 0通过 1未通过
 */
	$("#userName1").change(function(){
		var text = $("#userName1").val();
		if(text!=''){
			text = Trim(text,"g");
			$("#userName1").val(text);
	    	
		}
	}) ;
	$("#userCn1").change(function(){
		var text = $("#userCn1").val();
		if(text!=''){
			text = Trim(text,"g");
			$("#userCn1").val(text);
	    	}
	});
	$("#userEmail1").change(function(){
		var text = $("#userEmail1").val();
		if(text!=''){
		text = Trim(text,"g");
		$("#userEmail1").val(text);		
		}
    	
	});
	function subminResetting(){
		var text0 = $("#userCn1").val();
		var text1 = $("#userName1").val();
		var text2 = $("#userEmail1").val();
		console.log("重置密码:"+text0+" "+text1+" "+text2);
		var r =0;
		var msg=''
		if(text0==''){
			r=1;
			msg+="姓名必填  \n";
		}
		if(text1==''){
			r=1;
			msg+="用户名必填  \n";
		}
		if(text0==''){
			r=1;
			msg+="邮箱必填  ";
		}
		if(r==0){
			var e =0;
			if(checkString(text0)==true){
				msg+="姓名含有特殊字符  </br>";
				e=1;
			}
			if(checkString(text1)==true){
				msg+="用户名名含有特殊字符  </br>";
				e=1;
			}
			if(checkEmail(text2)==false){
				msg+="邮箱格式错误  ";
				e=1;
			}
			if(e==0){
				$.ajax({
					dataType:'json',
					type:'POST',
					url:'selectResetting.do',
					data:{
						'cn':text0,
						'name':text1,
						'email':text2
					},
					success:function (data){
						var result = data.result;
						var msg = data.msg;
						if(result==true){
							toastr.success(msg,"发送成功");
						}else{
							toastr.error(msg,"发送失败");
						}
					}
				});
			}else{
				toastr.warning(msg);
			}
		}else{
			toastr.warning(msg);
		}
		
	}

</script>

</body>
</html>
