<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <title>实验室设备管理 - 首页</title>

    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
            $("form").submit(function(){
                var bool=true;
                $("form :input.required").each(function(){
                    var src=$(this).val();
                    if(src==''){
                        bool=false;
                        if(this.name=='eName'){
                            alert('设备名称不能为空');
                        }
                        else if(this.name=='lName'){
                            alert('实验室名称不能为空');
                        }
                        else{
                            alert('采购人员不能为空');
                        }
                        return false; //退出each
                    }
                });
                if(bool==false){
                    return false;
                }
                var result = confirm("确定要提交吗？");
                if (result) {
                    $('#actionForm').submit();
                    return true;
                }
                return false;
            })
        });
    </script>

</head>

<body>

<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">

        <caption>实验室设备列表 - 共${page.total}项</caption>
        <thead>
        <tr class="success">
            <th>设备ID</th>
            <th>设备名称</th>
            <th>实验室名称</th>
            <th>购置时间</th>
            <th>购置人员</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${equipments}" var="s" varStatus="status">
            <tr>
                <td>${s.id}</td>
                <td>${s.eName}</td>
                <td>${s.lName}</td>
                <td>${s.createTime}</td>
                <td>${s.pName}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<nav class="pageDIV">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span>«</span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}">
                <span>‹</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}">
                <span>›</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}">
                <span>»</span>
            </a>
        </li>
    </ul>
</nav>

<div class="addDIV">

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">增加设备</h3>
        </div>
        <div class="panel-body">

            <form method="post" action="${pageContext.request.contextPath}/addEquipment" role="form">
                <table class="addTable">
                    <tr>
                        <td width="40%">设备：</td>
                        <td><input class="required" type="text" name="eName" id="eName" placeholder="请在这里输入设备名称"></td>
                    </tr>
                    <tr>
                        <td>实验室：</td>
                        <td><input class="required" type="text" name="lName" id="lName" placeholder="请在这里输入实验室名称"></td>
                    </tr>
                    <tr>
                        <td>购置人：</td>
                        <td><input class="required" type="text" name="pName" id="pName" placeholder="请在这里输入购置人员"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>

                    </tr>

                </table>
            </form>
        </div>
    </div>

</div>


</body>
</html>