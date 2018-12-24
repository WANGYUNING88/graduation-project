package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.User;
import com.studynotes.manager.dao.UserDao;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public List<User> selectAllUser(){
		return userDao.selectAllUser();
	}
	public User login(User user) {
		return userDao.login(user);
	}
	public Integer insert(User user) {
		return userDao.insert(user);
	}
	public boolean update(User user) {
		return userDao.update(user);
	}
	public boolean delete(Integer user_id) {
		return userDao.delete(user_id);
	}
}
