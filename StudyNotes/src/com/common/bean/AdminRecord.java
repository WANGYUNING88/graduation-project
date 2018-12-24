package com.common.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="admin_record")
public class AdminRecord {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="admin_record_id")
	private Integer admin_record_id;
	@Column(name="admin_id")
	private Integer admin_id;
	@Column(name="admin_record_ip")
	private String admin_record_ip;
	@Column(name="admin_record_date")
	private String admin_record_date;
	public Integer getAdmin_record_id() {
		return admin_record_id;
	}
	public void setAdmin_record_id(Integer admin_record_id) {
		this.admin_record_id = admin_record_id;
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_record_ip() {
		return admin_record_ip;
	}
	public void setAdmin_record_ip(String admin_record_ip) {
		this.admin_record_ip = admin_record_ip;
	}
	public String getAdmin_record_date() {
		return admin_record_date;
	}
	public void setAdmin_record_date(String admin_record_date) {
		this.admin_record_date = admin_record_date;
	}

	
	
	
}
