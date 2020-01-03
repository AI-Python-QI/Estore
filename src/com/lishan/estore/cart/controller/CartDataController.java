package com.lishan.estore.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.cart.Cart;
import com.lishan.estore.cart.ICartService;
import com.lishan.estore.users.Users;


@Controller
@RequestMapping("/cart/data")
public class CartDataController {

	// 注入service
	@Autowired		
	@Qualifier("icService")
	public ICartService cartService;

	@RequestMapping(value = "/queryCartList/{pageNo}", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String queryall(@PathVariable(value = "pageNo") int pageNo, HttpServletRequest request) throws Exception {
		Users user = (Users) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		if (user == null) {
			json.put("error_code", '1');
			json.put("error_msg", "您还未登陆,请您登录!");
		} else {
			List<Cart> lists = cartService.queryCartPageByUid(user.getId(), pageNo);
			json.put("error_code", '0');
			json.put("error_msg", lists);
			json.put("page", cartService.getTotalpages(user.getId()));
		}
		return json.toJSONString();
	}
	
	
	//添加购物车
	@RequestMapping(value="/cart.add",produces="text/html;charset=utf-8")
	@ResponseBody
	public String addShoping(@RequestParam("goodsId")Integer gid,@RequestParam("buyNum")Integer buyNum,@RequestParam("userId")Integer uid )throws Exception{
		JSONObject json = new JSONObject();
		Cart cart = new Cart();
		//查询购物车是否有要添加的商品 查询buyNum
		cart = cartService.querybuyNumByuidId(uid,gid);
		if(cart!=null) {
			//修改购物车商品数量
			int buynum = cart.getBuyNum();
			buyNum +=buynum;
			cartService.updateCartByuidgid(gid,uid,buyNum);
			json.put("error_code", "24");
			json.put("error_msg", "追加购物车成功");
		}else {
			//插入数据库数据
			cartService.insertCartByuidgidbuynum(gid,uid,buyNum);
			json.put("error_code", "24");
			json.put("error_msg", "添加购物车成功");
		}
		return json.toJSONString();
		
	}
	
	//清空购物车
	@RequestMapping(value="/cart.clear", produces="text/html;charset=utf-8")
	@ResponseBody
	public String clearCart(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JSONObject json = new JSONObject();
		//从session获取登录的用户名
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		Integer id = user.getId();
		cartService.clearCart(id);
		json.put("error_code", "24");
		return json.toJSONString();
	}
	
	//删除购物车数据
	@RequestMapping(value="/cart.delete/{id}")
	@ResponseBody
	public String deleteCartByid(@PathVariable("id")Integer id,HttpServletRequest request)throws Exception{
		JSONObject json = new JSONObject();
		//
		int result = cartService.deleteCartByid(id);
		if(result>=0) {
			System.out.println("删除成功");
			json.put("error_code", "24");
			return json.toJSONString();
		}else {
			json.put("error_code", "404");
			return json.toJSONString();
		}	
	}
	
	//修改购物车添加的内容状态
	@RequestMapping(value="/updateNum/{id}/{quantity}")
	@ResponseBody
	public String  updateCartByidQuantity(@PathVariable("id")Integer id, @PathVariable("quantity")Integer quantity)throws Exception{
		JSONObject json = new JSONObject();
		cartService.updateCartByidQuantity(id,quantity);
		json.put("error_code", "24");
		return json.toJSONString();	
	}
	
	
	
}
