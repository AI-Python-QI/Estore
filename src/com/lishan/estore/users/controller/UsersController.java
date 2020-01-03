package com.lishan.estore.users.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/users",produces="text/html;charset=utf-8")
public class UsersController {
	
	
	//控制器，控制URL
	@RequestMapping(value="/login.html")
	public String loginPage()throws Exception{
		return "login";
	}
	
	@RequestMapping(value="/register.html")
	public String registerPage()throws Exception{
		return "register";
	}
	
	
	
	@RequestMapping(value="/fastregister.html")
	public String fastregisterPage()throws Exception{
		return "fastregister";
	}
	

	@RequestMapping(value="/fastlogin.html")
	public String fastloginPage()throws Exception{
		return "fastlogin";
	}
	

	@RequestMapping(value="/fastactive.html")
	public String fastactive()throws Exception{
		return "fastactive";
	}
	
	@RequestMapping(value="/fastphoneActive")
	public String fastphoneactive()throws Exception{
		return "fastphoneActive";
	}
	
	@RequestMapping(value="/forgetpassword")
	public String forgetpasswordPage()throws Exception{
		return "forgetpassword";
	}
	
	@RequestMapping(value="/home.html")
	public String homePage()throws Exception{
		return "home";
	}
	
	
}
