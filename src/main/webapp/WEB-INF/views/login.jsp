<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录页面</title>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

<script type="text/javascript" language="JavaScript">
    $(document).ready(function () {
        $("#login").click(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/login_check",
                data: {
                    "username": $("#username").val(),
                    "password": $("#password").val()
                },
                dataType: "JSON",
                success: function (data) {
                    if (data == 1) {
                        alert("登录成功")
                        window.location.href = "${pageContext.request.contextPath}/listEquipment";
                    } else {
                        alert("用户名或密码错误，请重新输入！");
                    }
                },
                error: function () {
                    alert("提交失败");
                }
            });
        })
    })
</script>
</head>

<body>

<%--用户名：<input type="text" name="username" id="username"><br>--%>
<%--密码：<input type="password" name="password" id="password"><br>--%>
<%--<input type="button" value="登录" id="login">--%>
<%--<hr>--%>

<div class="addDIV">

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">实验室设备管理系统</h3>
        </div>
        <div class="panel-body">

            <form method="post" action="${pageContext.request.contextPath}/addEquipment" role="form">
                <table class="addTable">
                    <tr>
                        <td>用户名：</td>
                        <td><input type="text" name="username" id="username" placeholder="请在这里输入用户名"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password" id="password" placeholder="请在这里输入密码"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="button" id="login" value="登录" class="btn btn-success">
                        </td>

                    </tr>

                </table>
            </form>
        </div>
    </div>

</div>

</body>
</html>