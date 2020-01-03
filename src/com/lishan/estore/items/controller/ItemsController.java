package com.lishan.estore.items.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/items", produces="text/html;charset=utf-8")
public class ItemsController {

	//index页面
	@RequestMapping(value="index.html")
	public String indexPage()throws Exception {
		return "index";
	}
	
	//商品详情页面
	@RequestMapping(value="itemDetail.html/{id}", produces="text/html;charset=utf-8")
	public String itemsDetailPage(@PathVariable("id")String id)throws Exception{
		return "itemDetail";
	}
	
	//定制套餐页面
	@RequestMapping(value="makesuit.html",produces="text/html;charset=utf-8")
	public String itemsLeftPage()throws Exception{
		return "makesuit";
	}
	//定制套餐ID页面
	@RequestMapping(value="makesuit.html/{pid}/{id}")
	public String itemsByIdPage(@PathVariable("pid")Integer pid,@PathVariable("id")Integer id)throws Exception{
		return "makesuit";
	}

	
}
