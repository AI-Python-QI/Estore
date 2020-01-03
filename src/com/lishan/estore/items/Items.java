package com.lishan.estore.items;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Items {
	private Integer id;//商品ID
	private String name;//商品名称
	private double marketprice;//市场价
	private double estoreprice; //超市价
	private Integer category_id;//商品分类
	private Integer num;//库存数量（暂时可以不考虑这块）
	private String titleimage; //标题图片
	private String description; //商品描述
	private Integer hot; //商品的热度，只允许有10个商品有热度，为了广告赚钱，默认1--8
	private Date production_date; //生产日期
	private Date expiry_date; //保质期

	private List<Items> lists = new ArrayList<Items>() ;
	
	
	
	
	
	public List<Items> getLists() {
		return lists;
	}

	public void setLists(List<Items> lists) {
		this.lists = lists;
	}

	public Items() {
		
	}
		
	public Items(Integer id, String name, double marketprice, double estoreprice, Integer category_id, Integer num,
			String titleimage, String description, Integer hot, Date production_date, Date expiry_date) {
		super();
		this.id = id;
		this.name = name;
		this.marketprice = marketprice;
		this.estoreprice = estoreprice;
		this.category_id = category_id;
		this.num = num;
		this.titleimage = titleimage;
		this.description = description;
		this.hot = hot;
		this.production_date = production_date;
		this.expiry_date = expiry_date;
	}




	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getMarketprice() {
		return marketprice;
	}
	public void setMarketprice(double marketprice) {
		this.marketprice = marketprice;
	}
	public double getEstoreprice() {
		return estoreprice;
	}
	public void setEstoreprice(double estoreprice) {
		this.estoreprice = estoreprice;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getTitleimage() {
		return titleimage;
	}
	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
	public Date getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}
	public Date getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}

	@Override
	public String toString() {
		return "Items [id=" + id + ", name=" + name + ", marketprice=" + marketprice + ", estoreprice=" + estoreprice
				+ ", category_id=" + category_id + ", num=" + num + ", titleimage=" + titleimage + ", description="
				+ description + ", hot=" + hot + ", production_date=" + production_date + ", expiry_date=" + expiry_date
				+ ", lists=" + lists + "]";
	}


	
	
	
	
	
	
	

}
