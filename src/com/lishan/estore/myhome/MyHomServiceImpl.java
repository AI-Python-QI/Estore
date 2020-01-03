package com.lishan.estore.myhome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lishan.estore.orders.IOrdersMapper;
import com.lishan.estore.orders.Orders;

@Service("mService")
public class MyHomServiceImpl implements IMyHomeService {

	@Autowired
	private IOrdersMapper ordersMapper;
	
	
	//查询所有的order
	public List<Orders> queryOrders(int uid) {
		List<Orders> list = ordersMapper.queryOrdersByuid(uid);
		return list;
	}

	//查询未支付订单 status ==0
	public List<Orders> querynopayOrders(int uid) {
		List<Orders> list = ordersMapper.querynopayOrdersByuid(uid);
		return list;
	}
	//已支付订单
	public List<Orders> querypayOrders(int uid) {
		List<Orders> list = ordersMapper.querypayOrdersByuid(uid);
		return list;
	}
	//已发货订单
	public List<Orders> querysendOrders(int uid) {
		List<Orders> list = ordersMapper.querysendOrdersByuid(uid);
		return list;
	}
	//未发货订单
	public List<Orders> querynosendOrders(int uid) {
		List<Orders> list = ordersMapper.querynosendOrdersByuid(uid);
		return list;
	}



	

}
