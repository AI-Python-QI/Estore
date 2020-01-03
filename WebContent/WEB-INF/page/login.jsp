<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员登录</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/login.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.code {
	font-family: Arial;
	font-style: italic;
	font-weight: bold;
	border: 0;
	letter-spacing: 3px;
	color: blue;
}
</style>


</head>
<jsp:include page="./comm/header.jsp"></jsp:include>
<body>

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
						<strong>会员登录</strong>USER LOGIN | <a href="./fastlogin.html"><strong>快速登录</strong>FAST
							LOGIN</a>
					</div>

					<table>
						<tbody>
							<tr>
								<th>用户名/E-mail:</th>
								<td><input type="text" value="${cookie.username.value}"
									id="name" name="name" class="text" maxlength="20"><span id="uname"></span></td>
							</tr>
							<tr>
								<th>密&nbsp;&nbsp;码:</th>
								<td><input type="password" id="password" name="password"
									class="text" maxlength="20" autocomplete="off" onblur=""><span id="upassword"></span> </td>
							</tr>
							<%-- <tr>
								<th>验证码:</th>
								<td><span class="fieldSet">
										<div id="v_container" style="width: 150px; height: 30px;"></div>
										<input type="text" id="code_input" value="" placeholder="请输入验证码">
										<button id="my_button">验证</button>
								</span> <canvas id="v_container"  style="width: 150px; height: 30px;"></canvas></td>
							</tr> --%>
							<tr>
								<!-- <div id="v_container" style="width: 150px; height: 30px;"></div>
							<input type="text" id="code_input" value="" placeholder="请输入验证码" />
							<button id="my_button">验证</button> -->
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td><label> <input type="checkbox" id="remeberme"
										name="isRememberUsername" value="1"${cookie.temp.value==1?"checked":""}>记住用户名
								</label> <label> &nbsp;&nbsp;<a href="./forgetpassword">找回密码</a>
								</label></td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td><input type="button" id="btn" class="submit"
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
				</div>
			</div>
		</div>
	</div>
</body>

<jsp:include page="./comm/footer.jsp" />

<%-- <script src="${root }/js/gVerify.js"></script>
<script>
	var verifyCode = new GVerify("v_container");
	document.getElementById("my_button").onclick = function() {
		var res = verifyCode
				.validate(document.getElementById("code_input").value);
		if (res) {
			alert("验证正确");
		} else {
			alert("验证码错误");
		}
	}
</script> --%>
<script type="text/javascript" src="${root }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$("#btn").click(function() {
		var name = $("input[name='name']").val();
		var password = $("input[name='password']").val();
		var remeberme = $("#remeberme").val();
		var tishi = document.getElementById("uname");
		var tishi2 = document.getElementById("upassword");
		//利用js和正则表达式进行校验
		var code_input = $("input[name='code_input']").val();
		
		var sendData = {
			"name" : name,
			"password" : password,
			"remeberme" : remeberme
		};

		if (name.length == 0) {
			//alert("用户名或邮箱为空！");
			tishi.innerHTML = "<font color='red' >用户名不能为空！️</font>"
			return false;
		}

		if (password.length == 0) {
			tishi2.innerHTML = "<font color='red' >密码不能为空！️</font>" 
			return false;
		}else{
			tishi2.innerHTML = null; 
		}

		$.ajax({
			url : "${root}/users/login.action",
			type : "POST",
			data : sendData,
			dataType : "json",
			success : function(result) {

				if (result.error_code == '0') {
					//页面跳转
					alert("登录成功！")
					location.href = "${root}/items/index.html";

					/* alert(result.error_msg); */
				} else {
					//页面跳转
					alert("登录失败！")
					return false;
				}
			}
		})

	})
	
	
	
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
					tishi.innerHTML = "<font color='green' >欢迎您:" + name + " 会员！️</font>"
				}else{
					if(name==""){
						tishi.innerHTML = "<font color='red' > 输入不能为空！️️</font>"
					}else{
						tishi.innerHTML = "<font color='red' > 该用户还没有注册！️️</font>"
					}	
				}			
			}
			
		})
		
		
	})
	

	
	
	
	
	
</script>




</html>