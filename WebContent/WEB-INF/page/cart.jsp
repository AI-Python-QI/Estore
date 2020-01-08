<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>

<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/cart.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<jsp:include page="./comm/header.jsp"/>
	<div class="container cart">
		<div class="span24">
			<div class="step step1"></div>
			<table id="showcarts">
				<tbody>
					<tr>
					  <!--  <th><input type="checkbox" name="checks" value="1" id="ons" onclick="addMoneys()"></th> -->
					   <th><input type="checkbox" name="checks" id="remebercheck" onclick="hehe()"></th> 
						<th>图片</th>
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
				<em id="promotion"></em> <em> 登录后确认是否享有优惠 </em> 赠送积分: <em
					id="effectivePoint">0</em> 商品金额: <strong id="effectivePrice">￥<span id="totalsum" name="totalsum"></span>元</strong>
			</div>
			<div class="bottom">
				<a href="javascript:;" id="clear" class="clear">清空购物车</a> <a
					href="javascript:submits_order();" id="submit" class="submit">提交订单</a>
			</div>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp"/>
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	  
	//做加的操作
	function add(_this) {
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

	 
	var gid;
	var goodsNum; //商品库存
	
	//每次进入首先加载第一页的信息
	  $(function(){
		getChecked();
		loadData(1);
		
	  })
	  function loadData(pageNo){
		  $.ajax({
			  url:"${root}/cart/data/queryCartList/"+pageNo+"",
			  type:"post",
			  dataType:"json",
			  success:function(result){
				  if(result.error_code=='1'){
					  alert(result.error_msg);
					  location.href="${root}/users/login.html";
					  return false;
				  }else if(result.error_code=='0'){
					  var lists = result.error_msg;
					  var paged = result.page;
					  //var lists = $.parseJSON(data);
					  
					  //每次进入分页查询首先要清空上次追加的内容
					  $("tr[named=hehe]").remove();
					  $("div[named=hehe]").remove();
					  
					  console.log(lists);
					  
					  $.each(lists,function(index,cart){
						  
						  $("#showcarts").append(
								   $("<tr></tr>").attr("named","hehe")
								   .append($("<td></td>").html("<input type='checkbox' onclick='addMoney(this)'  name='check' value='"+cart.id+"' price='"+cart.item.estoreprice*cart.buyNum+"'>"))
								   .append($("<td></td>").attr("width","60").html("<img src='${root}/image/"+cart.item.titleimage+"'>"))
								   .append($("<td></td>").html("<a href='${root}/items/itemDetail.html/"+cart.item.id+"'>"+cart.item.name+"</a>"))
								   .append($("<td></td>").html("<span>￥</span><span>"+cart.item.estoreprice+"</span>"))
								   .append($("<td></td>").attr("class","quantity").attr("width","60").html("<button onclick='reduce(this)'  v='"+cart.id+"'  > - </button>"+"<span id='goodsnum' pri='"+cart.item.estoreprice+"' maxnum='"+cart.item.num+"' >"+cart.buyNum+"</span>"+"<button v='"+cart.id+"'  onclick='add(this)'> + </button>"))
								   .append($("<td></td>").attr("width","140").html("<span>￥</span><span id='"+cart.id+"'  value='"+cart.item.estoreprice*cart.buyNum+"' class='subtotal'>"+cart.item.estoreprice*cart.buyNum+"</span>"))
								   .append($("<td></td>").html("<button type='button' onclick='deleteC(this)'  id='deletes' name='bbb' value='"+cart.id+"' class='delete'>删除</button>"))
						 
						  );
					  });
					  
					
						
					  
					  var div = $("<div></div>").attr("named","hehe").append(function(){
						  var $div = $("<div></div>").attr("class","pagination");
						  //第一页
						  $("<span class='firstPage'></span>").html("&nbsp;").click(function(){
							 loadData(1); 
						  }).appendTo($div);
						  
						  //上一页
						  $("<span class='previousPage'></span>").html("&nbsp;").click(function(){
							 if(pageNo!=1){
								 loadData(pageNo-1);
							 } else{
								 loadData(1); 
							 }
						  }).appendTo($div);
						  //每一页
						  var changed = parseInt(pageNo/10)*10 ;
						  var begin = (changed==0?1:changed)-1;
						  if(begin<1){
							  begin=1;
						  }
						  var end = begin+11;
						  
						  if(end>paged){
							  end=paged;
						  }
						  for(var i=begin;i<=end;i++){
							  if(pageNo==i){
								  //当前页
								  $("<span class='currentPage'>"+i+"</span>").click(function(){loadData($(this).text())}).appendTo($div);
							  }else{
								  $("<a>"+i+"</a>").click(function(){loadData($(this).text())}).appendTo($div);
							  }
							  
						  }
						  //下一页
						  $("<span class='nextPage'></span>").html("&nbsp;").click(function(){
						       if(pageNo<paged){
						    	   loadData(pageNo+1);
						       }else{
						    	   loadData(paged);
						       }
						  }).appendTo($div);
						  //最后一页
						  $("<span class='lastPage'></span>").html("&nbsp;").click(function(){
						    	   loadData(paged);
						  }).appendTo($div);
						  
						  return $div;
					  }).appendTo($("#div"));
				  }
				
			  }
		  });
	  }
	  
	  
	  //清空购物车
	  $("#clear").click(function() {
		  $.ajax({
			  url:"${root}/cart/data/cart.clear",
			  dataType:"json",
			  type:"post",
			  success:function(result){
				  if(result.error_code=="24"){
					  alert("购物车已经清空了！");
					  location.href="${root}/cart/cart.html";
				  }
			  }
		  })
		  
	  })

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

	   /*提交订单*/
	   function submits_order(){
		   var obj = document.getElementsByName("check");
			var ids = [];
			for (i in obj) {
				if (obj[i].checked) {
					ids.push(obj[i].value);
				}
			}
			if(ids.length==0){
				alert("请选择商品!");
				return false;
			}
			location.href="${root}/order/order.html/"+ids+"";
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
	   
	  
	  
	   /*计算总钱数和赠送积分总和*/
	   function adds(){
		    obj = document.getElementsByName("check");
		    sum=0;
		    for(k in obj){
		        if(obj[k].checked){
		        	var id=$(obj[k]).val();
		        	var onePrice = $("#"+id+"").text();
		        	sum+=parseFloat(onePrice);
		        }
		    }
		    $('span[name="totalsum"]').text(sum);
		    $('span[name="totalsum"]').text(sum);
	   }
	  
	   
	   var checkedIds= [];//保存选中的id，亦适用于分页

	   /* 将选中的数据ID保存*/
	   /* $("#remebercheck").click(function(){
	       if($(this).is(":checked")){
	            checkedIds.push($(this).attr("id"));
	        }else{
	            for(var i=0; i<checkedIds.length; i++){
	                if($(this).attr("id") == checkedIds[i]){
	                checkedIds.splice(i, 1);
	                break;
	                }
	            }
	        }
	    });

		 //翻页后设置是否选中
		    function setChecked(){
		       var $boxes = $("#remebercheck");
		       for(var i=0;i<$boxes.length;i++){
		           var id = $boxes[i].id;
		           if(checkedIds.indexOf(id,0)!=-1){
		               $boxes[i].checked = true;
		           }else{
		               $boxes[i].checked = false;
		           }
		       }
		    } */
	
	   
	   
	    checkedIds="";//翻页保存选中的id
	      
       function changeIds(){
            var oneches=document.getElementsByName("checkbox");
          for(var i=0;i<oneches.length;i++){
              if(oneches[i].checked==true){
                  //避免重复累计id （不含该id时进行累加）
                  if(checkedIds.indexOf(oneches[i].value)==-1){
                      checkedIds=checkedIds+oneches[i].value+",";
                  }
              }
              if(oneches[i].checked==false){
                  //取消复选框时 含有该id时将id从全局变量中去除
                  if(checkedIds.indexOf(oneches[i].value)!=-1){
                      checkedIds=checkedIds.replace((oneches[i].value+","),"");
                  }
              }
          }
       }
  
 function getChecked(){
             var oneches=document.getElementsByName("checkbox");
          for(var i=0;i<oneches.length;i++){
                  //全局变量中含有id，则该复选框选中
                  if(checkedIds.indexOf(oneches[i].value)!=-1){
                      oneches[i].checked=true;
                  }
              }
       }
	    
	   
	</script>
</body>
</html>