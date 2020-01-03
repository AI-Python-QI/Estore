package com.lishan.estore.myhome;

import java.util.List;

import com.lishan.estore.orders.Orders;

public interface IMyHomeService {

	//查询所有的订单
	List<Orders> queryOrders(int uid);
	//查询未支付订单
	List<Orders> querynopayOrders(int uid);
	//已支付订单
	List<Orders> querypayOrders(int uid);
	//已发货订单
	List<Orders> querysendOrders(int uid);
	//未发货订单
	List<Orders> querynosendOrders(int uid);
	
}
