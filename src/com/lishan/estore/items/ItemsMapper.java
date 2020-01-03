package com.lishan.estore.items;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ItemsMapper {

	//查询热度商品
	public List<Items> hotGoods()throws Exception;
	
	//查询最新商品
	public List<Items> newGoods()throws Exception;
	//通过ID查询商品的详情信息
	public Items queryGoodsByIdMapper(Integer id)throws Exception;
	//查询全部商品
	public List<Items> selectAllGoods();
	//pid 为0 查询ID数据
	public List<Items> selectGoodsById(String pid, String id);
	//查询指定 pid 和 ID 数据
	public List<Items> selectGoodsBypidAndId(String pid, String id);

	public List<Items> queryAllgoods();

	public List<Items> queryGoodsByid(@Param("id")Integer id);

	public List<Items> queryGoodsBypid(Integer id);

	public List<Items> findItemsByids(@Param("c1")List<Integer> c1);
	//查询商品 通过ID
	public Items queryGoodsByids(int gid);



	
	
	
	
}
