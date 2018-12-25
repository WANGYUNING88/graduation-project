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
       $('#liulanqi').html(sys.browser + " " + sys.ver);
       
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
       function updateAdmin(){
    	   var id = $('#admin_id').val();
    	   var cn = $('#adminCn').val();
    	   var name = $('#adminName').val();
    	   var eamil = $('#adminEamil').val();
    	   var old_password = $('#old_password').val();    	   
    	   var password = $('#password').val();
    	   var new_password = $('#new_password').val();
    	   console.log("修改admin"+"id:"+id+"cn:"+cn+"name:"+name);
    	   console.log("修改admin"+"old_password:"+old_password+"password:"+old_password+"new_password:"+new_password);
    	   if(yanzheng==0){
	    	   $.ajax({
	    		    type: "POST",
	    		    url: "updateAdminInfo.do", 
	    		    dataType: "json",
	    		    data:{
	    		    	"id":id,
	    		    	"cn":cn,
	    		    	"name":name,
	    		    	"eamil":eamil,
	    		    	"password":password
	    		    },
	    		  //  async: false, 
	    		    success:function(data){	
	    		  		var result = data.result;
	    		  		if(result==true){
							toastr.success('admin_id: '+id+'修改成功');
							quitAdmin();
						}else{
							toastr.error('admin_id: '+id+'修改成功');
						}
						console.log("修改用户"+result);
	    		             
	    		    },
	    		    error:function(xhr,state,errorThrown){
	    						//requesFail(xhr);
	    		   	 console.log(xhr);
	    			}
	    			
	    		
	    		  
	    		});
    	   }
       }
       function quitAdmin(){
    	   $.ajax({
    		   dataType:"json",
    		   url:"quitAdminInfo.do",
    		   type:"POST",
    		   success:function(data){
    			   var result = data.result;
    			   if(result==true){
    				   toastr.success('退出成功');
    				   setTimeout("window.location.href ='login.jsp'",1000);

    			   }else{
    				   toastr.error('退出失败');
    			   }
    		   }
    	   });
       }