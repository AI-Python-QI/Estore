package com.lishan.estore.orders;



import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface IOrdersMapper {

	
	/**
	 * 将列表数据插入到订单明细表
	 * @param orderItemsList 订单明细列表
	 */
	public Integer insertOrderItems(List<OrderItems> orderItemsList)throws Exception;
	
	/**
	 * 插入订单的信息
	 * @param orders 封装了订单信息的订单对象
	 */
	public Integer insertOrders(Orders order)throws Exception;
	
	/**
	 * 
	 * @param orders 封装了用户和订单信息的id
	 * @return  返回订单明细列表
	 */
	public List<OrderItems> findOrderItemList(Orders orders)throws Exception;

	public Orders findOrdersByOidAndUid(Orders order)throws Exception;
	//获取商品详情
	public List<OrderItems> queyAllOrdersItemsByoid(String oid);

	public List<OrderItems> queyAllOrdersItemsByoids(List<Orders> orderslist);
	//修改订单状态
	public int updateOrderStatusByid(@Param("orderId")String orderId);
	
	//查询用户所有订单信息
	public List<Orders> queryOrdersByuid(@Param("uid")int uid);
	
}
