package com.lishan.estore.cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.lishan.estore.items.Items;

public class Cart implements Serializable {
	

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer uid;
	private Integer gid;
	private Integer buyNum;
	private Date createtime;
	
	//购物车中一条数据对应一个商品信息。一对一的操作数据
	private List<Integer> ids = new ArrayList<Integer>();
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	//多个数据的情况下使用LIST 注意都要进行get set 方法
	private Items item;
	
	
	public Items getItem() {
		return item;
	}
	public void setItem(Items item) {
		this.item = item;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}
	
	
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", uid=" + uid + ", gid=" + gid + ", buyNum=" + buyNum + ", createtime=" + createtime
				+ ", item=" + item + "]";
	}

	
	
	
	

}
