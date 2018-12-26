package com.studynotes.manager.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.common.bean.AdminInfo;
import com.common.bean.AdminLogin;
import com.common.bean.ColumnInfo;
import com.common.util.CommonUtil;
import com.studynotes.manager.service.AdminService;


@Controller
@RequestMapping("/manager")
public class AdminAction {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/index")
	public String index( ) {
		return "index";
	}
	
	/*
	 * 登录
	 */
	@RequestMapping("/adminLogin")
	@ResponseBody 
	public void login(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_name = request.getParameter("username");//获取adminname
		String admin_password = request.getParameter("userpwd");//获取userpwd
		adminInfo.setAdmin_name(admin_name);
		adminInfo.setAdmin_password(admin_password);
		AdminInfo adminLogined = adminService.selectAdminInfo(adminInfo);
		System.out.println("登录admin获取的参数"+"admin_name"+admin_name+"admin_password"+admin_name);
		session.setAttribute("adminLoginIng", adminLogined);
		int result = 0;
		/*
		 * 判断AminLogin表中是否有数据；
		 * 有：修改
		 * 没有：添加
		 */
		if(adminLogined!=null) {
			result = adminLogined.getAdmin_id();
			AdminLogin adminLogin = adminService.selectAminLogin(result);
			if(adminLogin!=null) {
				AdminLogin adminLoginIng = new AdminLogin();
				adminLoginIng.setAdmin_id(result);
				adminLoginIng.setAdmin_login_count(adminLogin.getAdmin_login_count()+1);
				adminLoginIng.setAdmin_login_date(CommonUtil.getNowTime());
				adminLoginIng.setAdmin_logined_date(adminLogin.getAdmin_login_date());
				adminLoginIng.setAdmin_login_ip(CommonUtil.getIp(request));
				adminLoginIng.setAdmin_logined_ip(adminLogin.getAdmin_login_ip());
				boolean result2 = adminService.updateAdminLogin(adminLoginIng);
				if(!result2) {
					result=0;
				}
			}else {
				AdminLogin adminLoginIng = new AdminLogin();
				adminLoginIng.setAdmin_id(result);
				adminLoginIng.setAdmin_login_count(1);
				adminLoginIng.setAdmin_login_date(CommonUtil.getNowTime());			
				adminLoginIng.setAdmin_login_ip(CommonUtil.getIp(request));
				boolean result2 = adminService.insertAdminLogin(adminLoginIng);
				if(!result2) {
					result=0;
				}
			}
			
		}
		
		try {
			PrintWriter pw = response.getWriter();
			pw.write("{\"result\":"+result+"}");
		} catch (IOException e) {	
			e.printStackTrace();
		}
		
	}
	/*
	 * 根据adminid查询信息
	 */
	@RequestMapping("/selectAdminInfo")
	@ResponseBody 
	public void selectAdminInfo (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_id = request.getParameter("admin_id");//获取adminname
		int adminId =Integer.parseInt(admin_id);
		AdminInfo adminLogined = adminService.selectAdminInfoById(adminId);
		
		
		try {
			PrintWriter pw = response.getWriter();
			pw.write("{\"result\":"+adminLogined+"}");
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	/*
	 * 根据adminloginid查询登录信息
	 */
	@RequestMapping("/selectAdminLogin")
	@ResponseBody 
	public void selectAdminLogin (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_id = "0";
		admin_id = request.getParameter("admin_id");//获取admin_id
		int adminId =Integer.parseInt(admin_id);
		AdminLogin adminLogined = new AdminLogin();
		adminLogined = adminService.selectAminLogin(adminId);
		
		System.out.println(adminLogined.getAdmin_login_count());
		String json ="{\"count\":"+adminLogined.getAdmin_login_count()+","
					+"\"date\":" +"\""+adminLogined.getAdmin_logined_date()+"\""+","
		+"\"ip2\":"+"\"" +adminLogined.getAdmin_login_ip()+"\""+","
		+"\"ip1\":"+"\"" +adminLogined.getAdmin_logined_ip()+"\""+"}";
		System.out.println(json);
		
		
		//string = "{\"count\":23,\"date\":\"2018-12-18 17:14:01\",\"ip\":\"0:0:0:0:0:0:0:1\"}"
		try {
			PrintWriter pw = response.getWriter();
			pw.write(json);
					
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	/*
	 * 查询全部管理员
	 */
	@RequestMapping("/selectAllAdminInfo")
	@ResponseBody 
	public void seletctAllAdminInfo (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		List<AdminInfo> list = new ArrayList<AdminInfo>();
		String code = request.getParameter("code");//获取admin_id
		int flag =Integer.parseInt(code);
		list = adminService.selectAllAdminInfo();
		System.out.println("/**flag**/+flag");
		String json = "";
		if(flag==0) {
			json ="{\"result\":"+list.size()+"}";
		}else if(flag==1){
			json = "{\"result\":"+list+"}";
		}
		
		System.out.println(json);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.write(json);
					
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateAdminInfo")
	@ResponseBody 
	public void updateAdminInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		AdminInfo adminInfo = new AdminInfo();
		//获取参数
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("eamil");
		String password = request.getParameter("password");
		String cn = request.getParameter("cn");
		System.out.println("修改admin获取的参数"+"id： "+id+"name "+name+"email "+email+"cn "+cn);
		boolean result =false;
		if(id!="") {
			int admin_id = Integer.valueOf(id);
			adminInfo.setAdmin_cn(cn);
			adminInfo.setAdmin_id(admin_id);
			adminInfo.setAdmin_email(email);
			adminInfo.setAdmin_name(name);
			adminInfo.setAdmin_password(password);
			 result = adminService.updateAdmin(adminInfo);
		}
		if(result==true) {
			session.removeAttribute("adminLoginIng");
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
	
	@RequestMapping("/quitAdminInfo")
	@ResponseBody 
	public void quitAdminInfo(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		session.removeAttribute("adminLoginIng");
		JSONObject json = new JSONObject();
		
		json.put("result", true);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
	/*
	 * 重置密码
	 */
	@RequestMapping("/selectResetting")
	@ResponseBody 
	public void selectResetting(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		AdminInfo adminInfo = new AdminInfo();
		//获取参数
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String cn = request.getParameter("cn");
		System.out.println("重置密码获取的参数"+"name "+name+"email "+email+"cn "+cn);
		boolean result =false;
		String msg = "";
		adminInfo.setAdmin_cn(cn);
		adminInfo.setAdmin_email(email);
		adminInfo.setAdmin_name(name);
		AdminInfo admin = adminService.selectResetting(adminInfo);
		if(admin!=null){
			msg+="管理员身份验证成功！";
			boolean emailFlag =  CommonUtil.sendEmail(1,email,admin.getAdmin_id());
			if(emailFlag==true){
				result = true;
				msg+="验证邮件已发送至"+email;
			}else {
				msg+="验证邮件发送失败       \n请联系超级管理员更换邮箱，或密码";
			}
		}else{
			msg+="未找到该管理员，请填写正确的信息！";
		}

	
		JSONObject json = new JSONObject();
		json.put("result", result);
		json.put("msg", msg);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
	/*
	 * 重置密码
	 */
	@RequestMapping("/resettingPassword")
	public String resettingPassword(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String num = CommonUtil.getNowTimeNum();
		BigInteger newTime = new BigInteger(num);
		
		//获取参数
		String admin_id = request.getParameter("admin_id");
		int adminId = Integer.parseInt(admin_id);
		String oldNum = request.getParameter("num");
		BigInteger oldTime = new BigInteger(oldNum);
		
		System.out.println("重置密码从密码获取的参数"+"admin_id "+admin_id+"oldNum "+oldNum+"newTime "+newTime);
		boolean result =false;
		
		BigInteger time = new BigInteger("600");
		AdminInfo admin = adminService.selectAdminInfoById(adminId);
		admin.setAdmin_password("123456");
		if(time.compareTo(oldTime.subtract(newTime))>=0) {
			result = adminService.updateAdmin(admin);

			if(result ==true) {
				
				CommonUtil.sendEmail(2, admin.getAdmin_email(), adminId);
			}else {
				CommonUtil.sendEmail(3, admin.getAdmin_email(), adminId);
			}
		}else {
			CommonUtil.sendEmail(4, admin.getAdmin_email(), adminId);
		}
		return "result";
	}
//	@RequestMapping("/adminRegister")
//	public String register(AdminInfo admin,Model model) {
//		boolean result = adminService.register(admin);
//		if(result) {
//			model.addAttribute("errorMsg", "管理员添加成功");
//			return "Backstage";
//		}else {
//			model.addAttribute("errorMsg", "管理员添加失败");
//			return "Backstage";
//		}
//	}
//	@RequestMapping("/adminUpdate")
//	public String update(AdminInfo admin,Model model) {
//		boolean result = adminService.update(admin);
//		if(result) {
//			model.addAttribute("errorMsg", "管理员修改成功");
//			return "Backstage";
//		}else {
//			model.addAttribute("errorMsg", "管理员修改失败");
//			return "Backstage";
//		}
//	}
}
