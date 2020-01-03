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
					    <th><input type="checkbox" name="checks" value="1" id="ons"></th>
						<th>订单编号</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
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







<jsp:include page="./comm/footer.jsp"/>
</body>
</html>