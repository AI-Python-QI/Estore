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

}
