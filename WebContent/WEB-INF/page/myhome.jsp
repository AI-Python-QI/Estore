<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<!-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员信息</title>
    <link href="${root }/css/mycss.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
    <style type="text/css">
    </style>
    <style type="text/css">


	h1 {font-size: 12px; display : inline}
	h2 {font-size: 12px; display : inline}

</style>

</head>
<body>

<jsp:include page="./comm/homeheader.jsp"></jsp:include>


<!-- 布局中部 -->
<div id="middle">

    <div class="user-left">


        <div class="user-info">
            <p>
               <img class="user-pic" src="${root}/images/1.jpg">
               <%--  <img class="user-pic" src="${user.photo}"> --%>

            </p>
            <font color="orange">亲爱的会员: <p class='user-nikename'>${user.username} </p></font>
<%--            <p class='user-nikename'>${userinfo.nickname}</p>--%>
            <p>
                <span>性别: &nbsp;&nbsp;</span>${user.sex}
            </p>

            <%-- <p>
                <span>最近登录</span>  <fmt:formatDate value="${userinfo.logintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </p> --%>
            <p>
                <span>生日:</span> <fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>
            </p>
            
           <p>
                <span>邮箱: &nbsp;&nbsp;</span>${user.email}
            </p>
            <p>
                <span>phone: &nbsp;&nbsp;</span>${user.phone}
            </p>
          

        </div>
    </div>

    <div class="user-right text_list">

        <table>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>会员等级</th>
                <th>会员名称</th>
                <th><a href="${root }/cart/cart.html">购物车</a></th>
                <th>地址管理</th>
                <th>标签</th>
            </tr>
           
            <tr>
                <td>VIP 3</td>
                <td><a href="" >${user.name}</a></td>
                <td><a href="${root }/cart/cart.html">Go</a></td>
                <td><a href="" onclick="">${user.address}</a></td>
                <td>吃货ing</td>
            </tr>
        </table>
        
     
        
        <div style="float:left ">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       	
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font color="orange"><h2>会员信息修改</h2></font><br>
        	邮箱：<input id="email"  name="email" type="text" width="80px"><span id="remail"></span><br><br>
        	微信：<input type="text" id="wechat" name="wechat" width="80px"><span id="cwechat"></span><br><br>
        	
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	
        	<input type="button" id="btn1" name="修改" onclick="btn1()" value="2020~GO">      
        </div>
        
          <div style="float:left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font color="orange"><h2>会员昵称修改</h2></font><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新昵称：<input id="nickname" name="nickname" type="text" width="80px"><span id="nick"></span><br><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认昵称：<input  id="newnickname"  name="newnickname" type="text" width="80px"><span id="newnick"></span><br><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="button" name="修改" id="btn2" onclick="btn2()" value="2020~GO">      
        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
          <div style="float:left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font color="orange"><h2>会员密码修改</h2></font><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：&emsp;<input id="password" name="password" type="password" ><span id="pwd"></span><br><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码：<input id="newpassword" name="newpassword"type="password"><span id="npwd"></span><br><br>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="button" name="修改" id="btn3" onclick="btn3()" value="2020~GO">     
        </div>
          
        
    </div>
  <div class="user-right text_list">
  	<table>
  		<tr>
  			<th>配送地址：</th>
  		</tr>
  	</table>
  	<br>
  	  <font color="orange"><h2>默认配送地址：</h2></font>
          <select style="width:300px">
				<option value="1">艾欧尼亚</option>
				<option value="2">比尔吉沃特</option>
				<option value="3">山东省青岛市空中花园</option>
				<option value="4" selected>月球环形山2020号环形坑</option>
				<option value="5">爪哇岛</option>
			</select>
  </div>

