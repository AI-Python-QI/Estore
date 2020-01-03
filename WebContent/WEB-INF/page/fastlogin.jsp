<%@page import="com.lishan.estore.util.SendCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速登录</title>

<link href="${root}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root}/css/login.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<jsp:include page="./comm/header.jsp" />
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${root }/image/login.jpg" width="500" height="330"
					alt="会员登录" title="会员登录">
			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>快速登录</strong>QUICK LOGIN <a href="./login.html"><strong>会员登录</strong>USER
							LOGIN</a>
					</div>
					<%-- <form id="loginForm" action="${root }/user/login" method="post">--%>
						<table> 
							<tbody>
								<tr>
									<th>手机号:</th>
									<td><input type="text" id="phone" name="phoneno"
										class="text" maxlength="11"  /> <span id="uphone"></span></td>
								</tr>

								<tr>
									<th>短信验证码:</th>
									<td><span class="fieldSet"> <input id="message"
											type="text" name="msgcode" class="text" maxlength="6"
											/> <input
											id="btnSendCode1" type="button" class="btn btn-default"
											value="获取验证码" onClick="sendMessage1()" />
									</span></td>
									
								</tr>

								<tr>
									<th>&nbsp;</th>
									<td><input id="btn" type="button" onclick="returnMessage()" class="submit"
										value="登 录"></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线购物！ <a href="./register.html">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						 </table>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./comm/footer.jsp" />

	<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		
	
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则 
		var count = 60; //间隔函数，1秒执行
		var InterValObj1; //timer变量，控制时间
		var curCount1;//当前剩余秒数
		
		var msgcode = $("input[name='msgcode']").val();
		/*第一*/
		function sendMessage1() {
			curCount1 = count;	
			var phone = $.trim($("#phone").val());
			if (!phoneReg.test(phone)) {
				 alert(" 请输入有效的手机号码"); 
				return false;
			}
			//设置button效果，开始计时
			$("#btnSendCode1").attr("disabled", "true");
			$("#btnSendCode1").val(+curCount1 + "秒再获取");
			InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次
			//向后台发送处理数据,把获取到的手机号发送到后端
			var phoneNum ={"phoneNum":phone,
							"msgcode":msgcode
							};
			$.ajax({
				url : "${root}/users/fastlogin.check1",
				type : "POST",
				data : phoneNum,
				dataType : "json"
				
			})
	
		}
			
		function returnMessage(){
			var phone = $("input[name='phoneno']").val();
			var msgcode = $("input[name='msgcode']").val();
			//判断电话是否为空
			if (!phoneReg.test(phone)) {/* 
				alert(phone);
				alert(" 请输入有效的手机号码,怎么回事小老弟 "); */
				return false;
			}
			//判断验证码是否为空
		/* 	alert("验证码"+msgcode); */
			if(msgcode==""){
				alert("验证码为空！");
				return false;
			}
			var phoneNum ={"phoneNum":phone,"msgcode":msgcode};
			$.ajax({
				url : "${root}/users/fastlogin.check2",
				type : "POST",
				data : phoneNum, 
				dataType : "json",
				success : function(result) {
					
					if (result.error_code == "24") {
						//页面跳转
						alert("验证成功，正在登陆。。。。")
						location.href = "${root}/items/index.html";
					} else {
						//页面跳转
						alert("验证失败，请确认手机或验证码正确！")
						return false;
					}
				}
			})
			
			
		}

		function SetRemainTime1() {
			if (curCount1 == 0) {
				window.clearInterval(InterValObj1);//停止计时器
				$("#btnSendCode1").removeAttr("disabled");//启用按钮
				$("#btnSendCode1").val("重新发送");
			} else {
				curCount1--;
				$("#btnSendCode1").val(+curCount1 + "秒再获取");
			}
		}


		
		$("#phone").blur(function(){
			var phone = $("#phone").val();
			var dataCheck ={"phone":phone}
			var tishi = document.getElementById("uphone");
			$.ajax({
				url:"${root}/users/checkphone",
				data:dataCheck,
				dataType:"json",
				success:function(result){
					if(result.error_code=="24"){ 
						tishi.innerHTML = "<font color='green' >欢迎您:" + phone + "️</font>"
					}else{
						if(phone==""){
							tishi.innerHTML = "<font color='red' > 输入不能为空！️️</font>"
						}else{
							tishi.innerHTML = "<font color='red' > 该用户还没有注册！️️</font>"
						}	
					}			
				}
				
			})
			
			
		})
		
		
	
	</script>
</body>
</html>