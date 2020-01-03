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
		if(user!=null) {
			int uid = user.getId();
			
			List<Orders> orderlist = myhomeService.queryOrders(uid);
			List<OrderItems> orderitems = new ArrayList<OrderItems>();
				
			for (Orders orders : orderlist) {			
				orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
			}
			json.put("error_code", "24");
			json.put("error_msg1", orderitems);
			return json.toJSONString();
		}else {
			json.put("error_code", "404");
			json.put("error_msg1", "error");
			return json.toJSONString();
		}
		
	}
	
	//未支付订单
	@RequestMapping(value="/nopayorder",produces="text/html;charset=utf-8")
	@ResponseBody
	public String nopayorder(HttpServletRequest request)throws Exception{
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if(user!=null) {
			int uid = user.getId();
			
			List<Orders> orderlist = myhomeService.querynopayOrders(uid);
			List<OrderItems> orderitems = new ArrayList<OrderItems>();
				
			for (Orders orders : orderlist) {			
				orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
			}
			json.put("error_code", "24");
			json.put("error_msg1", orderitems);
			return json.toJSONString();
		}else {
			json.put("error_code", "404");
			json.put("error_msg1", "error");
			return json.toJSONString();
		}
	}	
	
		//已支付订单
		@RequestMapping(value="/payorder",produces="text/html;charset=utf-8")
		@ResponseBody
		public String payorder(HttpServletRequest request)throws Exception{
			JSONObject json = new JSONObject();
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("user");
			if(user!=null) {
				int uid = user.getId();
				
				List<Orders> orderlist = myhomeService.querypayOrders(uid);
				List<OrderItems> orderitems = new ArrayList<OrderItems>();
					
				for (Orders orders : orderlist) {			
					orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
				}
				json.put("error_code", "24");
				json.put("error_msg1", orderitems);
				return json.toJSONString();
			}else {
				json.put("error_code", "404");
				json.put("error_msg1", "error");
				return json.toJSONString();
			}
		}
		
		//已发货订单
		@RequestMapping(value="/sendorder",produces="text/html;charset=utf-8")
		@ResponseBody
		public String sendorder(HttpServletRequest request)throws Exception{
			JSONObject json = new JSONObject();
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("user");
				if(user!=null) {
					int uid = user.getId();
						
					List<Orders> orderlist = myhomeService.querysendOrders(uid);
					List<OrderItems> orderitems = new ArrayList<OrderItems>();
							
					for (Orders orders : orderlist) {			
						orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
					}
						json.put("error_code", "24");
						json.put("error_msg1", orderitems);
					return json.toJSONString();
					}else {
						json.put("error_code", "404");
						json.put("error_msg1", "error");
						return json.toJSONString();
					}
				}		
		
		
		//未发货订单
		@RequestMapping(value="/nosendorder",produces="text/html;charset=utf-8")
		@ResponseBody
		public String nosendorder(HttpServletRequest request)throws Exception{
			JSONObject json = new JSONObject();
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("user");
				if(user!=null) {
					int uid = user.getId();
								
					List<Orders> orderlist = myhomeService.querynosendOrders(uid);
					List<OrderItems> orderitems = new ArrayList<OrderItems>();
									
					for (Orders orders : orderlist) {			
						orderitems.addAll(ordersMapper.queryOrderItemsByoid(orders.getId()));					
					}
						json.put("error_code", "24");
						json.put("error_msg1", orderitems);
					return json.toJSONString();
					}else {
						json.put("error_code", "404");
						json.put("error_msg1", "error");
						return json.toJSONString();
					}
				}		
				

}

	