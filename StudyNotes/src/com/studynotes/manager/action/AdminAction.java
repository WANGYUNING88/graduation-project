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
	 * ��¼
	 */
	@RequestMapping("/adminLogin")
	@ResponseBody 
	public void login(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_name = request.getParameter("username");//��ȡadminname
		String admin_password = request.getParameter("userpwd");//��ȡuserpwd
		adminInfo.setAdmin_name(admin_name);
		adminInfo.setAdmin_password(admin_password);
		AdminInfo adminLogined = adminService.selectAdminInfo(adminInfo);
		System.out.println("��¼admin��ȡ�Ĳ���"+"admin_name"+admin_name+"admin_password"+admin_name);
		session.setAttribute("adminLoginIng", adminLogined);
		int result = 0;
		/*
		 * �ж�AminLogin�����Ƿ������ݣ�
		 * �У��޸�
		 * û�У����
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
	 * ����adminid��ѯ��Ϣ
	 */
	@RequestMapping("/selectAdminInfo")
	@ResponseBody 
	public void selectAdminInfo (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_id = request.getParameter("admin_id");//��ȡadminname
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
	 * ����adminloginid��ѯ��¼��Ϣ
	 */
	@RequestMapping("/selectAdminLogin")
	@ResponseBody 
	public void selectAdminLogin (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		AdminInfo adminInfo = new AdminInfo();
		String admin_id = "0";
		admin_id = request.getParameter("admin_id");//��ȡadmin_id
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
	 * ��ѯȫ������Ա
	 */
	@RequestMapping("/selectAllAdminInfo")
	@ResponseBody 
	public void seletctAllAdminInfo (HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		List<AdminInfo> list = new ArrayList<AdminInfo>();
		String code = request.getParameter("code");//��ȡadmin_id
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
		//��ȡ����
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("eamil");
		String password = request.getParameter("password");
		String cn = request.getParameter("cn");
		System.out.println("�޸�admin��ȡ�Ĳ���"+"id�� "+id+"name "+name+"email "+email+"cn "+cn);
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
	 * ��������
	 */
	@RequestMapping("/selectResetting")
	@ResponseBody 
	public void selectResetting(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		AdminInfo adminInfo = new AdminInfo();
		//��ȡ����
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String cn = request.getParameter("cn");
		System.out.println("���������ȡ�Ĳ���"+"name "+name+"email "+email+"cn "+cn);
		boolean result =false;
		String msg = "";
		adminInfo.setAdmin_cn(cn);
		adminInfo.setAdmin_email(email);
		adminInfo.setAdmin_name(name);
		AdminInfo admin = adminService.selectResetting(adminInfo);
		if(admin!=null){
			msg+="����Ա�����֤�ɹ���";
			boolean emailFlag =  CommonUtil.sendEmail(1,email,admin.getAdmin_id());
			if(emailFlag==true){
				result = true;
				msg+="��֤�ʼ��ѷ�����"+email;
			}else {
				msg+="��֤�ʼ�����ʧ��       \n����ϵ��������Ա�������䣬������";
			}
		}else{
			msg+="δ�ҵ��ù���Ա������д��ȷ����Ϣ��";
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
	 * ��������
	 */
	@RequestMapping("/resettingPassword")
	public String resettingPassword(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String num = CommonUtil.getNowTimeNum();
		BigInteger newTime = new BigInteger(num);
		
		//��ȡ����
		String admin_id = request.getParameter("admin_id");
		int adminId = Integer.parseInt(admin_id);
		String oldNum = request.getParameter("num");
		BigInteger oldTime = new BigInteger(oldNum);
		
		System.out.println("��������������ȡ�Ĳ���"+"admin_id "+admin_id+"oldNum "+oldNum+"newTime "+newTime);
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
//			model.addAttribute("errorMsg", "����Ա��ӳɹ�");
//			return "Backstage";
//		}else {
//			model.addAttribute("errorMsg", "����Ա���ʧ��");
//			return "Backstage";
//		}
//	}
//	@RequestMapping("/adminUpdate")
//	public String update(AdminInfo admin,Model model) {
//		boolean result = adminService.update(admin);
//		if(result) {
//			model.addAttribute("errorMsg", "����Ա�޸ĳɹ�");
//			return "Backstage";
//		}else {
//			model.addAttribute("errorMsg", "����Ա�޸�ʧ��");
//			return "Backstage";
//		}
//	}
}
