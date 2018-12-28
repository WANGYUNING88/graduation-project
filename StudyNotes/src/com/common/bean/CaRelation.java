package com.common.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;


@Entity
@Table(name="column_article_relation")
public class CaRelation {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ca_id")
	private Integer ca_id;
	@Column(name="ca_column_id")
	private Integer ca_column_id;
	@Column(name="ca_article_id")
	private Integer ca_article_id;
	public Integer getCa_id() {
		return ca_id;
	}
	public void setCa_id(Integer ca_id) {
		this.ca_id = ca_id;
	}
	public Integer getCa_column_id() {
		return ca_column_id;
	}
	public void setCa_column_id(Integer ca_column_id) {
		this.ca_column_id = ca_column_id;
	}
	public Integer getCa_article_id() {
		return ca_article_id;
	}
	public void setCa_article_id(Integer ca_article_id) {
		this.ca_article_id = ca_article_id;
	}

}
