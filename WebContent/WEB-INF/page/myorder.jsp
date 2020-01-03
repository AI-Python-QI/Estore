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
</head>
<body>
	<jsp:include page="comm/header.jsp" />
	<div class="container cart">
		<div class="span24">
			<table id="table">
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				<em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥0.00元</strong>
			</div>
			<div class="span24">
			  <p>
				 <div id="orderid"></div><br>
				 <div id="createtime"></div><br>
				 <div id="totalprice"></div><br>
				 <div id="receivename"></div><br>
				 <div id="address"></div><br>
				 <div id="phone"></div><br>
				 <div id="status"></div><br>	         
			  </p>
			  <p>
						选择银行：<br /> <input type="radio" name="pd_FrpId"
							value="ICBC-NET-B2C" checked="checked" /> 支 付 宝  <img
							src="${root }/bank_img/zhifubao.jpg" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
							src="${root }/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
							src="${root }/bank_img/abc.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
							src="${root }/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
						<img src="${root }/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
							src="${root }/bank_img/ccb.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
							src="${root }/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
						<img src="${root }/bank_img/cmb.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId"
							value="ICBC-NET-B2C"/>工商银行 <img
							src="${root }/bank_img/icbc.bmp" align="middle" />
					</p>
					<hr/>
					<p style="text-align: right">
						<a
							href="javascript:alipay();">
							<img src="${root }/images/finalbutton.gif" width="204" height="51"
							border="0" />
						</a>
					</p>
				</div>
		        <hr />
		</div>
	</div>
	<jsp:include page="comm/footer.jsp" />
	<script type="text/javascript" src="${root }/js/dtree.js"></script>
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	Date.prototype.format = function(format) {  
	    var o = {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3) / 3), 
	        "S" : this.getMilliseconds()  
	    // millisecond  
	    }  
	  
	    if (/(y+)/.test(format)) {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
	                .substr(4 - RegExp.$1.length));  
	    }  
	  
	    for ( var k in o) {  
	        if (new RegExp("(" + k + ")").test(format)) {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  
	                    : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	}
	  $(function(){
		  $.ajax({
			   url:"${root}/order/data/confirmorder",
			   type:"post",
			   dataType:"json",
			   success:function(result){
				    if(result.error_code==1){
				    	var orderItemsList=$.parseJSON(result.error_msg1);
				    	$.each(orderItemsList,function(index,orderItems){
				    		$("<tr></tr>").attr("id",orderItems.id).attr("named","page"). 
				    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+orderItems.items.titleimage+"'>")).
				    		 append($("<td width='150'></td>").html($("<a href='${root}/items/itemDetail.html/"+orderItems.items.id+"'>"+orderItems.items.name+"</a>"))).
				    		 append($("<td width='50'></td>").html(orderItems.items.estoreprice)).
				    		 append($("<td width='50'></td>").html(orderItems.buynum)).
				    		 append($("<td width='50' id='price'></td>").html(orderItems.items.estoreprice*orderItems.buynum))
				    		.appendTo("#table")
				    	});
				    	var o =result.error_msg2;
				    	var dateStr=new Date(o.createtime);
				    	var dateTemp=dateStr.format("yyyy-MM-dd hh:mm:ss");
				    	$("#effectivePrice").html("￥:"+o.totalprice);
				    	$("#orderid").html("订单编号:"+o.id);
				    	$("#createtime").html("订单创建时间:"+dateTemp);
				    	$("#totalprice").html("订单总金额:"+"￥"+o.totalprice);
				    	$("#receivename").html("收件人姓名:"+o.receivename);
				    	$("#address").html("收货地址:"+o.address);
				    	$("#phone").html("联系电话:"+o.phone);
				    	$("#status").html(o.status==0?"订单状态:未支付":"订单状态:已支付");
				    };	
			   },
		      error:function(){
			     alert("服务器忙,请您稍后再试!");
		      }
		   });
	  })
	 function alipay(){
		  var $orderid=$("#orderid").text();
		  var $totalprice=$("#totalprice").text();
		  
		  var orderid=$orderid.slice(5);
	      var totalprice=$totalprice.slice(7);
	      var sendData={"orderId":orderid,"money":totalprice};
		 $.ajax({
			   url:"${root}/order/data/alipay",
			   type:"post",
			   dataType:"json",
			   data:sendData,
			   success:function(result){
				   //alert(result.error_msg);
				   location.href="${root}/order/test.html";
			   }
		  })
	  }
	</script>
</body>
</html>