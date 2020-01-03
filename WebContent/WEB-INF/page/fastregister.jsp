<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>快速注册</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/login.css" rel="stylesheet" type="text/css" />
</head>
<jsp:include page="./comm/header.jsp"></jsp:include>
<body>

	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${root }/image/login.jpg" width="500" height="330"
					alt="会员登录" title="快速注册">
			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN | <a href="./fastlogin.html"><strong>快速注册</strong>FAST
							LOGIN</a>
					</div>

					<table>
						<tbody>
							<tr>
								<th>用户名:</th>
								<td><input type="text" id="name" name="username"
									class="text" maxlength="20"> <span id="uname"></span></td>
							</tr>
							<tr>
								<th>新&nbsp;密&nbsp;码:</th>
								<td><input type="password" id="password" name="password"
									class="text" maxlength="20" autocomplete="off"><span id="rpassword"></span></td>
							</tr>

							<tr>
								<th>确&nbsp;认&nbsp;密&nbsp;码:</th>
								<td><input type="password" id="newpassword"
									name="newpassword" class="text" maxlength="20"
									autocomplete="off"><span id="rnewpassword"></span></td>
							</tr>

							<tr>
								<th>手机号:</th>
								<td><input type="text" id="phone" name="phoneno"
									class="text" maxlength="11" /> <span id="uphone"></span></td>
							</tr>

							<tr>
								<th>短信验证码:</th>
								<td><span class="fieldSet"> <input id="message"
										type="text" name="msgcode" class="text" maxlength="6" />
										<input id="btnSendCode1" type="button" class="btn btn-default"
										value="获取验证码" onClick="sendMessage1()" />
								</span></td>

							</tr>


							<%-- <tr>
								<th>验证码:</th>
								<td><span class="fieldSet"> <input type="text"
										id="captcha" name="captcha" class="text captcha" maxlength="4"
										autocomplete="off">
								</span>
								<canvas id="myCanvas" width="70px" height="27px"
										style=" border: 1px solid #d3d3d3;"></canvas></td>
							</tr>
 --%>

							<tr>
								<th>&nbsp;</th>
								<td><input type="button" onclick="returnMessage()" id="btn"
									class="submit" value="快速注册"></td>
							</tr>
							<tr class="register">
								<th>&nbsp;</th>
								<td>
									<dl>

										<dd>
											立即注册即可体验在线购物！ <a href="./register.html">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<jsp:include page="./comm/footer.jsp" />
<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则 
	var count = 60; //间隔函数，1秒执行
	var InterValObj1; //timer变量，控制时间
	var curCount1;//当前剩余秒数

	curCount1 = count;
	
	/*第一*/
	function sendMessage1() {
		var phone = $.trim($("#phone").val());
		var username = $("input[name='username']").val();//username 邮箱不能修改密码
		var password = $("input[name='password']").val();
		var newpassword = $("input[name='newpassword']").val();
		var phoneno = $("input[name='phoneno']").val();
		var msgcode = $("input[name='msgcode']").val();

		if (!phoneReg.test(phone)) {
			alert(" 请输入有效的手机号码");
			return false;
		}
		//设置button效果，开始计时
		$("#btnSendCode1").attr("disabled", "true");
		$("#btnSendCode1").val(+curCount1 + "秒再获取");
		InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次
		//向后台发送处理数据,把获取到的手机号发送到后端
		var updateDate = {
			"phoneno" : phoneno,
			"newpassword" : newpassword,
			"username" : username
		};

		$.ajax({
			url : "${root}/users/forgetpassword.check",
			type : "POST",
			data : updateDate,
			dataType : "json"
	

		})
	

	}

	function returnMessage() {
		var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;//手机号正则 
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		var newpassword = $("input[name='newpassword']").val();
		var phoneno = $("input[name='phoneno']").val();
		var msgcode = $("input[name='msgcode']").val();
		//利用js和正则表达式进行校验

		var sendData = {
			"username" : username,
			"password" : password,
			"newpassword" : newpassword,
			"phoneno" : phoneno,
			"msgcode":msgcode

		};

		if (username.length == 0) {
			alert("用户名为空！");
			return false;
		}

		if (password.length == 0) {
			alert("请输入新的密码");
			return false;
		}

		if (newpassword.length == 0) {
			alert("请确认新的密码");
			return false;
		}

		if (password != newpassword) {
			alert("两次输入密码不一致！");
			return false;
		}

		if (!phoneReg.test(phoneno)) {
			alert("请输入有效的手机号码");
			return false;
		}
		if (msgcode.length == 0) {
			alert("请输入验证码！");
			return false;
		}

		$.ajax({
			url : "${root}/users/forgetpassword.check3",
			type : "POST",
			data : sendData,
			dataType : "json",
			success : function(result) {
				if(result==null){
					alert("请点击获取验证码！");
					return false;
				}
				
				if (result.error_code == '36') {
					//页面跳转
					alert("快速注册成功！")
					location.href = "${root}/users/login.html";

					/* alert(result.error_msg); */
				} else {
					//页面跳转
					alert("注册失败！请再次确认信息！")
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
	
	
	$("#name").blur(function(){
		var name = $("#name").val();
		var password =$("#password").val();
		var dataCheck ={"name":name}
		var tishi = document.getElementById("uname");
		var tishi2 = document.getElementById("upassword")
		$.ajax({
			url:"${root}/users/checkusername",
			data:dataCheck,
			dataType:"json",
			success:function(result){
				if(result.error_code=="24"){ 
					tishi.innerHTML = "<font color='red' >" + name + " 账户已存在！️</font>"
				}else{
					if(name==""){
						tishi.innerHTML = "<font color='red' > 输入不能为空！️️</font>"
					}else{
						tishi.innerHTML = "<font color='green' > 可以注册！️️</font>"
					}	
				}			
			}
			
		})
		
		
	})
	
	
	

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
					tishi.innerHTML = "<font color='red' >此号码已注册！️</font>"
				}else{
					if(phone==""){
						tishi.innerHTML = "<font color='red' > 输入不能为空！️️</font>"
					}else{
						if(phone.length<11){
							tishi.innerHTML = "<font color='red' > 手机号格式错误！️️</font>"
						}else{
							tishi.innerHTML = "<font color='green' > 可以注册！️️</font>"
						}
						
					}	
				}			
			}
			
		})
		
		
	})
	
	
	
	$("#password").blur(function(){
		var tishi1 = document.getElementById("rpassword");
		var tishi2 = document.getElementById("rnewpassword");
		var password = $("input[name='password']").val();
		var newpassword = $("input[name='newpassword']").val();
		if(password==""){
			tishi1.innerHTML = "<font color='red' >密码不能为空！️️</font>"
		}else {
			tishi1.innerHTML = "<font color='green' >√️️</font>"
		}		
	})	
	
	$("#newpassword").blur(function(){
		var password = $("input[name='password']").val();
		var newpassword = $("input[name='newpassword']").val();
		var tishi1 = document.getElementById("rpassword");
		var tishi2 = document.getElementById("rnewpassword");
		if(password!=newpassword){
			tishi2.innerHTML = "<font color='red' >❌</font>"
		}else{
			if(newpassword==""){
				tishi2.innerHTML ="<font color='red'>密码不能为空！</font>"
			}else{
				tishi2.innerHTML = "<font color='green' >√</font>"
			}
			
		}
	})
	
	
	
</script>



</html>