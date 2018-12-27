
function getTimeQuantum(){
	now = new Date(),hour = now.getHours() 
	if(hour < 6){return("凌晨好！")} 
	else if (hour < 9){return("早上好！")} 
	else if (hour < 12){return("上午好！")} 
	else if (hour < 14){return("中午好！")} 
	else if (hour < 17){return("下午好！")} 
	else if (hour < 19){return("傍晚好！")} 
	else if (hour < 22){return("晚上好！")} 
	else {return("夜里好！")} 
}
/*
 * 获取系统的版本
 */
function getSystem(){
var version = navigator.userAgent;
	console.log(version);
//"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3223.0 Safari/537.36" 
	if(version.indexOf("Windows NT 5")!=-1) { 
	    return("Windows XP");
	}else if(version.indexOf("Windows NT 7")!=-1){
	    return("Windows 7");
	}else if(version.indexOf("Windows NT 10")!=-1){
	    return("Windows 10");
	}
}

/*
 * 验证有无特殊字符
 */
function checkString(text){
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
   
	if(pattern.test(text)){
		return true;
	}else{
		return false;
	}
	
}
/*
 * 验证邮箱格式
 */
function checkEmail(myemail){
	var myReg= 
		 new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式

	if(myReg.test(myemail)){
			return true;
		}else{
			return false;
		}
	}

/*
 

* 获取浏览器
 */
