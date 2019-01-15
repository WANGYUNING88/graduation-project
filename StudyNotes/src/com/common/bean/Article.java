package com.common.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="article")
public class Article {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="article_id")
	private Integer article_id;
	@Column(name="article_title")
	private String article_title;
	@Column(name="article_content")
	private String article_content;
	@Column(name="article_time")
	private String article_time;
	@Column(name="article_keyword")
	private String article_keyword;
	@Column(name="article_img")
	private String article_img;
	@Column(name="article_label")
	private String article_label;
	@Column(name="user_id")
	private Integer user_id;
	public String getArticle_describe() {
		return article_describe;
	}
	public void setArticle_describe(String article_describe) {
		this.article_describe = article_describe;
	}
	@Column(name="article_describe")
	private String article_describe;
	
	@Column(name="article_state")
	private String article_state;
	
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public String getArticle_time() {
		return article_time;
	}
	public void setArticle_time(String article_time) {
		this.article_time = article_time;
	}
	public String getArticle_keyword() {
		return article_keyword;
	}
	public void setArticle_keyword(String article_keyword) {
		this.article_keyword = article_keyword;
	}
	public String getArticle_img() {
		return article_img;
	}
	public void setArticle_img(String article_img) {
		this.article_img = article_img;
	}
	public String getArticle_label() {
		return article_label;
	}
	public void setArticle_label(String article_label) {
		this.article_label = article_label;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getArticle_state() {
		return article_state;
	}
	public void setArticle_state(String article_state) {
		this.article_state = article_state;
	}
	
	
	
	
	
}
