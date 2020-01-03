<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单页面</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/cart.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<jsp:include page="./comm/header.jsp" />
	<div class="container cart">
		<div class="span24">
			<table id="table">
				<tr>
						<th><input type="checkbox" name="checks" onclick="hehe()"></th> 
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				<!-- <em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥0.00元</strong> -->
				<em id="effectivePoint"></em> 商品金额: <strong id="effectivePrice">￥<span id="totalsum" name="totalsum"></span>元</strong>
			</div>
			<form id="orderForm" method="post">
				<div class="span24">
					<p>
						请选择地址：省<select style="width: 80px;" id="province"
							onblur="_getCity(this);">
							<option value="1">--请选择--</option>
						</select> 市<select style="width: 80px;" id="city" onblur="_getArea(this);">
							<option value="1">--请选择--</option>
						</select> 区/县<select style="width: 80px;" id="area">
							<option value="1">--请选择--</option>
						</select><br> 详细收货地址：<input id="address" name="address" type="text"
							value="" style="width: 300px" onblur="output_val();" /> <span id="ad"></span><br />
						收货人&nbsp;&nbsp;&nbsp;：<input name="receivename" id="rec" type="text"
							value="" style="width: 150px" /><span id="us"></span> <br /> 联系方式：<input
							name="phone" id="phones"type="text" value="" style="width: 150px" /><span id="ph"></span>
					</p>
					<hr />
				</div>
			</form>
			<p style="text-align: right">
				<a href="javascript:confirm();"> <img
					src="${root }/images/finalbutton.gif" width="204" height="51"
					border="0" />
				</a>
			</p>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp" />
	<script type="text/javascript" src="${root }/js/dtree.js"></script>
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	//对详细地址进行校验
	$("#address").blur(function(){
		var tishi1 = document.getElementById("ad");
		var address = $("input[name='address']").val();
		if(address==""){
			tishi1.innerHTML = "<font color='red' >请务必输入详细地址哦！️️</font>"
			return false;
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"			
		}	
	})	

	$("#rec").blur(function(){
		var tishi1 = document.getElementById("us");
		var rec = $("input[name='receivename']").val();
		if(rec==""){
			tishi1.innerHTML = "<font color='red' >请务必输入正确的收货人姓名哦！️️</font>"
			return false;
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"			
		}	
	})	
	
	
	$("#phones").blur(function(){
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则 
		var tishi1 = document.getElementById("ph");
		var phones = $("input[name='phone']").val();
		if(!phoneReg.test(phones)){
			tishi1.innerHTML = "<font color='red' >请务必输入正确的手机号！️️</font>"
			return false;
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"			
		}	
	})	
	
	
	$(function(){
	  $.ajax({
		  url:"${root}/province/data/province?parentid=0",
	      type:"post",
	      dataType:"json",
	      success:function(result){
	    	  var error_code = result.error_code;
	    	  if(error_code=='1'){
	    		  var lists = result.error_msg;
	    		  for(var i=0;i<lists.length;i++){
	    			$("#province").append($("<option value='"+lists[i].codeid+"'></option>").html(lists[i].cityname));  
	    		  }
	    	  }
	      }
	  })	
	})
	
	function _getCity(_this){
		var parentid = _this.value;
		$.ajax({
			url:"${root}/province/data/province?parentid="+parentid+"",
		      type:"post",
		      dataType:"json",
		      success:function(result){
		    	  var error_code = result.error_code;
		    	  if(error_code=='1'){
		    		  var lists = result.error_msg;
		    		  for(var i=0;i<lists.length;i++){
		    			$("#city").append($("<option value='"+lists[i].codeid+"'></option>").html(lists[i].cityname));  
		    		  }
		    	  }
		      }
		})
	}
	function _getArea(_this){
		var parentid = _this.value;
		$.ajax({
			url:"${root}/province/data/province?parentid="+parentid+"",
		      type:"post",
		      dataType:"json",
		      success:function(result){
		    	  var error_code = result.error_code;
		    	  if(error_code=='1'){
		    		  var lists = result.error_msg;
		    		  for(var i=0;i<lists.length;i++){
		    			$("#area").append($("<option value='"+lists[i].codeid+"'></option>").html(lists[i].cityname));  
		    		  }
		    	  }
		      }
		})
	}
	 var address = null;
	  function output_val(){
		 var $province = $("#province option:selected").text();
		 if($province=="--请选择--"){
			 alert("请选择省份");
			 return false;
		 }
		 var $city = $("#city option:selected").text();
		 if($city=="--请选择--"){
			 alert("请选择城市");
			 return false;
		 }
		 var $area = $("#area option:selected").text();
		 if($area=="--请选择--"){
			 alert("请选择区域");
			 return false;
		 }
		 address = ($province+"省"+$city+"市"+$area);
	  }
	   $(function(){
		  $.ajax({
			   url:"${root}/order/data/confirmOrders/"+${ids}+"",
			   type:"post",
			   dataType:"json",
			   success:function(result){
				    if(result.error_code==0){
				    	var cartList=result.error_msg;
				    	console.log(cartList);
				    	$.each(cartList,function(index,cart){
				    		 $("#table").append(
				    			/* $("<tr></tr>").attr("id",cart.id).attr("named","hehe") */
				    			$("<tr></tr>").attr("named","hehe")
				    		 	/* .append($("<td width='80'></td>").html($("<input>").attr("type","checkbox").attr("value",cart.id).attr("name","check").attr("onblur","adda();")))  */
				    		 	 .append($("<td width='80'></td>").html("<input type='checkbox' onclick='addMoney(this)'  name='check' value='"+cart.id+"' price='"+cart.item.estoreprice*cart.buyNum+"'>"))
				    		 	.append($("<td width='80'></td>").html("<img src='${root}/image/"+cart.item.titleimage+"'>"))
				    		 	.append($("<td width='80'></td>").html($("<a href='${root}/estore/itemDetail.html/"+cart.item.id+"'>"+cart.item.name+"</a>")))
				    		 	.append($("<td width='80'></td>").html(cart.item.estoreprice))
				    		 	/* .append($("<td width='50'></td>").html(cart.buyNum)) */
				    		 	.append($("<td width='80'></td>").attr("class","quantity").attr("width","60").html("<button onclick='reduce(this)'  v='"+cart.id+"'  > - </button>"+"<span id='goodsnum' pri='"+cart.item.estoreprice+"' maxnum='"+cart.item.num+"' >"+cart.buyNum+"</span>"+"<button v='"+cart.id+"'  onclick='adda(this)'> + </button>"))
				    		 	/* .append($("<td width='50' id='price'></td>").html(cart.item.estoreprice*cart.buyNum)) */
				    		 	.append($("<td width='80'></td>").attr("width","140").html("<span>￥</span><span id='"+cart.id+"'  value='"+cart.item.estoreprice*cart.buyNum+"' class='subtotal'>"+cart.item.estoreprice*cart.buyNum+"</span>"))
				    		 	/* .append($("<td width='50'></td>").html($("<a href='${root}/"+cart.id+"'>删除</a>"))) */
				    		 	.append($("<td width='80'></td>").html("<button type='button' onclick='deleteC(this)'  id='deletes' name='bbb' value='"+cart.id+"' class='delete'>删除</button>"))
				    		 	/* .appendTo("#table") */
				    		 );
				    	});
				    	/* ----------------------------------------------------------------------- */
		  
				    	
		/* ----------------------------------------------------------------------------------------------- */		    	
				    	
				    	
				    };	
			   }, 
		       error:function(){
			     alert("服务器忙,请您稍后再试!");
		      }
		   });
	  }) 
	  
	  
	  /*-----------------------------------分界----------------------------------------------------------  */
	//做加的操作
	function adda(_this) {
		var id = $(_this).attr("v");//获取此条商品的ID cart.id
		var maxnum = $(_this).prev().attr("maxnum");//获取此商品的库存数量
		var pri = $(_this).prev().attr("pri");//单价
		var quantity = $(_this).prev().text();//购买数量
		//如果加到goodsNum不可再加
		if (quantity == maxnum	) {
			return;
		}
		quantity++;
		var price = pri*quantity;
		/* document.getElementById("quantity").value = quantity; */
		$(_this).prev().text(quantity);
		$("#"+id+"").text(price);
		$.ajax({
			url:"${root}/cart/data/updateNum/"+id+"/"+quantity+"",
			dataType:"json",
			Type:"post"
			
		})
	}
	//做减得操作
	function reduce(_this) {
		var id = $(_this).attr("v");//获取此条商品的ID cart.id
		var maxnum = $(_this).next().attr("maxnum");//获取此商品的库存数量
		var pri = $(_this).next().attr("pri");//单价
		var quantity = $(_this).next().text();//购买数量
		//如果减到1不可再减少
		if (quantity == 1) {
			return;
		}
		quantity--;
		var price = pri*quantity;
		$(_this).next().text(quantity);
		$("#"+id+"").text(price);
		$.ajax({
			url:"${root}/cart/data/updateNum/"+id+"/"+quantity+"",
			dataType:"json",
			Type:"post"	
		})
		
	}
	
	
	//删除商品
	  function deleteC(_this){
		  var id2 = $(_this).attr("value");
		  var id =$(_this).val();
		  $.ajax({
			  url:"${root}/cart/data/cart.delete/"+id+"",
			  dataType:"json",
			  type:"post",
			  success:function(result){
				 
				  if(result.error_code=="24"){
					  
					  location.href="${root}/cart/cart.html";
					  alert("删除成功！");
				  }else{
					  alert("删除失败");
					  
				  }
			  }
		  })
	}
	  
	
	
	  //全选
	  function hehe(){
	    	var check = document.getElementsByName("check");
	        if (document.getElementsByName("checks")[0].checked ==true) {
	    	     for (var i = 0; i < check.length; i++) {
	    	  	      check[i].checked=true;
	    	     }
	    	     sum=0;
	 		    for(k in check){
	 		        if(check[k].checked){
	 		        	var id=$(check[k]).val();
	 		        	console.log(id);
	 		        	var onePrice = $("#"+id+"").text();
	 		        	sum+=parseFloat(onePrice);
	 		        }
	 		    }
	 		    $('span[name="totalsum"]').text(sum);
	 		    $('span[name="totalsum"]').text(sum);
	        }else{
	    	     for (var i = 0; i < check.length; i++) {
	    	  	      check[i].checked=false;
	    	     }
	    	     $('span[name="totalsum"]').text(0);
		 		 $('span[name="totalsum"]').text(0);
	        }
	    }
	  
	
	//勾选框
	  function addMoney(_this){
		  var sum=0;
		  if($("input[name='check']").is(":checked")){//选中  
			    var id_array=new Array();  
			    var i=null;
			    $('input[name="check"]:checked').each(function(){  
				     var id =$(this).val();
				     i = $("#"+id+"").text(); 
				     //向数组中添加元素  
				     //id_array.push(i);
				     sum =sum + Number(i)
			    });  
			    console.log(sum);
			    
			    $('span[name="totalsum"]').html(sum);
			   }else{
			    $('span[name="totalsum"]').html(sum);
			   }
	  } 
	   
	  
	/*-------------------------------------------------------------------------------------------------  */
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  /*计算总钱数和赠送积分总和*/
	   function add(){
		    obj = document.getElementsByName("check");
		    sum=0;
		    for(k in obj){
		        if(obj[k].checked){
		        	var id=$(obj[k]).val();
		        	var onePrice = $("#"+id+"").children("td").eq(5).html();
		        	sum+=parseFloat(onePrice);
		        }
		    }
		    $("#effectivePrice").text("￥:"+sum+"元");
	   }
	  
	  /*提交订单*/
	  function confirm(){
		 var obj = document.getElementsByName("check");
			var ids = [];
			for (i in obj) {
				if (obj[i].checked) {
					ids.push(obj[i].value);
				}
			}
			if(ids.length==0){
				alert("请选择您要提交的商品!");
				return false;
			}
		var address1 = $("input[name=address]").val();
		var receivename = $("input[name=receivename]").val();
		var phone = $("input[name=phone]").val();
		address=address+address1;
		//alert(address)
		if(address1==""){
			alert("请完善收货地址信息！");
			return false;
		}
		if(receivename==""){
			alert("请完善收件人姓名！");
			return false;
		}
		if(phone==""){
			alert("请填写手机号！");
			return false;
		}
		var sendData={
				"address":address,
				"receivename":receivename,
				"phone":phone
		};
		$.ajax({
			   url:"${root}/order/data/orderItemsInsert/"+${ids}+"",
			   type:"post",
			   dataType:"json",
			   data:sendData,
			   success:function(result){
				   if(result.error_code==1){
					   //alert(result.error_msg);
					   location.href="${root}/order/myorder.html";
					   return true;
				   }else{
					   location.href="${root}/order/order.html/${ids}"
					   return false;
				   }
				   
			   },error:function(a,b,c){
				   alert(a);
			   }
		 })
	  }
	</script>
</body>
</html>