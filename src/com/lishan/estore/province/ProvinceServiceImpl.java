package com.lishan.estore.province;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pService")
public class ProvinceServiceImpl implements ProvinceService{

	@Autowired
	private ProvinceMapper provinceMapper;

	public List<Province> getProvince(Integer parentid) throws Exception {
		// TODO Auto-generated method stub
		return provinceMapper.getProvince(parentid);
	}

}
