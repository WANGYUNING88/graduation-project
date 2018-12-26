package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.AdminInfo;
import com.common.bean.AdminLogin;
import com.studynotes.manager.dao.AdminDao;


@Service
@Transactional
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	public AdminInfo selectAdminInfo(AdminInfo admin) {
		AdminInfo adminInfo = adminDao.selectAdminInfo(admin);
		return adminInfo ;
	}
	public AdminLogin selectAminLogin(int admin_id) {
		AdminLogin adminLogin = adminDao.selectAminLogin(admin_id);
		return adminLogin ;
	}
	public boolean updateAdminLogin(AdminLogin adminLogin) {
		boolean result = adminDao.updateAdminLogin(adminLogin);
		return result;
	}
	public boolean insertAdminLogin(AdminLogin adminLogin) {
		boolean result = adminDao.insertAdminLogin(adminLogin);
		return result;
	}
	public AdminInfo selectAdminInfoById(int  admin_id) {
		AdminInfo adminInfo = adminDao.selectAdminInfoById(admin_id);
		return adminInfo ;
	}
	public List<AdminInfo> selectAllAdminInfo(){
		List<AdminInfo> list = adminDao.selectAllAdminInfo();
		return list;
	}
	public boolean updateAdmin(AdminInfo adminInfo) {
		return adminDao.updateAdmin(adminInfo);
	}
	public AdminInfo selectResetting(AdminInfo admin) {
		return adminDao.selectResetting(admin);
	}
}
