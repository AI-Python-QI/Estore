package com.lishan.estore.orders;

import java.util.List;

import com.lishan.estore.cart.Cart;

public interface IOrdersService {

	public boolean addOrderItems(List<OrderItems> orderItemsList,Orders order)throws Exception;
	
	public List<Cart> queryCartToShow(List<Integer> list)throws Exception;
	
	public List<OrderItems> findOrderItemList(Orders orders)throws Exception;
	
	public Orders findOrdersByOidAndUid(Orders order)throws Exception;
	
	public List<Cart> queryCheckedItem(Cart cart)throws Exception;
	//修改订单状态
	public boolean updateOrderStatus(String orderId);
}
