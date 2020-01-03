<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="hotProductCategory" id="categories">
				
</div>
<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
  $(function(){
	  $.ajax({		 
		 url:"${root}/category/queryCategory", 
		 type:"post",
		 dataType:"json",
		 success:function(result){			 
			 if(result.error_code=="24"){
				
				 var categories = result.category;
				 $.each(categories,function(index,category){
					console.log(category.pid)
					 $("#categories").append($("<dl></dl>").attr("class","last").attr("id",category.id).append(
						 $("<dt></dt>").html("<a href='${root}/items/makesuit.html/"+category.pid+"/"+category.id+"'>"+category.type+"</a>")));
					 
					 $.each(category.lists,function(index,zi){
						 
						 $("#"+category.id+"").append($("<dd></dd>").html("<a href='${root}/items/makesuit.html/"+zi.pid+"/"+zi.id+"'>"+zi.type+"</a>"));
					 });
				 });
				}

			}
		});
	})
</script>
</body>
</html>