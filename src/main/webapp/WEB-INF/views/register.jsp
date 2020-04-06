<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="BasePath" value="${pageContext.request.contextPath}" />

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册界面</title>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" language="JavaScript">
        $(document).ready(function () {
            $("#register").click(function () {
                var bool = true;
                $("table :input").each(function(){
                    if($(this).val() == ''){
                        alert(this.name+'不能为空！');
                        bool = false;
                        return false;
                    }
                });
                if(bool == false)return;
                if($("#password").val() != $("#password-test").val()){
                    alert("确认密码与注册密码不一致！请重新输入！");
                    return;
                }

                $.ajax({
                    type: "post",
                    url: "${BasePath}/register_check",
                    data: {
                        "username": $("#username").val(),
                        "password": $("#password").val(),
                        "invCode": $("#invCode").val()
                    },
                    dataType: "JSON",
                    success: function (data) {
                        if (data == 1) {
                            alert("注册成功！");
                            window.location.href = "${BasePath}/login";
                        }
                        else if(data == -1){
                            alert("邀请码错误！请重新输入！");
                        }
                        else if(data == 0){
                            alert("用户名已存在！请重新输入！");
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
            <h3 class="panel-title">实验室设备管理员注册</h3>
        </div>

        <div class="panel-body">
            <table class="addTable">
                <tr>
                    <td>用户名：</td>
                    <td><input class="mytxt" type="text" id="username" name="用户名" placeholder="请在这里输入注册用户名"></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input class="mytxt" type="password" id="password" name="密码" placeholder="请在这里输入注册密码"></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input class="mytxt" type="password" id="password-test" name="确认密码" placeholder="请在这里再次输入注册密码"></td>
                </tr>
                <tr>
                    <td>邀请码：</td>
                    <td><input class="mytxt" type="text" id="invCode" name="邀请码" placeholder="请在这里输入邀请码"></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <input type="button" id="register" value="注册" class="btn btn-success">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
