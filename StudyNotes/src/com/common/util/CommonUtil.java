package com.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.HtmlEmail;
import org.apache.tomcat.util.codec.binary.StringUtils;

public class CommonUtil {
	public static  int  RECORD = 8; 
	public static 
	String REALUPLOADPATH =
	"D:\\java\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\upload\\";
	/*
	 * 	     获取当前时间
	 */
	
	public static String getNowTime() { 
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return df.format(new Date());// new Date()为获取当前系统时间
	}
	public static String getNowTimeNum() { 
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        return df.format(new Date());// new Date()为获取当前系统时间
	}
	
	 public static String getIp(HttpServletRequest request) {
		 String ip = request.getHeader("x-forwarded-for"); 
	        
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {  
	            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
	            if( ip.indexOf(",")!=-1 ){
	                ip = ip.split(",")[0];
	            }
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("Proxy-Client-IP");  
	            	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("WL-Proxy-Client-IP");  
	            
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_CLIENT_IP");  
	            
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	           
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("X-Real-IP");  
	            
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getRemoteAddr();  
	           
	        } 
	        
	        return ip;  
	 }
	 public static boolean sendEmail(int type,String addressee,int admin_id) {
		 
		 
		 try {
			 HtmlEmail email=new HtmlEmail();//创建一个HtmlEmail实例对象
			 email.setHostName("smtp.163.com");//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
			 email.setCharset("utf-8");//设置发送的字符类型
			 email.addTo(addressee);//设置收件人
			 email.setSSL(true);
			 email.setFrom("15703286577@163.com","个人笔记");//发送人的邮箱为自己的，用户名可以随便填
			 email.setAuthentication("15703286577@163.com","qq247197442");//设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
			 String num = getNowTimeNum();
			 String subject="";
			 String msg = "";
			 msg+="<html lang='zh-CN'><head ><meta charset='utf-8'>"
					 + "</head><body>重置密码链接";


			 switch (type) {
			case 1:
				subject = "重置密码链接";
				msg +="<h1>请点击<a rel='external nofollow' target='_blank' href='http://localhost:8080/StudyNotes/manager/resettingPassword.do?admin_id="+admin_id+"&num="+num+"'>这里</a>重置密码</h1>";
				msg +="<font color='red'>（有效时间为10分钟）</font>";
			
				break;
			case 2:
				subject = "重置密码链接";
				msg +="<h1>重置密码<font color='green'>成功</font>，初始密码为123456，返回<a src='index.do'>登录</a>页面<h1>";
			
				break;
			case 3:
				subject = "重置密码链接";
				msg +="<h1>重置密码<font color='red'>失败</font>，返回<a src='index.do'>登录</a>页面，重新重置</h1>";
				msg+="原因:更新密码是出错！";
			
				break;
			case 4:
				subject = "重置密码链接";
				msg +="<h1>重置密码<font color='red'>失败</font>，返回<a src='index.do'>登录</a>页面，重新重置</h1>";
				msg+= "原因:链接超时！";
			
				break;
			default:
				break;
			}
			 msg+="</body></html>";
			 email.setSubject(subject);
			 email.setHtmlMsg(msg);
			 email.send();
			 return true;
			 
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	 }
	
}
