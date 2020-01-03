package com.lishan.estore.items;

import java.util.List;

public interface ItemsService {

	//首页商品页面
	
	//获取所有最热商品
	List<Items> hotGoodService()throws Exception;
	//获取所有的最新商品
	List<Items> newGoodService()throws Exception;
	//通过ID查询商品详情信息
	Items queryGoodsByid(Integer id)throws Exception;
	//查询分类商品信息，返回list列表
	List<Items> queryGoodsBypidAndId(Integer pid, Integer id);
	
	
	
	
	
}
