package com.lishan.estore.myhome.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.myhome.IMyHomeService;
import com.lishan.estore.orders.IOrdersMapper;
import com.lishan.estore.orders.OrderItems;
import com.lishan.estore.orders.Orders;
import com.lishan.estore.users.Users;


@Controller
@RequestMapping(value="/myhome", produces="text/html;charset=utf-8")
public class MyHomeDataController {
	

	
	//使用service 
	@Autowired
	@Qualifier("mService")
	private IMyHomeService myhomeService;
	
	@Autowired
	private IOrdersMapper ordersMapper;
	
	
	//所有订单
	@RequestMapping(value="/myorderall",produces="text/html;charset=utf-8")
	@ResponseBody
	public String myorderall(HttpServletRequest request)throws Exception{
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getId();
		//所有订单orders
		List<Orders> orderlist = myhomeService.queryOrders(uid);
		List<OrderItems> orderitems = new ArrayList<OrderItems>();
		//遍历orders 查询出所有	
		for (Orders orders : orderlist) {			
			orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
		}
		json.put("error_code", "24");
		json.put("error_msg1", orderitems);
		return json.toJSONString();
	}
	
		
	
	

}

	