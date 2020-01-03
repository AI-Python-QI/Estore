<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<link href="${root}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root}/css/product.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<jsp:include page="./comm/header.jsp" />
	<div class="container productList">
		<div class="span6">
			<jsp:include page="./comm/left.jsp"></jsp:include>
		</div>
		<div class="span18 last">

			<form id="productForm"
				action="./image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value=""> <input
					type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">

				<div id="result" class="result table clearfix">
					<ul id="display">
						<%-- <li><a href=""> <img
								src="/upload/image/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg"
								width="170" height="170" style="display: inline-block;"> <span
								style='color: green'> 大冬瓜 </span> <span class="price">
									商城价： ￥4.78/份 </span>

						</a></li> --%>
						
					</ul>
				</div>
				<div class="pagination">
					<span class="firstPage">&nbsp;</span> <span class="previousPage">&nbsp;</span>
					<span class="currentPage">1</span> <a
						href="javascript: $.pageSkip(2);">2</a> <a class="nextPage"
						href="javascript: $.pageSkip(2);">&nbsp;</a> <a class="lastPage"
						href="javascript: $.pageSkip(2);">&nbsp;</a>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp" />
   <script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript">
       $(function(){
    	   $.ajax({
    		   url:"${root}/items/data/makesuit/${pid}/${id}",
    		   type:"post",
    		   dataType:"json",
    		   success:function(result){
    			   if(result.error_code=='24'){
    				   $.each(result.items,function(index,items){
    					   $("#display").append($("<li><a href='${root}/items/itemDetail.html/"+items.id+"'><img src='${root}/image/"+items.titleimage+"' width='170' height='170' style='display: inline-block;'><span style='color: green'>"+items.name+"</span><span class='price'>商城价： ￥"+items.estoreprice+"/份 </span></a></li>"));
    				   })
    			   }
    		   }
    	   })
       })
   
   </script>
</body>
</html>