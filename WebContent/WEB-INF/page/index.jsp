<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<link href="${root }/css/slider.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/index.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="./comm/header.jsp" />
	<div class="container index">


		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
				<div class="title">
					<strong>热门商品</strong>
					<!-- <a  target="_blank"></a> -->
				</div>
				<ul class="tab">
					<li class="current"><a href="./蔬菜分类.htm?tagIds=1"
						target="_blank"></a></li>
					<li><a target="_blank"></a></li>
					<li><a target="_blank"></a></li>
				</ul>
				   <!-- 显示最热门的商品 -->
				<ul class="tabContent" style="display: block;" id="hots">
					
				</ul>
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
				<div class="title">
					<strong>最新商品</strong> <a target="_blank"></a>
				</div>
				<ul class="tab">
					<li class="current"><a href="./蔬菜分类.htm?tagIds=2"
						target="_blank"></a></li>
					<li><a target="_blank"></a></li>
					<li><a target="_blank"></a></li>
				</ul>
				<!-- 显示最新的商品 -->
				<ul class="tabContent" style="display: block;" id="news">
					
				</ul>
			
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>新手指南</dt>
					<dd>
						<a target="_blank">支付方式</a> |
					</dd>
					<dd>
						<a target="_blank">配送方式</a> |
					</dd>
					<dd>
						<a target="_blank">售后服务</a> |
					</dd>
					<dd>
						<a target="_blank">购物帮助</a> |
					</dd>
					<dd>
						<a target="_blank">蔬菜卡</a> |
					</dd>
					<dd>
						<a target="_blank">礼品卡</a> |
					</dd>
					<dd>
						<a target="_blank">银联卡</a> |
					</dd>
					<dd>
						<a target="_blank">亿家卡</a> |
					</dd>

					<dd class="more">
						<a>更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp" />
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	  $(function(){
		  $.ajax({
			  url:"${root}/items/index.action",
			  dataType:"json",
			  type:"post",
			  success:function(result){
				  if(result.error_code=='0'){
					  //显示最热门商品信息
					  $.each(result.error_msg1,function(index,items){
						  $("#hots").append($("<li><a href='${root}/items/itemDetail.html/"+items.id+"'><img src='${root}/image/"+items.titleimage+"' style='display: block;'></a></li>"));
					  });
					  //显示最新商品信息
                      $.each(result.error_msg2,function(index,items){
                    	  $("#news").append($("<li><a href='${root}/items/itemDetail.html/"+items.id+"'><img src='${root}/image/"+items.titleimage+"' style='display: block;'></a></li>"));
					  });
				  }
			  }
		  })
	  })
	</script>
</body>
</html>