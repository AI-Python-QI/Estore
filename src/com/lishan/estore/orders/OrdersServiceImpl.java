package com.lishan.estore.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lishan.estore.cart.Cart;
import com.lishan.estore.cart.ICartMapper;
@Service("orService")
public class OrdersServiceImpl implements IOrdersService{

	 @Autowired
	 private IOrdersMapper ordersMapper;
	
	 @Autowired
	 private ICartMapper cartMapper;
	 
	 
	 public List<Cart> queryCartToShow(List<Integer> list) throws Exception {
	  return cartMapper.queryCartByIds(list);
	 }

	 
	 public boolean addOrderItems(List<OrderItems> orderItemsList, Orders order) throws Exception {
			Integer result2 = ordersMapper.insertOrders(order);
			System.out.println("获取到的 orderItemsList"+orderItemsList);
			Integer result1 = ordersMapper.insertOrderItems(orderItemsList);
			
			if (result2>0) {
				if (result1>0) {
					return true;
				}
			}
			return false;
		}
	
	 public List<OrderItems> findOrderItemList(Orders orders) throws Exception {
			// TODO Auto-generated method stub
			return ordersMapper.findOrderItemList(orders);
		}
	 
	 
		public Orders findOrdersByOidAndUid(Orders order) throws Exception {
			// TODO Auto-generated method stub
			return ordersMapper.findOrdersByOidAndUid(order);
		}
		
		public List<Cart> queryCheckedItem(Cart cart) throws Exception {
			// TODO Auto-generated method stub
			return cartMapper.queryCheckedItem(cart);
		}

		//修改订单状态
		public boolean updateOrderStatus(String orderId) {
			ordersMapper.updateOrderStatusByid(orderId);
			
			return true;
		}
		
	 
}
