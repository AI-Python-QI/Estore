
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="root" value="${pageContext.request.contextPath }"/>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>意坚教育-论坛</title>
    <link href="css/mycss.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery-1.12.4.min.js"></script>
    <style type="text/css">
    </style>
    <!-- <script type="text/javascript">
    $(function(){
        $("#input1").blur(function(){
            if(($('#usernick').val().length==0 )){
                $('#nick').html('<font color="red">'+'昵称不能为空！'+'</font>');
            }else {
                 $('#nick').html('<font color="green">'+'格式正确！！'+'</font>');
            }

    });

        $(function(){
            $("input").blur(function(){
                if(($('#newpassword').val().length == 0)||($('#newpassword').val().length <6||($('#newpassword').val().length >21))){
                    $('#npwd').html('<font color="red">'+'密码为6-20位英文、数字、符号，区分大小写！'+'</font>');
                }else if(($('#rnewpassword').val()!=$('#newpassword').val())){
                     $('#npwd').html('<font color="green">'+'格式正确！！'+'</font>');
                    $('#rnpwd').html('<font color="red">'+'两次密码输入不一致！'+'</font>');
                }else{
                 $('#rnpwd').html('<font color="green">'+'格式正确！！'+'</font>');

                }
                  });
        });
    </script> -->
</head>
<body>
<jsp:include page="./comm/homeheader.jsp"></jsp:include>
<!-- 布局中部 -->
<div id="middle">

    <div class="user-left">


        <div class="user-info">
            <p>
                <a href=""> <img class="user-pic" src="${userss.photo}"></a>
            </p>
            <font color="orange"> <p class='user-nikename'>${userss.nickname} </p></font>
            <p>
                <span>性别</span>${userss.sex}
            </p>

            <p>
                <span>最新登录</span> <fmt:formatDate value="${userss.logintime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </p>
            <p>
                <span>注册日期</span><fmt:formatDate value="${userss.registtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </p>

        </div>
    </div>

    <div class="user-right user-edit">

        <form action="${root}/FileUploadServlet" method="post" enctype="multipart/form-data">

            <input type="hidden" name="uid" value="${userss.id }">
            <table>
                <tbody>
                <tr>
                    <td class="title" colspan="2"><h5>头像修改</h5></td>

                </tr>
                <tr>
                    <td class="label"><img class="user-pic"
                                           src="${userss.photo}"/></td>
                    <!--type属性file是文件上传，不要写成text
                    encpype="multipart/form-data" 确保匿名上传不正确的编码（以二进制提交到后台，完成传输）
                    默认是 application/X-www-form-rulencode不能用上传文件						  -->
                    <td><input type="file" name="file"></td>
                </tr>
                <tr>
                    <td colspan="2" class="button">
                        <button type="submit" class="login-btn">确认修改</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <form action="${root}/EditUserInfoMServlet" method="post">
            <table>
                <tbody>
                <tr>
                    <td class="title" colspan="2"><h5>信息修改</h5></td>

                </tr>
                <tr>
                    <td class="label">昵称</td>
                    <td><input class="user-txt" placeholder="放逐之刃" name="nickname" id="input1"><span id="nick"></span></td>
                </tr>
                <tr>
                    <td class="label">性别</td>
                    <td><input type="radio" name="sex" checked="checked" value="男">男&nbsp;&nbsp;<input
                            type="radio" name="sex" value="女">女</td>
                </tr>
                <tr>
                    <td colspan="2" class="button">
                        <button type="submit" class="login-btn">确认修改</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

        <form action="${root}/EditUserInfoPServlet" method="post">
            <table>
                <tbody>
                <tr>
                    <td class="title" colspan="2"><h5>密码修改</h5></td>
                </tr>
                <tr>
                    <td class="label">原密码</td>
                    <td><input type="password" class="user-txt"
                               placeholder="原密码" name="pwd"></td>
                </tr>
                <tr>
                    <td class="label">新密码</td>
                    <td><input type="password" class="user-txt"
                               placeholder="新密码" name="newpwd" id="newpassword"><span id="npwd"></span></td>
                </tr>
                <tr>
                    <td class="label">确认新密码</td>
                    <td><input type="password" class="user-txt"
                               placeholder="确认新密码" name="rnpwd" id="rnewpassword"><span id="rnpwd"></span></td>
                </tr>
                <tr>
                    <td colspan="2" class="button">
                        <button type="submit" class="login-btn">确认修改</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>



    </div>

</div>

<jsp:include page="./comm/footer.jsp"></jsp:include>

</body>
</html>

