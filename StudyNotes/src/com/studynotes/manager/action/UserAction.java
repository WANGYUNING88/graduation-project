package com.studynotes.manager.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.bean.User;
import com.studynotes.manager.service.UserService;

@Controller
public class UserAction {
	@Autowired
	private UserService userService;
	
	/*
	 * 用户登录
	 */
	@RequestMapping("/userLogin")
	public String userLogin(User user,HttpSession session) {
		User userLogin = userService.login(user);
		if(userLogin!=null) {
			session.setAttribute("user", userLogin);
			return "redirect:/selectAllBook.do?id=2";
		}else {
//			model.addAttribute("user", userLogin);
			return "index";
		}
	}
	/*
	 * 用户注销
	 */
	@RequestMapping("/userLoginOut")
	 public String loginOut(HttpServletRequest request,HttpSession session) {
		session.invalidate(); 
		return "redirect:/selectAllBook.do?id=2";
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
