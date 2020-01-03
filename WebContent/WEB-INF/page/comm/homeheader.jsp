<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set  value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员登录</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root }/css/login.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${root }/items/index.html">
				<img src="${root }/image/logo.png" width="130" height="51" alt="">
			</a>
		</div>
	</div>
	<div class="span9">
	<div>
		<img src="${root }/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
	</div>	
</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="${root }/users/login.html"><span></span>登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${root }/users/register.html">注册</a>|
				</li>
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a href="${root }/users/login.html">[退出]</a>|
				</li>
						<li>
							<a href="${root }/myhome/myhome.html">会员中心</a>
							|
						</li>
						<li>
							<a href="http://localhost:8080/Manager/admin/mlogin.html" >管理入口</a>
							|
						</li>
						<li>
							<a>关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a href="${root }/cart/cart.html">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>96008/53277764</strong>
			</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="${root }/myhome/myhome.html">个人主页</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/myorderall.html">全部订单</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/nopayorder.html">未支付订单</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/payorder.html">已支付订单</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/sendorder.html">已发货订单</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/nosendorder.html">未发货订单</a>
						|
					</li>
					<li>
						<a href="${root }/myhome/addressorder.html">活动推荐</a>
						|
					</li>
					<li>
						<a>退款/售后</a>
						|
					</li>
					
				
					
		</ul>
	</div>
	</div>
</body>
</html>