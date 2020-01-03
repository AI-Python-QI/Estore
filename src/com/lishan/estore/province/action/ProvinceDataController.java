package com.lishan.estore.province.action;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.province.Province;
import com.lishan.estore.province.ProvinceService;


@Controller
@RequestMapping(value="/province/data")
public class ProvinceDataController {

	@Autowired
	@Qualifier("pService")
	private ProvinceService provinceService;
	@RequestMapping(value="/province",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getProvince(@RequestParam("parentid")int parentid)throws Exception{
		JSONObject json = new JSONObject();
		List<Province> lists = provinceService.getProvince(parentid);
		if (lists.size()>0) {
			json.put("error_code", 1);
			json.put("error_msg", lists);
		}else{
			json.put("error_code", 0);
			json.put("error_msg", "数据查询失败,请稍后再试!");
		}
		return json.toJSONString();
	}
}
