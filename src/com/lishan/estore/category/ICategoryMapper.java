package com.lishan.estore.category;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lishan.estore.items.Items;

public interface ICategoryMapper {
	//查询所有类别
	public List<Category> queryCategory()throws Exception;
	//通过ID pid 查询所有类别
	public List<Category> selectcategoryBypidAnd(@Param("pid")Integer pid, @Param("id")Integer id);
	//通过ID查询类别
	public List<Category> selectcategory(Integer id);
	//查询子类 商品 
	public List<Items> queryGoodsByid(@Param("category_id")Integer id);
	
}
