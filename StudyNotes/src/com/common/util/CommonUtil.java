package com.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.HtmlEmail;
import org.apache.tomcat.util.codec.binary.StringUtils;

public class CommonUtil {
	public static  int  RECORD = 8; 
	
	/*
	 * 	     ��ȡ��ǰʱ��
	 */
	
	public static String getNowTime() { 
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
        return df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
	}
	public static String getNowTimeNum() { 
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//�������ڸ�ʽ
        return df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
	}
	
	 public static String getIp(HttpServletRequest request) {
		 String ip = request.getHeader("x-forwarded-for"); 
	        
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {  
	            // ��η����������ж��ipֵ����һ��ip������ʵip
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
			 HtmlEmail email=new HtmlEmail();//����һ��HtmlEmailʵ������
			 email.setHostName("smtp.163.com");//�����SMTP��������һ��123�������smtp.123.com,qq����Ϊsmtp.qq.com
			 email.setCharset("utf-8");//���÷��͵��ַ�����
			 email.addTo(addressee);//�����ռ���
			 email.setFrom("15703286577@163.com","���˱ʼ�");//�����˵�����Ϊ�Լ��ģ��û������������
			 email.setAuthentication("15703286577@163.com","qq247197442");//���÷����˵���������û�������Ȩ��(��Ȩ�����Լ����õ�)
			 String num = getNowTimeNum();
			 String subject="";
			 String msg = "";
			 switch (type) {
			case 1:
				subject = "������������";
				msg ="����<a src='resettingPassword.do?admin_id="+admin_id+"&num="+num+"'>����</a>��������";
			
				break;
			case 2:
				subject = "������������";
				msg ="��������<font color='green'>�ɹ�</font>������<a src='index.do'>��¼</a>ҳ��";
			
				break;
			case 3:
				subject = "������������";
				msg ="��������<font color='red'>ʧ��</font>������<a src='index.do'>��¼</a>ҳ�棬��������";
			
				break;
			default:
				break;
			}
			
			 email.setSubject(subject);
			 email.setMsg(msg);
			 email.send();
			 return true;
			 
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	 }
	
}