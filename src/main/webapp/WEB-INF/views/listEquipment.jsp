<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="BasePath" value="${pageContext.request.contextPath}" />

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
            $("#user").text("你好，"+window.sessionStorage.getItem("username"));
            $("#logout").click(function () {
                window.location.href = "${BasePath}/login";
            });
            $("#addEquipment").click(function () {
                window.location.href = "${BasePath}/addEquipment";
            });
            $("#search").click(function () {
                var type = $("#option option:selected").val();　　//获取选中项
                var val = $("#find").val();
                window.location.href = "${BasePath}/listEquipment?type="+type+"&val="+val;
            });
            $("#return").click(function () {
                window.location.href = "${BasePath}/listEquipment";
            });
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
        });
    </script>

</head>

<body>

<div class="logout">
    <b type="text" id="user"></b>
    <input type="button" id="logout" value="登出" class="btn btn-danger">
    <input type="button" id="addEquipment" value="添加新设备" class="btn btn-info">
</div>

<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">

        <caption>实验室设备列表 - 共${page.total}项</caption>
        <thead>
        <tr class="success">
            <th>设备ID</th>
            <th width="200px">设备名称</th>
            <th width="200px">实验室名称</th>
            <th>购置时间</th>
            <th>购置人员</th>
            <th>删除</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${equipments}" var="e" varStatus="status">
            <tr>
                <td>${e.eId}</td>
                <td>${e.eName}</td>
                <td>${e.lName}</td>
                <td>${e.createTime}</td>
                <td>${e.pName}</td>
                <td><a href="${BasePath}/deleteEquipment?eId=${e.eId}"><span class="glyphicon glyphicon-trash"></span> </a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<nav class="pageDIV">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0&type=${type}&val=${val}">
                <span>«</span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}&type=${type}&val=${val}">
                <span>‹</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}&type=${type}&val=${val}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}&type=${type}&val=${val}">
                <span>›</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}&type=${type}&val=${val}">
                <span>»</span>
            </a>
        </li>
    </ul>
</nav>

<div class="addDIV">
    <select id="option" class="select">
        <option value="e_id">设备ID</option>
        <option value="e_name">设备名</option>
        <option value="l_name">实验室名</option>
        <option value="p_name">采购人</option>
        <option value="create_time">采购时间</option>
    </select>
    <br>
    <input type="text" id="find" placeholder="请在这里输入查询关键字" class="mytxt">
    <input type="button" id="search" value="查询" class="btn btn-primary">
    <input type="button" id="return" value="返回" class="btn btn-default">
</div>

</body>
</html>