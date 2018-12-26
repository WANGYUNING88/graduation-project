package com.common.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="admin_info")
public class AdminInfo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="admin_id")
	private Integer admin_id;
	@Column(name="admin_name")
	private String admin_name;
	@Column(name="admin_password")
	private String admin_password;
	@Column(name="admin_email")
	private String admin_email;
	@Column(name="admin_cn")
	private String admin_cn;
	@Column(name="admin_level")
	private Integer admin_level;
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public Integer getAdmin_level() {
		return admin_level;
	}
	public void setAdmin_level(Integer admin_level) {
		this.admin_level = admin_level;
	}
	public String getAdmin_cn() {
		return admin_cn;
	}
	public void setAdmin_cn(String admin_cn) {
		this.admin_cn = admin_cn;
	}
	
	
	
	
	
}
