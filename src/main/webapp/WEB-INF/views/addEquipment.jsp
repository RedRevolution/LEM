<%--
  Created by IntelliJ IDEA.
  User: Red
  Date: 2020/4/1
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="BasePath" value="${pageContext.request.contextPath}" />

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加设备</title>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <script type="text/javascript" language="JavaScript">
        $(document).ready(function () {
            $("#add").click(function () {
                var bool = true;
                $("table :input").each(function(){
                    if($(this).val() == ''){
                        alert(this.name+'不能为空！');
                        bool = false;
                        return false;
                    }
                });
                if(bool == false){
                    return;
                }
                var result = confirm("确定要提交吗？");
                if (result) {
                    $.ajax({
                        type: "post",
                        url: "${BasePath}/action_addEquipment",
                        data: {
                            "eName": $("#eName").val(),
                            "lName": $("#lName").val(),
                            "pName": $("#pName").val()
                        },
                        dataType: "JSON",
                        success: function (data) {
                            if(data == 1){
                                alert("添加成功！");
                                window.location.href = "${BasePath}/listEquipment";
                            }
                            else alert("添加失败！");
                        },
                        error: function () {
                            alert("提交失败");
                        }
                    });
                }
            })
        })
    </script>
</head>
<body>

<div class="addDIV">

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">添加新设备</h3>
        </div>
        <div class="panel-body">
            <table class="addTable">
                <tr>
                    <td width="40%">设备名称：</td>
                    <td><input class="mytxt" type="text" name="设备名称" id="eName" placeholder="请在这里输入设备名称"></td>
                </tr>
                <tr>
                    <td>实验室名称：</td>
                    <td><input class="mytxt" type="text" name="实验室名称" id="lName" placeholder="请在这里输入实验室名称"></td>
                </tr>
                <tr>
                    <td>购置人：</td>
                    <td><input class="mytxt" type="text" name="购置人员" id="pName" placeholder="请在这里输入购置人员"></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <input type="button" id="add" value="提 交" class="btn btn-success">
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div>

</body>
</html>
