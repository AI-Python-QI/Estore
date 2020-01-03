package com.lishan.estore.myhome.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lishan.estore.myhome.IMyHomeService;


@Controller
@RequestMapping(value="/myhome", produces="text/html;charset=utf-8")
public class MyHomeDataController {
	

	
	//使用service 
	@Autowired
	@Qualifier("mService")
	private IMyHomeService myhomeService;
	
	
	
	
	

}

	