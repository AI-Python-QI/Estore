   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>网上商城</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="./comm/header.jsp" />
	<div class="container productContent">
		<div class="span6">
			<jsp:include page="./comm/left.jsp" /> 
		</div>
		<div class="span18 last">

			<div class="productImage">
				<a title="" style="outline-style: none; text-decoration: none;"
					id="zoom"
					href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg"
					rel="gallery">
					<div class="zoomPad">
						<img id="image" style="opacity: 1;" title="" class="medium">
						<div
							style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;"
							class="zoomPup"></div>
						<div
							style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;"
							class="zoomWindow">
							<div style="width: 368px;" class="zoomWrapper">
								<div style="width: 100%; position: absolute; display: none;"
									class="zoomWrapperTitle"></div>
								<div style="width: 0%; height: 0px;" class="zoomWrapperImage">
									<img src="${root }/image/1.jpg"
										style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;">
								</div>
							</div>
						</div>
						<div
							style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;"
							class="zoomPreload">Loading zoom</div>
					</div>
				</a>

			</div>
			<div class="name" id="name"></div>
			<div class="sn">
				<div>
					编号：<span id="bianhao"></span>
				</div>
			</div>
			<div class="info">
				<dl>
					<dt>亿家价:</dt>
					<dd>
						<strong>￥：<span id="estoreprice"></span>元/份
						</strong> 参 考 价：
						<del>
							￥<span id="marketprice"></span>元/份
						</del>
					</dd>
				</dl>
				<dl>
					<dt>促销:</dt>
					<dd>
						<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
					</dd>
				</dl>
				<dl>
					<dt>库存:</dt>
					<dd>
						<span id="goodsNum"> </span> 件
					</dd>
				</dl>
			</div>
			<div class="action">

				<dl class="quantity">
					<dt>购买数量:</dt>
					<dd>
						<input id="quantity" name="quantity" value="1" maxlength="4"
							onpaste="return false;" type="text" onkeyup="judge(this)">
						<div>
							<span id="increase" class="increase" onclick="add(this)">&nbsp;</span>
							<span id="decrease" class="decrease" onclick="reduce(this)">&nbsp;</span>
						</div>
					</dd>
					<dd>件</dd>
				</dl>
				<div class="buy">
					<input id="addCart" class="addCart" value="加入购物车" type="button">

				</div>
			</div>
			<div id="bar" class="bar">
				<ul>
					<li id="introductionTab"><a href="#introduction">商品介绍</a></li>

				</ul>
			</div>
			<div id="introduction" name="introduction" class="introduction">
				<div class="title">
					<strong>商品介绍</strong>
				</div>
				<div id="desc"></div>
			</div>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp" />
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		
		//做加的操作
		function add(_this) {
			var quantity = document.getElementById("quantity").value;
			//如果加到goodsNum不可再加
			if (quantity == goodsNum) {
				return;
			}
			quantity++;
			document.getElementById("quantity").value = quantity;
		}
		//做减得操作
		function reduce(_this) {
			var quantity = document.getElementById("quantity").value;
			//如果减到1不可再减少
			if (quantity == 1) {
				return;
			}
			quantity--;
			document.getElementById("quantity").value = quantity;
		}
		//改正。用户可以恶意的输入非法的字母,非法的字母转换成数字
		function judge(_this) {
			var val = _this.value;
			if (/[^\d]/.test(val)) {//替换非数字字符    
				var temp_amount = val.replace(/[^\d]/g, '');
				_this.value = temp_amount;
			}
			val = _this.value;
			if (val > goodsNum) {
				_this.value = goodsNum;
			}
			if (val < 1) {
				_this.value = 1;
			}
		}

		var goodsNum; //商品库存
		var goodsId;  //商品ID
		var buyNum;   //购买数量
		var userId;   //用户的ID
		var goodsName;//商品名称
		
		$(function(){			 
		  	$.ajax({
			  	url:"${root}/items/itemDetail/${id}",
			  	type:"post",
			  	dataType:"json",
			  	success:function(result){	
				  	if(result.error_code=='24'){
					  	var item = result.item;
					  	var u = result.user;
					  	if(u==null){
					  		alert("请先进行登陆");
					  		location.href="${root}/items/index.html";
					  	}
					  	userId  = u.id;
					  	/* alert("userID:"+userId); */
					  	$("#bianhao").text(item.id);
					  	$("#name").text(item.name);
					  	$("#goodsNum").text(item.num);
					  	$("#estoreprice").text(item.estoreprice);
					  	$("#marketprice").text(item.marketprice);
					  	$("#image").attr("src","${root}/image/"+item.titleimage);					
					  	$("#desc").html($("<h1 align='center'>"+item.name+"</h1> <br>")
							           .append("<br><font style='align:left;font-size:18px;'>"+item.description+"</font>")
							           .append("<img  src='${root}/image/"+item.titleimage+"'>"));
				  	}
		  	goodsNum = item.num;
		  	goodsId = item.id;		  	
			  	}
		  });  
		})
		
		/* 添加购物车 */
		$("#addCart").click(function(){
			var buyNum = $("#quantity").val();//购买数量
			//alert(buyNum+"goumaishuli");
			//alert("userID:"+userId);
			var dataSend ={"goodsId":goodsId,"buyNum":buyNum,"userId":userId};
			$.ajax({
				url:"${root}/cart/data/cart.add",
				type:"post",
				data:dataSend,
				dataType:"json",
				success:function(result){
					if(result.error_code=="24"){
						alert("加入购物车成功！");
						location.href="${root}/cart/cart.html";
					}else{
						alert("添加购物车失败");
					}
				}
					
			})
		})
			
			
	
		
		
		
		
	</script>
</body>
</html>