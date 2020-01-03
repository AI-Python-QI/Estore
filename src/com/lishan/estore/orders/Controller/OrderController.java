package com.lishan.estore.orders.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/order",produces="text/html;charset=utf-8")
public class OrderController {

	
//	@RequestMapping("/order.html/{subIds}")
//	public String showCart(@PathVariable("subIds")List<Integer> subIds)throws Exception{
//		return "order";
//	}
	
	@RequestMapping(value="/order.html/{ids}",produces="text/html;charset=utf-8")
	public String cartAll(@PathVariable("ids")List<Integer> ids)throws Exception{
		return "order";
	}
	
	
	@RequestMapping(value="/myorder.html",produces="text/html;charset=utf-8")
	public String query()throws Exception{
		return "myorder";
	}
	@RequestMapping(value="/notify_url.html",produces="text/html;charset=utf-8")
	public String ajaxTest()throws Exception{
		return "notify_url";
	}
	@RequestMapping(value="/test.html",produces="text/html;charset=utf-8")
	public String test()throws Exception{
		return "test";
	}
	
	
}
