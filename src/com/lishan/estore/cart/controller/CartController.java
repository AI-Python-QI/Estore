package com.lishan.estore.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/cart",produces="text/html;charset=utf-8")
public class CartController {

	//为了对jsp安全措施 jsp == html 映射
	@RequestMapping("/cart.html")
	public String showCart()throws Exception{
		return "cart";
	}
	
	
}
