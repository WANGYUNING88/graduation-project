package com.common.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="admin_login")
public class AdminLogin {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="admin_login_id")
	private Integer admin_login_id;
	@Column(name="admin_id")
	private Integer admin_id;
	@Column(name="admin_login_ip")
	private String admin_login_ip;
	@Column(name="admin_logined_ip")
	private String admin_logined_ip;
	@Column(name="admin_login_count")
	private Integer admin_login_count;
	@Column(name="admin_logined_date")
	private String admin_logined_date;
	@Column(name="admin_login_date")
	private String admin_login_date;
	public Integer getAdmin_login_id() {
		return admin_login_id;
	}
	public void setAdmin_login_id(Integer admin_login_id) {
		this.admin_login_id = admin_login_id;
	}
	
	public String getAdmin_login_ip() {
		return admin_login_ip;
	}
	public void setAdmin_login_ip(String admin_login_ip) {
		this.admin_login_ip = admin_login_ip;
	}
	public String getAdmin_logined_ip() {
		return admin_logined_ip;
	}
	public void setAdmin_logined_ip(String admin_logined_ip) {
		this.admin_logined_ip = admin_logined_ip;
	}
	public Integer getAdmin_login_count() {
		return admin_login_count;
	}
	public void setAdmin_login_count(Integer admin_login_count) {
		this.admin_login_count = admin_login_count;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_logined_date() {
		return admin_logined_date;
	}
	public void setAdmin_logined_date(String admin_logined_date) {
		this.admin_logined_date = admin_logined_date;
	}
	public String getAdmin_login_date() {
		return admin_login_date;
	}
	public void setAdmin_login_date(String admin_login_date) {
		this.admin_login_date = admin_login_date;
	}
	
	
	 
	
	
	
	
}
