package com.studynotes.manager.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.common.bean.User;
import com.studynotes.manager.service.UserService;

@Controller
@RequestMapping("/stage")
public class UserAction {
	@Autowired
	private UserService userService;
	
	/*
	 * 用户登录
	 */
	@RequestMapping("/userLogin")
	public void userLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		User user = new User();
		user.setUser_name(name);
		user.setUser_password(password);
		User userLogin = userService.login(user);
		boolean result =false;
		if(userLogin!=null) {
			session.setAttribute("userLogin", userLogin);
			result =true;
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
		try {
			PrintWriter pw = response.getWriter();
			pw.write(json.toJSONString());
			System.out.println(json.toJSONString());
		} catch (IOException e) {	
			e.printStackTrace();
		}
		
	}
	/*
	 * 用户注销
	 */
	@RequestMapping("/userLoginOut")
	 public void loginOut(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		session.removeAttribute("userLogin");
		JSONObject json = new JSONObject();
		json.put("result", true);
		try {
			
			PrintWriter pw = response.getWriter();
			pw.write(json.toJSONString());
			System.out.println(json.toJSONString());
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	/*
	 * 后台检索全部用户
	 */
	@RequestMapping("/selectAllUser")
	 public String selectAllUser(Model model) {
		List<User> userlist = userService.selectAllUser();
		model.addAttribute("userlist",userlist);
		return "allUser";
	}
	
}
