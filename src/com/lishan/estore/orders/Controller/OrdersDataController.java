package com.lishan.estore.orders.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.estore.cart.Cart;
import com.lishan.estore.cart.ICartService;
import com.lishan.estore.orders.IOrdersService;
import com.lishan.estore.orders.OrderItems;
import com.lishan.estore.orders.Orders;
import com.lishan.estore.users.Users;
import com.lishan.estore.util.AlipayUtil;


@Controller
@RequestMapping(value="/order/data",produces="text/html;charset=utf-8")
public class OrdersDataController {

	@Autowired
	@Qualifier("orService")
	private IOrdersService ordersService;
	@Autowired
	@Qualifier("icService")
	private ICartService cartService;
	
	
	//订单生成 
	@RequestMapping(value="/orderItemsInsert/{ids}",produces="text/html;charset=utf-8")
	@ResponseBody
	public String insertOrderItems(HttpSession session,@PathVariable("ids")List<Integer> ids,
			                      @RequestParam(value="address",required=true)String address,
			                      @RequestParam(value="receivename",required=true)String receivename,
			                      @RequestParam(value="phone",required=true)String phone)throws Exception{
		JSONObject json =new JSONObject();
		//判断用户是否登录
		Users user = (Users)session.getAttribute("user");
		//创建订单编号，用户id+年月日时分秒例如120180411103735
		String oid=user.getId()+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<OrderItems> orderItemsList=new ArrayList<OrderItems>();
		if (user!=null) {
			Cart cart = new Cart();
			cart.setUid(user.getId());
			cart.setIds(ids);
			List<Cart> list = cartService.queryCheckedItem(cart);
			double totalprice=0.0;
			for (Cart c : list) {
				totalprice+=c.getBuyNum()*c.getItem().getEstoreprice();
				//创建orderItems对象
				OrderItems orderItems=new OrderItems();
				//给orderItems对象设置值
				orderItems.setOid(oid);
				orderItems.setBuynum(c.getBuyNum());
				orderItems.setGid(c.getGid());
				//将值放在列表中
				orderItemsList.add(orderItems);
			}
			//创建订单对象
			Orders order = new Orders();
			order.setId(oid);
			order.setTotalprice(totalprice);
			order.setUid(user.getId());
			order.setCreatetime(new Date());
			order.setAddress(address);
			order.setPhone(phone);
			order.setReceivename(receivename);
			order.setStatus(0);
			//将生成的orderItemsList列表保存到表里面
			boolean result1 = ordersService.addOrderItems(orderItemsList,order);
			
			//删除购物车中的被选中的商品
			boolean result2 = cartService.deleteCartChecked(cart);
			if (result1==true && result2==true) {
				//订单生成完成之后显示订单的信息,显示订单信息需要单独的方法进行处理
				session.setAttribute("oid", oid);
				json.put("error_code", 1);
			    json.put("error_msg", "订单已生成");
			}
			else {
				session.setAttribute("oid", "");
				json.put("error_code", 0);
			    json.put("error_msg", "订单生成失败!");
			}
			
		}
		return json.toJSONString();
	}
	//展示订单页面
	@RequestMapping("/confirmOrders/{ids}")
	@ResponseBody
	public String showOrdersPageData(HttpSession session,@PathVariable("ids")List<Integer> ids)throws Exception{
		Users users = (Users) session.getAttribute("user");
		JSONObject json = new JSONObject();
		if (users==null) {
			json.put("error_code", 1);
			json.put("error_msg", "您还未登陆,请您登录!");
		}else{
			Cart cart = new Cart();
			cart.setUid(users.getId());
			cart.setIds(ids);
			List<Cart> list =ordersService.queryCheckedItem(cart);
			json.put("error_code", 0);
			json.put("error_msg", list);
		}
		return json.toJSONString();
	}
	//添加订单信息 oid  buynum  uid
	@RequestMapping(value="/confirmorder",produces="text/html;charset=utf-8")
	@ResponseBody
	public String insertOrderItems(HttpSession session)throws Exception{
		JSONObject json =new JSONObject();
		//判断用户是否登录
		Users user = (Users)session.getAttribute("user");
		if (user!=null) {
			String oid =(String) session.getAttribute("oid");
			Orders order = new Orders();
			order.setId(oid);
			order.setUid(user.getId());
			List<OrderItems> orderItemsList = ordersService.findOrderItemList(order);
			Orders o = ordersService.findOrdersByOidAndUid(order);
			json.put("error_code", 1);
			json.put("error_msg1", orderItemsList.toString());
			json.put("error_msg2", o);
		}
		return json.toJSONString();
	}
	//提交订单
	@RequestMapping(value="/alipay",produces="text/html;charset=utf-8")
	@ResponseBody
	public String alipay(HttpServletResponse response,
			          @RequestParam("money")String money,HttpSession session,
			          @RequestParam("orderId")String orderId )throws Exception{
		JSONObject json = new JSONObject();
		Users users = (Users) session.getAttribute("user");
		if(users!=null) {
			boolean result1 = ordersService.updateOrderStatus(orderId);
			if(result1) {
				System.out.println("提交订单成功！状态已修改！");
				String info = "描述信息";
				String result = AlipayUtil.pay(response, money, info, users.getId(), orderId);
				json.put("error_code", 1);
				json.put("error_msg", result);
				session.setAttribute("result", result);
			}else {
				System.out.println("订单生成失败！");
				json.put("error_code", "404");
				json.put("error_msg", "order error");
			}
			
		}
		
		return json.toJSONString();
	}
}
