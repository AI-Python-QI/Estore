package com.lishan.estore.orders;

import java.io.Serializable;

import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.items.Items;

public class OrderItems implements Serializable {

	
	private String oid;
	private int gid;
	private int buynum;
	private Items items;
	private int stat;
	
	public OrderItems() {
		
	}
	
	
	
	
	public OrderItems(String oid, int gid, int buynum, Items items, int stat) {
		super();
		this.oid = oid;
		this.gid = gid;
		this.buynum = buynum;
		this.items = items;
		this.stat = stat;
	}




	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public Items getItems() {
		return items;
	}
	public void setItems(Items items) {
		this.items = items;
	}
	
	public int getStat() {
		return stat;
	}




	public void setStat(int stat) {
		this.stat = stat;
	}




	@Override
	public String toString() {
		return  JSONObject.toJSONString(this);
	}
	
	
	
	
	
	
	
	
}
