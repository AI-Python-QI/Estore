package com.lishan.estore.myhome;

import java.util.List;

import com.lishan.estore.orders.Orders;

public interface IMyHomeService {

	//查询所有的订单
	List<Orders> queryOrders(int uid);

}
