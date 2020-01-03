package com.lishan.estore.cart;

import java.util.List;

public interface ICartService {

	//查询购物车中的物品，通过用户ID 分页查询传入一个Pageno
	List<Cart> queryCartPageByUid(Integer uid, int pageNo)throws Exception;
	//查询总页数
	public Integer  getTotalpages(Integer id)throws Exception;
	//添加购物车商品
	Integer addShoping(Integer gid, Integer buyNum, Integer uid);
	//清空购物车
	int clearCart(Integer id);
	//删除数据
	int deleteCartByid(Integer id);
	//查询打钩状态的所有商品信息
	public List<Cart> queryCheckedItem(Cart cart)throws Exception;
	//提交订单以后删除
	public boolean deleteCartChecked(Cart cart)throws Exception;
	//修改购物车数量
	void updateCartByidQuantity(Integer id, Integer quantity);
	//查询buyNum
	Cart querybuyNumByuidId(Integer uid, Integer gid);
	//修改数据库数量
	void updateCartByuidgid(Integer gid, Integer uid, Integer buyNum);
	//添加购物车数据
	void insertCartByuidgidbuynum(Integer gid, Integer uid, Integer buyNum);
	

}
