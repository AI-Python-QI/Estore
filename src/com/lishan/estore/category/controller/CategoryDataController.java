package com.lishan.estore.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.category.Category;
import com.lishan.estore.category.ICategoryService;
import com.lishan.estore.util.GetJsonUtil;

@Controller
@RequestMapping(value="/category" ,produces="text/html;charset=utf-8")
public class CategoryDataController {
	
	//注入service
	@Autowired
	@Qualifier("cService")//匹配serviceImpl实现端
	private ICategoryService categoryService;
	
	//把json工具类注入
	@Autowired
	private GetJsonUtil jsonUtil;
	
	@RequestMapping(value="/queryCategory")
	@ResponseBody
	public String queryCategory()throws Exception{
		JSONObject json = jsonUtil.getJson();
		List<Category> category = categoryService.queryCategory();
		System.out.println("category:"+category);
		if(category.size()>0) {
			System.out.println("left商品类别查询成功！");
			json.put("error_code", "24");
			json.put("error_msg", "category query success");
			json.put("category",category);
			
		}else {
			System.out.println("category商品类别查询失败！");
			json.put("error_code", "404");
			json.put("error_msg", "category query error");			
		}		
		
		return json.toJSONString();
		
	}
	
}
