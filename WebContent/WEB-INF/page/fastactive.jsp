<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>用户激活</title>



<script src="${root }/js/jquery-1.12.4.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="${root }/js/dmaku.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/dmaku.css">

</head>

<body>

	<header>
		<a href="./index.html" class="logo"></a>
		<div class="desc">激活账户</div>
	</header>
	<section>
		<form action="">
			<div class="register-box">
				<label for="email" class="other_label">确 认 邮 箱 <input
					maxlength="20" type="email" placeholder="请输入要激活的邮箱">
				</label>
				<div class="tips"></div>
			</div>
			
			<div class="register-box">
				<label for="active" class="other_label">邮箱验证码 <input
					maxlength="20" type="text">
				</label>
				<div class="tips"></div>
			</div>
			
			<div class="register-box">
				<label for="username" class="other_label">验 证 码 <input
					maxlength="20" type="text" placeholder="请输入验证码">
				</label> <span id="code"></span>
				<div class="tips"></div>
			</div>
			<div class="arguement">
				<input type="checkbox" id="xieyi"> 阅读并同意 <a href="#">《Estore用户注册协议》</a>
				<a href="#">《隐私政策》</a>
				<div class="tips"></div>
			</div>
			<div class="submit_btn">
				
				<button type="submit" id="submit_btn">立 即 注 册</button>
				
			</div>
		</form>
	</section>
	<script src="js/dmaku.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>