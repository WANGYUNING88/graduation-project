package com.studynotes.manager.dao;

import java.util.List;

import org.apache.commons.mail.Email;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.bean.EmailInfo;
import com.common.bean.User;
@Repository
public class UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	/*
	 * 检索全部USER
	 */
	public List<User> selectAllUser(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}
	/*
	 * 登录验证
	 */
	public User login(User user) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where user_name=? and user_password=?";
		Query query = session.createQuery(hql);
	    query.setParameter(0, user.getUser_name());
	    query.setParameter(1, user.getUser_password());
	    User usered = (User)query.uniqueResult();
	    return usered;
	}
	
	/*
	 * 注册
	 */
	public boolean insert(User user) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}

	}
	/*
	 * 修改信息
	 */
	public boolean update(User user) {
		Session session = sessionFactory.getCurrentSession();
		User usered = session.get(User.class, user.getUser_id());
		usered.setUser_name(user.getUser_name());
		usered.setUser_password(user.getUser_password());
		usered.setUser_email(user.getUser_email());
		usered.setUser_cn(user.getUser_cn());
		try {
			session.update(usered);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	}
	/*
	 * 销户
	 */
	public boolean delete(Integer user_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from User where user_id=?");
		query.setParameter(0, user_id);
		int r = query.executeUpdate();
		if(r>0) {
			return true;
		}else {
			return false;
		}
	}
	/*
	 * 邮箱查询
	 * @address
	 */
	public EmailInfo selectEmailByAddress(EmailInfo email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Email where email_address=?";
		Query query = session.createQuery(hql);
	    query.setParameter(0, email.getEmail_address());
	    EmailInfo e = (EmailInfo) query.uniqueResult();
	    return e;
	}
	/*
	 * 邮箱查询
	 * @address state
	 */
	public EmailInfo selectEmailByAddressAndState(EmailInfo email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Email where email_address=? and email_state='Y";
		Query query = session.createQuery(hql);
	    query.setParameter(0, email.getEmail_address());
	    EmailInfo e = (EmailInfo) query.uniqueResult();
	    return e;
	}
//	/*
//	 * 插入
//	 */
//	public EmailInfo selectEmailByAddressAndState(EmailInfo email) {
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from Email where email_address=? and email_state='Y";
//		Query query = session.createQuery(hql);
//	    query.setParameter(0, email.getEmail_address());
//	    EmailInfo e = (EmailInfo) query.uniqueResult();
//	    return e;
//	}
	/*
	 * 分页显示
	 * 检索全部USER
	 */
//	public List<User> selectAllUserByPage(Page page){
//		Session session = sessionFactory.getCurrentSession();
//		String hql = "from User limit ?,?";
//		Query query = session.createQuery(hql);
//		query.setParameter(0, (page.getDpage()-1)*page.getPagecount());
//		query.setParameter(1, page.getPagecount());
//		List<User> list = query.list();
//		return list;
//	}
	
}
