package com.lishan.estore.cart;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ICartMapper {

	//查询所有该用户购买的物品
	List<Cart> queryCartList( @Param("uid")Integer uid, @Param("begin")int begin,  @Param("end")int end)throws Exception;
	
	//查询所有该用户下购物车数据的条数
	int queryCartCountByUid(Integer uid)throws Exception;
	//添加商品到购物车
	Integer insertCartByuidAndgidAndbuyNum(@Param("gid")Integer gid, @Param("buyNum")Integer buyNum, @Param("uid")Integer uid,@Param("date")Date date);
	//清空购物车
	int deleCartByUsername(Integer id);
	//删除购物车商品
	int deleCartByid(Integer id);
	
	public List<Cart> queryCartByIds(List<Integer> list)throws Exception;

	public List<Cart> queryCheckedItem(Cart cart)throws Exception;
	
	public Integer deleteCartChecked(Cart cart)throws Exception;
	//修改购物车数量 实时更改
	void updateCartByidQuantity(@Param("id")Integer id,@Param("quantity") Integer quantity);
	//查询购物车购买数量
	Cart queryBuyNumBygiduid(@Param("gid")Integer gid,@Param("uid") Integer uid);
	//修改购物车购买数量
	void updateCartBuyNum(@Param("gid")Integer gid, @Param("uid")Integer uid, @Param("buyNum")Integer buyNum);
	
	
	

}
