<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="./comm/homeheader.jsp" />

<div class="container cart">
		<div class="span24">
			<div class="step step1"></div>
			<!-- <table id="showcarts">
				<tbody>
					<tr>
						<th>家庭地址</th>
						<th>公司地址</th>
						<th>学校地址</th>
						<th>代收地址</th>
						<th>设为默认</th>
					</tr> -->
					
					
					
					
					<!-- <tr>
						<th></th>
						<th>上海世纪大道114号楼3室</th>
						<th></th>
						<th></th>
						
						<th><input type="radio" name="checks" checked value="1" id="ons"></th>
					</tr>

					<tr>
						<th></th>
						<th></th>
						<th>上海世纪大道114号楼4室</th>
						<th></th>
						
						<th><input type="radio" name="checks" value="1" id="ons"></th>
					</tr>
					
					<tr>
						<th></th>
						<th></th>
						<th>上海世纪大道114号楼666室</th>
						<th></th>
						
						<th><input type="radio" name="checks" value="1" id="ons"></th>
					</tr>
		
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th>上海世纪大道114号楼777室</th>
					
						<th><input type="radio" name="checks" value="1" id="ons"></th>
					</tr> -->
					
					
			<!-- 	</tbody>
			</table> -->
			
			<img alt="" src="${root }/images/1x.jpg">
			<img alt="" src="${root }/images/2x.jpg">
			<img alt="" src="${root }/images/4x.jpeg">
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

<script type="text/javascript" src="${root }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">


</script>

</body>
</html>