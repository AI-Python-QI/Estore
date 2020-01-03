package com.lishan.estore.items.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.items.Items;
import com.lishan.estore.items.ItemsService;
import com.lishan.estore.users.Users;
import com.lishan.estore.util.GetJsonUtil;

@Controller
@RequestMapping(value="/items", produces = "text/html;charset=utf-8")
public class ItemsDataController {

	//后端处理首先进行依赖注入
	@Autowired
	@Qualifier("iService")
	private ItemsService itemsService;
	//把json工具类注入
	@Autowired
	private GetJsonUtil jsonUtil;

	
	
	@RequestMapping(value="index.action", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String showIndex(HttpServletRequest request,HttpServletResponse response)throws Exception{
		//HttpSession session = request.getSession();
		JSONObject json = jsonUtil.getJson();
		//调用service进行查询数据
		List<Items> hosts = itemsService.hotGoodService();
		List<Items> news = itemsService.newGoodService();
		if(hosts.size()>0 || news.size()>0) {
			json.put("error_code", "0");
			json.put("error_msg1", hosts);
			json.put("error_msg2", news);
		}
		
		return json.toJSONString();
		
		
	}
	
	//商品详情页面
	@RequestMapping(value="itemDetail/{id}")
	@ResponseBody
	public String showIndexDetail(@PathVariable("id") Integer id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		//调用json
		JSONObject json = jsonUtil.getJson();
		HttpSession session = request.getSession();
		Users user =  (Users) session.getAttribute("user");
		//System.out.println("登录用户信息"+user.getUsername());	
		//通过获取地址栏上的Id信息进行查询该商品的详细信息
		Items item = itemsService.queryGoodsByid(id);
		System.out.println("查询到的商品信息："+item);
		//如果查询结果不为空的话,
		if(item!=null) {
			System.out.println("通过ID已查询到指定商品！"+item.getName());
			json.put("error_code", "24");
			json.put("error_msg", "通过ID查询到指定商品！");
			json.put("item", item);
			json.put("user", user);
		}else {
			System.out.println("通过ID查询商品失败！");
			json.put("error_code", "404");
			json.put("error_msg", "queryGoodsByid ERROR");
			json.put("user", user);
		}
		return json.toJSONString();		
		
	}
	
	
	//分类页面
	@RequestMapping(value="/data/makesuit/{pid}/{id}", produces="text/html;charset=utf-8")
	@ResponseBody
	public String oneTypeGoods(@PathVariable("pid") Integer pid, @PathVariable("id") Integer id)throws Exception{
		JSONObject json = jsonUtil.getJson();
		//如果地址栏为空，则默认让 pid  id ==0 查询所有商品？？
		List<Items> lists = itemsService.queryGoodsBypidAndId(pid,id);
		json.put("error_code", "24");
		json.put("items", lists);
		return json.toJSONString();
		
	}

	
	
}
