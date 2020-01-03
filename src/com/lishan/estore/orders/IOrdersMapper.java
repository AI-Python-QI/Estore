package com.lishan.estore.orders;



import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface IOrdersMapper {

	
	public Integer insertOrderItems(List<OrderItems> orderItemsList)throws Exception;
	
	
	public Integer insertOrders(Orders order)throws Exception;
	
	public List<OrderItems> findOrderItemList(Orders orders)throws Exception;

	public Orders findOrdersByOidAndUid(Orders order)throws Exception;
	//获取商品详情
	public List<OrderItems> queyAllOrdersItemsByoid(String oid);

	public List<OrderItems> queyAllOrdersItemsByoids(List<Orders> orderslist);
	//修改订单状态
	public int updateOrderStatusByid(@Param("orderId")String orderId);
	
	//查询用户所有订单信息
	public List<Orders> queryOrdersByuid(@Param("uid")int uid);
	//查询orderitems
	public List<OrderItems> queryOrderItemsByoid(@Param("id")String id);

	//查询未支付订单 status=0
	public List<Orders> querynopayOrdersByuid(@Param("uid")int uid);

	//已支付订单
	public List<Orders> querypayOrdersByuid(@Param("uid")int uid);

	//已发货订单
	public List<Orders> querysendOrdersByuid(@Param("uid")int uid);

	//未发货订单
	public List<Orders> querynosendOrdersByuid(@Param("uid")int uid);
	
	
}
