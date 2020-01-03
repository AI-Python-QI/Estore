package com.lishan.estore.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/myhome", produces="text/html;charset=utf-8")
public class MyHomeController {

	//个人中心主页
	@RequestMapping(value="myhome.html",produces="text/html;charset=utf-8")
	public String myhome()throws Exception{
		return "myhome";
	}
	
	//个人中心全部订单
	@RequestMapping(value="myorderall.html",produces="text/html;charset=utf-8")
	public String myorderall()throws Exception{
		return "myorderall";
	}
	
	//已发货订单
	@RequestMapping(value="sendorder.html",produces="text/html;charset=utf-8")
	public String sendOrder()throws Exception{
		return "sendorder";
	}
	
	//未发货订单
	@RequestMapping(value="nosendorder.html",produces="text/html;charset=utf-8")
	public String nosendOrder()throws Exception{
		return "nosendorder";
	}
	
	//已支付订单
	@RequestMapping(value="payorder.html",produces="text/html;charset=utf-8")
	public  String payorder()throws Exception{
		return "payorder";
	}
	
	//未支付订单
	@RequestMapping(value="/nopayorder.html",produces="text/html;charset=utf-8")
	public String nopayorder()throws Exception{
		return "nopayorder";
	}
	//活动中心
	@RequestMapping(value="addressorder.html",produces="text/html;charset=utf-8")
	public String action()throws Exception{
		return "addressorder";
	}
	
	
}
