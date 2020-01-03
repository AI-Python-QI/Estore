package com.lishan.estore.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cService")
public class ICategoryServiceImpl implements ICategoryService {
	
	@Autowired
	private ICategoryMapper categoryMapper;
	
	public List<Category> queryCategory() throws Exception {
		
		
		return categoryMapper.queryCategory();
	}

}