</div>
	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	function btn1(){
		var email = $("#email").val();
		var wechat = $("input[name='wechat']").val();
		if(email==""){
			alert("email为空！");
			return;
		}
		if(wechat==""){
			alert("微信为空！");
			return;
		}
		alert("信息修改成功！");
		location.href="${root}/myhome/myhome.html";
	}
	
	
	 //ajax 判断邮箱
	 $("#email").blur(function(){
			var name = $("#email").val();
			var reg=/^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/;
			var dataCheck ={"email":name}
			var tishi = document.getElementById("remail");
			$.ajax({
				url:"${root}/users/checkEmail",
				data:dataCheck,
				dataType:"json",
				success:function(result){
					if(result.error_code=="24"){ 
						if(reg.test(name)){
							tishi.innerHTML = "<font color='red' >√️</font>"
						}else{
							tishi.innerHTML = "<font color='red' >❌️️</font>"
						}
						
					}else{
						if(name==""){
							tishi.innerHTML = "<font color='red' >❌️️</font>"
						}else{
							tishi.innerHTML = "<font color='green' >√️️</font>"
						}	
					}			
				}
				
			})
		})
		
	function btn2(){
		var nickname = $("input[name='nickname']").val();
		var newnickname = $("input[name='newnickname']").val();
		if(nickname==""){
			alert("nickname为空！");
			return;
		}
		if(newnickname==""){
			alert("newnickname为空！");
			return;
		}
		if(nickname!=newnickname){
			alert("输入的不对哦！");
			return ;
		}
		alert("信息修改成功！");
		location.href="${root}/myhome/myhome.html";
	}
		
		//昵称判断
		$("#nickname").blur(function(){
		var tishi1 = document.getElementById("nick");
		var tishi2 = document.getElementById("newnick");
		var nickname = $("input[name='nickname']").val();
		var newnickname = $("input[name='newnickname']").val();
		if(nickname==""){
			tishi1.innerHTML = "<font color='red' >❌️️</font>"
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"			
		}	
	})	
		
	//ajax 微信判断
	$("#wechat").blur(function(){		
		var wechat = $("input[name='wechat']").val();
		var tishi1 = document.getElementById("cwechat");
		if(wechat==""){
			tishi1.innerHTML = "<font color='red' >❌️️</font>"
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"				
		}	
	})	
	
	
	//ajax 新昵称	
	$("#newnickname").blur(function(){
		var tishi1 = document.getElementById("nick");
		var tishi2 = document.getElementById("newnick");
		var nickname = $("input[name='nickname']").val();
		var newnickname = $("input[name='newnickname']").val();
		if(newnickname!=nickname){
			tishi2.innerHTML = "<font color='red' >❌️️</font>"
		}else {
			if(newnickname==""){
				tishi2.innerHTML = "<font color='red' >❌️️</font>"
			}else{
				tishi2.innerHTML = "<font color='green' >√️️</font>"			
			}				
		}	
	})	
	
	function btn3(){
		var password = $("input[name='password']").val();
		var newpassword = $("input[name='newpassword']").val();
		if(password==""){
			alert("password为空！");
			return;
		}
		if(newpassword==""){
			alert("newpassword为空！");
			return;
		}
		if(password!=newpassword){
			alert("输入的不对哦！");
			return ;
		}
		alert("密码修改成功！");
		location.href="${root}/myhome/myhome.html";
	}
	
	//密码
		$("#password").blur(function(){
		var tishi1 = document.getElementById("pwd");
		var password = $("input[name='password']").val();
		if(password==""){
			tishi1.innerHTML = "<font color='red' >❌️️</font>"
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"			
		}	
	})	
	
	//ajax 确认密码
	$("#newpassword").blur(function(){
		var tishi1 = document.getElementById("pwd");
		var tishi2 = document.getElementById("npwd");
		var nickname = $("input[name='password']").val();
		var newnickname = $("input[name='newpassword']").val();
		if(newnickname!=nickname){
			tishi2.innerHTML = "<font color='red' >❌️️</font>"
		}else {
			if(newnickname==""){
				tishi2.innerHTML = "<font color='red' >❌️️</font>"
			}else{
				tishi2.innerHTML = "<font color='green' >√️️</font>"			
			}				
		}	
	})	
	
		
	</script>
<jsp:include page="./comm/footer.jsp"></jsp:include>