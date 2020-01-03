<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/cart.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="./comm/homeheader.jsp" />

<div class="container cart">
		<div class="span24">
			<div class="step step1"></div>
			<table id="showcarts">
				<tbody>
					<tr>
					 
						<th>订单编号</th>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>支付</th>
						
					</tr>
				
				</tbody>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div id="div"></div>
			<div class="total">
				
			</div>
			<div class="bottom">
				
			</div>
		</div>
	</div>
<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	//加载数据
	$(function(){
		$.ajax({
			url:"${root}/myhome/myorderall",
			dataType:"json",
			type:"post",
			success:(function(result){
				if(result.error_code=="24"){
					//alert("hello");
					//alert(error_msg.orderlist);
					console.log(result.error_msg1);
					var orderlist = result.error_msg1;
					//alert(orderlist);
					$.each(orderlist,function(index,order){
						
							 $("#showcarts").append(
									 $("<tr></tr>").attr("named","hehe")
									   .append($("<td></td>").attr("width","200").html(order.oid))
									   .append($("<td></td>").attr("width","60").html("<img src='${root}/image/"+order.items.titleimage+"'>"))
									   .append($("<td></td>").attr("width","100").html("<a href='${root}/items/itemDetail.html/"+order.items.id+"'>"+order.items.name+"</a>"))
									   .append($("<td></td>").html(order.items.estoreprice))
									   .append($("<td></td>").html(order.buynum))
									   .append($("<td></td>").attr("class","quantity").attr("width","60").html(order.items.estoreprice*order.buynum))									  
							)  
					})
			 }else{
				 alert("您还没登录鸭！");
				 location.href="${root}/users/login.html";
			 }
		})
	
	})
	})

</script>

<jsp:include page="./comm/footer.jsp"/>
</body>
</html>