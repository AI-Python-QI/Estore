package com.lishan.estore.cart;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lishan.estore.orders.IOrdersMapper;
import com.lishan.estore.orders.OrderItems;


@Service("icService")
public class CartServiceImpl implements ICartService {

	//调用mapper 
	@Autowired
	private ICartMapper cartMapper;
	
	
	
	public static final Integer PAGE_SIZE=5;
	
	
	public List<Cart> queryCartPageByUid(Integer uid, int pageNo) throws Exception {
		int begin=(pageNo-1)*PAGE_SIZE;
		int end=PAGE_SIZE;
		return cartMapper.queryCartList(uid, begin, end);
	}
	
	public Integer  getTotalpages(Integer uid) throws Exception {
		int totalPages=cartMapper.queryCartCountByUid(uid);
		return totalPages/PAGE_SIZE+(totalPages%PAGE_SIZE==0?0:1);
	}

	//添加购物车商品
	public Integer addShoping(Integer gid, Integer buyNum, Integer uid) {
		
		//查询现阶段购物车有哪些商品？
//		int  goodscart= cartMapper.queryGidByuid(gid,uid);
//		System.out.println("购物车的商品数"+goodscart);
		
		//buyNum = buyNum+goodscart;
		//System.out.println("加完之后的值："+buyNum);
		Integer result = cartMapper.insertCartByuidAndgidAndbuyNum(gid,buyNum,uid,new Date());
		return result;
		
		
		
	}
	//清空购物车
	public int clearCart(Integer id) {
		int result = cartMapper.deleCartByUsername(id);
		return result;
	}

	//删除购物车数据
	public int deleteCartByid(Integer id) {
		int result =cartMapper.deleCartByid(id);
		return result;
	}
	
	
	public List<Cart> queryCheckedItem(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return cartMapper.queryCheckedItem(cart);
	}

	public boolean deleteCartChecked(Cart cart) throws Exception {
		 Integer result = cartMapper.deleteCartChecked(cart);
		 if (result>0) {
			return true;
		}
		return false;
	}
	//修改购物车数量
	public void updateCartByidQuantity(Integer id, Integer quantity) {
		 cartMapper.updateCartByidQuantity(id, quantity);
	}

	public Cart querybuyNumByuidId(Integer uid, Integer gid) {
		Cart cart = new Cart();
		cart = cartMapper.queryBuyNumBygiduid(gid, uid);
		return cart;
	}

	//修改数据库数量
	public void updateCartByuidgid(Integer gid, Integer uid, Integer buyNum) {
		cartMapper.updateCartBuyNum(gid,uid,buyNum);
		
	}

	public void insertCartByuidgidbuynum(Integer gid, Integer uid, Integer buyNum) {
		cartMapper.insertCartByuidAndgidAndbuyNum(gid, buyNum, uid,new  Date());
		
	}

	

}
