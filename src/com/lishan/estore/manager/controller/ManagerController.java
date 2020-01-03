package com.lishan.estore.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/manager",produces="text/html;charset=utf-8")
public class ManagerController {

	//个人中心登录首页
	@RequestMapping(value="/mlogin.html",produces="text/html;charset=utf-8")
	public String managerLogin()throws Exception{
		return "managerlogin";		
	}
	
	//个人中心主页
	@RequestMapping(value="/mindex.html",produces="text/html;charset=utf-8")
	public String managerIndex()throws Exception{
		return "managerindex";
	}
	
	
}
