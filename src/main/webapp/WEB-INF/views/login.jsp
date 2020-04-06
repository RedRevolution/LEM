<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="BasePath" value="${pageContext.request.contextPath}" />

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录页面</title>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" type="text/css" rel="stylesheet">

<script type="text/javascript" language="JavaScript">
    $(document).ready(function () {
        $("#register").click(function () {
            window.location.href = "${BasePath}/register";
        })
        $("#login").click(function () {
            if($("#username").val() == ''){
                alert("用户名不能为空!");
                return;
            }
            if($("#password").val() == ''){
                alert("密码不能为空!");
                return;
            }
            $.ajax({
                type: "post",
                url: "${BasePath}/login_check",
                data: {
                    "username": $("#username").val(),
                    "password": $("#password").val()
                },
                dataType: "JSON",
                success: function (data) {
                    if (data == 1) {
                        alert("登录成功！");
                        window.sessionStorage.setItem("username",$("#username").val());
                        window.location.href = "${BasePath}/listEquipment";
                    }
                    else if(data == -1){
                        alert("用户不存在！请重新输入！");
                    }
                    else if(data == 0){
                        alert("密码错误！请重新输入！");
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

    <div class="addDIV">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">实验室设备管理系统</h3>
            </div>

            <div class="panel-body">
                <table class="addTable">
                    <tr>
                        <td>用户名：</td>
                        <td><input class="mytxt" type="text" name="username" id="username" placeholder="请在这里输入用户名"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input class="mytxt" type="password" name="password" id="password" placeholder="请在这里输入密码"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="button" id="login" value="登录" class="btn btn-success">
                            <input type="button" id="register" value="注册" class="btn btn-info">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>