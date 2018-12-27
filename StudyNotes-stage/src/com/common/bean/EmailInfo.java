package com.common.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;



@Entity
@Table(name="email")
public class EmailInfo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="email_id")
	private Integer email_id;
	@Column(name="email_address")
	private String email_address;
	@Column(name="email_state")
	private String email_state;
	public Integer getEmail_id() {
		return email_id;
	}
	public void setEmail_id(Integer email_id) {
		this.email_id = email_id;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getEmail_state() {
		return email_state;
	}
	public void setEmail_state(String email_state) {
		this.email_state = email_state;
	}

}
