package com.studynotes.manager.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.bean.AdminInfo;
import com.common.bean.AdminLogin;

@Repository
public class AdminDao {
	@Autowired
	private SessionFactory sessionFactory;
	/*
	 * 重置密码
	 * 查询用户
	 */
	public AdminInfo selectResetting(AdminInfo admin) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from AdminInfo "
				+ "where admin_name=? and admin_cn=? and admin_email=?";
		Query query = session.createQuery(sql);
		query.setParameter(0, admin.getAdmin_name());
		query.setParameter(1, admin.getAdmin_cn());
		query.setParameter(2, admin.getAdmin_email());
		AdminInfo adminLogined = (AdminInfo)query.uniqueResult();
		
		
		return adminLogined;
	}
	/*
	 * 登录 查询用户
	 *admin_id admin_password
	 * 
	 */
	public AdminInfo selectAdminInfo(AdminInfo admin) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from AdminInfo "
				+ "where admin_name=? and admin_password=?";
		Query query = session.createQuery(sql);
		query.setParameter(0, admin.getAdmin_name());
		query.setParameter(1, admin.getAdmin_password());
		AdminInfo adminLogined = (AdminInfo)query.uniqueResult();
		
		
		return adminLogined;
	}
	/*
	 * 登录 查询用户登录记录
	 * 
	 */
	public AdminLogin selectAminLogin(int admin_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from AdminLogin "
				+ "where admin_id=?";
		Query query = session.createQuery(sql);
		query.setParameter(0,admin_id);
		AdminLogin adminLogined = (AdminLogin)query.uniqueResult();
		
		
		return adminLogined;
	}
	/*
	 * 登录 修改用户登录记录
	 * 
	 */
	public boolean updateAdminLogin(AdminLogin adminLogin) {
		Session session = sessionFactory.getCurrentSession();
		int result = 0;
		Query query = session.createQuery("update AdminLogin a "
				+ "set a.admin_logined_date=? ,a.admin_logined_ip=?, "
				+ " a.admin_login_count=?, a.admin_login_date=? ,a.admin_login_ip=?"
				+ "where a.admin_id=?");
		query.setParameter(0, adminLogin.getAdmin_logined_date());
		query.setParameter(1, adminLogin.getAdmin_logined_ip());
		query.setParameter(2, adminLogin.getAdmin_login_count());
		query.setParameter(3, adminLogin.getAdmin_login_date());
		query.setParameter(4, adminLogin.getAdmin_login_ip());
		query.setParameter(5, adminLogin.getAdmin_id());
		result = query.executeUpdate();
		
		if(result>0)
			return true;
		else
			return false;
	}
	/*
	 * 登录 插入用户登录记录
	 * 第一次登录
	 * 
	 */
	public boolean insertAdminLogin(AdminLogin adminLogin) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int result = 0;
		String sql =" INSERT into AdminLogin(admin_id,admin_login_count,admin_login_date,admin_login_ip) " + 
				"VALUES(?,?,?,?)";
		Query query = session.createQuery(sql);

		query.setParameter(1, adminLogin.getAdmin_login_count());
		query.setParameter(2, adminLogin.getAdmin_login_date());
		query.setParameter(3, adminLogin.getAdmin_login_ip());
		query.setParameter(0, adminLogin.getAdmin_id());
		result = query.executeUpdate();
		
		if(result>0)
			return true;
		else
			return false;
		
	}
	
	/*
	 * 查询用户信息
	 *admin_id
	 * 
	 */
	public AdminInfo selectAdminInfoById(int  admin_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from AdminInfo "
				+ "where admin_id=?";
		Query query = session.createQuery(sql);
		query.setParameter(0, admin_id);
		AdminInfo adminLogined = (AdminInfo)query.uniqueResult();
		
		
		return adminLogined;
	}
	/*
	 * 查询全部管理员
	 */
	public List<AdminInfo> selectAllAdminInfo(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from AdminInfo";
		Query query = session.createQuery(hql);
		List<AdminInfo> list = query.list();
		return list;
	}
	/*
	 * 修改管理员
	 */
	
	
	public boolean updateAdmin(AdminInfo adminInfo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		AdminInfo admin = session.get(AdminInfo.class, adminInfo.getAdmin_id());
		admin.setAdmin_email(adminInfo.getAdmin_email());
		admin.setAdmin_cn(adminInfo.getAdmin_cn());
		admin.setAdmin_name(adminInfo.getAdmin_name());
		admin.setAdmin_password(adminInfo.getAdmin_password());
		try {
			session.save(admin);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	
	}
	
	/******************************************/
	
	public boolean update(AdminInfo admin) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("update Admin a set a.admin_name=? ,a.admin_password=? where a.admin_id=?");
		query.setParameter(0, admin.getAdmin_name());
		query.setParameter(1, admin.getAdmin_password());
		query.setParameter(2, admin.getAdmin_id());
		query.executeUpdate();
		session.close();
		return true;
	}
}
