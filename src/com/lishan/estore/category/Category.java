package com.lishan.estore.category;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class Category implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;
	private Integer pid;
	
	
	//一对多关系
	private List<Category> lists = new ArrayList<Category>();
	
	
	
	public List<Category> getLists() {
		return lists;
	}
	public void setLists(List<Category> lists) {
		this.lists = lists;
	}
	public Category() {
		
	}
	public Category(Integer id, String type, Integer pid) {
		super();
		this.id = id;
		this.type = type;
		this.pid = pid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		//return "Category [id=" + id + ", type=" + type + ", pid=" + pid + "]";
		return JSON.toJSONString(this);
	}
	
	
	
	
	
}
