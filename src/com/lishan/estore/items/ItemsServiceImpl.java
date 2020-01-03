package com.lishan.estore.items;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.lishan.estore.cart.Cart;
import com.lishan.estore.cart.ICartMapper;
import com.lishan.estore.category.Category;
import com.lishan.estore.category.ICategoryMapper;

@Service("iService") //与ItemsDataController对接
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	private ItemsMapper itemsMapper;
	@Autowired
	private ICategoryMapper icategoryMapper;
	
	//查询最热商品
	public List<Items> hotGoodService() throws Exception {
		List<Items> hotGoodService = itemsMapper.hotGoods();
		return hotGoodService;
	}
	//查询最新商品
	public List<Items> newGoodService() throws Exception {
		
		List<Items>  newGoodService = itemsMapper.newGoods();
		return newGoodService;
	}
	//通过ID查询商品信息
	public Items queryGoodsByid(Integer id) throws Exception {
		Items item = itemsMapper.queryGoodsByIdMapper(id);
		
		return  item;
	}
	public List<Items> queryGoodsBypidAndId(Integer pid, Integer id) {
		List<Items> items =new ArrayList<Items>();
		if(pid==0) {
			//大类别 下的小类别集合 
			List<Category> c = icategoryMapper.selectcategory(id);
			List<Integer> c1 = new ArrayList<Integer>();
			for (int i = 0; i < c.size(); i++) {
				c1.add(c.get(i).getId());
			}
			items = itemsMapper.findItemsByids(c1);
		}else {
			//小类别 直接去goods 查询 category_id
			items =itemsMapper.queryGoodsByid(id);
			
		}
		for (Items items2 : items) {
			System.out.println(items2);
		}
		return items;
		
		

		
	}

	
	
	
	
	
	
}
