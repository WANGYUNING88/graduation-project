package com.common.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="column_info")
public class ColumnInfo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="column_id")
	private Integer column_id;
	@Column(name="column_name")
	private String column_name;
	@Column(name="column_byname")
	private String column_byname;
	@Column(name="column_father_node")
	private Integer column_father_node;
	@Column(name="column_keyword")
	private String column_keyword;
	@Column(name="column_describe")
	private String column_describe;
	public Integer getColumn_id() {
		return column_id;
	}
	public void setColumn_id(Integer column_id) {
		this.column_id = column_id;
	}
	public String getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	public String getColumn_byname() {
		return column_byname;
	}
	public void setColumn_byname(String column_byname) {
		this.column_byname = column_byname;
	}
	public Integer getColumn_father_node() {
		return column_father_node;
	}
	public void setColumn_father_node(Integer column_father_node) {
		this.column_father_node = column_father_node;
	}
	public String getColumn_keyword() {
		return column_keyword;
	}
	public void setColumn_keyword(String column_keyword) {
		this.column_keyword = column_keyword;
	}
	public String getColumn_describe() {
		return column_describe;
	}
	public void setColumn_describe(String column_describe) {
		this.column_describe = column_describe;
	}
	
	
	
	
}