function getLiuLanQi(){
		var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

        //以下进行测试
        if (Sys.ie) document.write('IE: ' + Sys.ie);
        if (Sys.firefox) document.write('Firefox: ' + Sys.firefox);
        if (Sys.chrome) document.write('Chrome: ' + Sys.chrome);
        if (Sys.opera) document.write('Opera: ' + Sys.opera);
        if (Sys.safari) document.write('Safari: ' + Sys.safari);

        function getBrowserInfo(){
            var Sys = {};
            var ua = navigator.userAgent.toLowerCase();
            var re =/(msie|firefox|chrome|opera|version).*?([\d.]+)/;
            var m = ua.match(re);
            Sys.browser = m[1].replace(/version/, "'safari");
            Sys.ver = m[2];
            return Sys;
        }
   
       //获取当前的浏览器信息
       var sys = getBrowserInfo();
       //sys.browser得到浏览器的类型，sys.ver得到浏览器的版本
    
       return sys.browser + " " + sys.ver;
       
}      
       
       
       

       function Trim(str,is_global)

       {

           var result;

           result = str.replace(/(^\s+)|(\s+$)/g,"");

           if(is_global.toLowerCase()=="g")

           {

               result = result.replace(/\s/g,"");

            }

           return result;

       }
       
       function yanZheng(){
    	 
    	   
    	 
    	   $("#adminCn").keyup(function(){
    			var text = $("#adminCn").val();
    			var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\]. <>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
    			var result = text.match(pattern);
    			if (result){
    				yanzheng=1; 
		    	 	toastr.warning("检测到姓名中包含特殊字符！");	
		    	 	
    			}else{
    				yanzheng=0;
    			}
    			
    		}).change(function(){
    			var text = $("#adminCn").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	text = Trim(text,"g");
    		    	$("#adminCn").val(text);
    		    	toastr.warning("检测到姓名中包含空格，已删除空格!");
    			}	
    			
    		}) ;
    		$("#adminName").keyup(function(){
    			var text = $("#adminName").val();
    			var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\]. <>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
    			var result = text.match(pattern);
    			if (result){
    				yanzheng=1; 
		    	 	toastr.warning("检测到用户名中包含特殊字符！");	
		    	 	
    			}else{
    				yanzheng=0;
    			}
    			
    		}).change(function(){
    			var text = $("#adminName").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	text = Trim(text,"g");
    		    	$("#adminName").val(text);
    		    	toastr.warning("检测到用户名中包含空格，已删除空格!");
    			}	
    			
    		}) ;
    		$("#old_password").keyup(function(){
    			var text = $("#old_password").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	yanzheng=1; 
    		    	 	toastr.warning("检测到旧密码中包含空格");	
    			}else{
    				yanzheng=0;
    			}
    		}).change(function(){
    			var text = $("#old_password").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {

    			}else{

    				var textOld = $('#admin_password').val();
    				if(textOld==text){
    					yanzheng=0;
    					toastr.info("旧密码验证成功");
    				}else{
    					yanzheng=1; 
    		    	 	toastr.warning("旧密码不正确");	
    		    	 	
    		    	 	console.log(textOld);
    				}
    			}
    		    
    				
    			
    		});
    		$("#password").keyup(function(){
    			var text = $("#password").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	yanzheng=1;
    		    	toastr.warning("检测到密码中包含空格");		   
    			}else{
    				yanzheng=0;
    			}
    		   
    		}).change(function(){
    			 var textNew= $("#new_password").val();
    			 var text = $("#password").val();
    			 var textOld = $('#admin_password').val();
    			 if(textOld!=text){
	    		    if(textNew!=''){
	    		    	if(textNew!=text){
	    		    		yanzheng=1;
	    		    		toastr.warning("两次密码不一致");		   
		    			}else{
		    				yanzheng=0;
		    				toastr.info("两次密码一致");
		    			}
	    		    }
    			 }else{
    				 toastr.warning("与原密码重复");	
    			 }
    		});
    		$("#new_password").keyup(function(){
    			var text = $("#new_password").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	yanzheng=1;
    		    	toastr.warning("检测到新密码中包含空格");		   
    			}else{
    				yanzheng=0;
    			}
    		    
    		}).change(function(){
    			var text = $("#new_password").val();
    			var textOld = $("#password").val();
    		    if(textOld!=''){
    		    	if(textOld!=text){
    		    		yanzheng=1;
    		    		toastr.warning("两次密码不一致");		   
	    			}else{
	    				yanzheng=0;
	    				toastr.info("两次密码一致");
	    			}
    		    }
    		});
    		
    		$('#adminEamil').change(function(){
    			var text = $("#adminEamil").val();
    			var patt1 = new RegExp(/\s+/g);
    		    if (patt1.test(text)) {
    		    	text = Trim(text,"g");
    		    	$("#adminEamil").val(text);
    		    	toastr.warning("检测到邮箱中包含空格，已删除空格!");
    			}	
    			
    		}) ;
    	    
       }
       /*登录*/
   	function login(){
   		var name = $('#loginModalUserNmae').val();
   		var password = $('#loginModalUserPwd').val();
   		$.ajax({
   			dataType:"json",
   			data:{
   				"name":name,
   				"password":password
   			},
   			type:"POST",
   			url:"userLogin.do",
   			success:function(data){
   				var result = data.result;
   				if(result == true){
   					toastr.success('登录成功');
    				   setTimeout("window.location.href ='index.jsp'",500);
   				}else{
   					toastr.error("登录失败");
   				}
   			},
   			error:function(data){
   				toastr.error("请求发送失败");
   				console.log(data);
   			}
   		});
   	}
    /*验证邮箱*/
    function yanzhengEmail(){
   	 var email = $('#registerModalUserEmail').val();
   	 if(email!=''){
   		 if(checkEmail(email)==true){
   			 
   		 }else{
   			 toastr.waring("邮箱格式不正确");
   		 }
   	 }else{
   		 toastr.waring("邮箱必填");
   	 }
    }
   	/*退出*/
   	
   	
   	function quit(){
   		if(window.confirm("退出登录，是否确认？")){
   			$.ajax({
   				dataType:"json",
   				data:{},
   				type:'POST',
   				url:"userLoginOut.do",
   				success:function(data){
   					var result =  data.result;
   					if(result == true){
   						toastr.success('退出成功');
   	 				   setTimeout("window.location.href ='index.jsp'",500);
   					}else{
   						toastr.error("退出失败");
   					}
   				},
   				error:function(date){
   					console.log(data);
   				}
   			});
   		}
   	}
   	
   	
   	function update(){
   		var updateModalUserNmae = $('#registerModalUserNmae').val();
   		var updateModalUserCn = $('#updateModalUserCn').val();
   		var updateModalUserPwd3 = $('#registerModalUserPwd3').val();
   		var updateModalUserId = $('#updateModalUserId').val();
   		var updateModalUserEmail = $('#registerModalUserEmail').val();
   		$.ajax({
				dataType:"json",
				data:{
					"id":updateModalUserId,
					"name":registerModalUserNmae,
					"cn":updateModalUserCn,
					"password":registerModalUserPwd2,
					"email":registerModalUserEmail
				},
				type:'POST',
				url:"userUpdate.do",
				success:function(data){
					var result =  data.result;
					if(result == true){
						toastr.success('修改成功,正在注销');
						quit();
					}else{
						toastr.error("修改失败");
					}
				},
				error:function(date){
					console.log(data);
				}
   		});
   	}
   	function register(){
   		var registerModalUserNmae = $('#registerModalUserNmae').val();
   		var registerModalUserCn = $('#registerModalUserCn').val();
   		var registerModalUserPwd1 = $('#registerModalUserPwd1').val();
   		var registerModalUserPwd2 = $('#registerModalUserPwd2').val();
   		var registerModalUserEmail = $('#registerModalUserEmail').val();	
   		if(registerModalUserPwd1==registerModalUserPwd2){
   			$.ajax({
   				dataType:"json",
   				data:{
   					"name":registerModalUserNmae,
   					"cn":registerModalUserCn,
   					"password":registerModalUserPwd2,
   					"email":registerModalUserEmail
   				},
   				type:'POST',
   				url:"userInsert.do",
   				success:function(data){
   					var result =  data.result;
   					if(result == true){
   						toastr.success('注册成功');
   	 				   
   					}else{
   						toastr.error("注册失败");
   					}
   				},
   				error:function(date){
   					console.log(data);
   				}
   			});
   		}
   	}