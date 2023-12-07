<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oyzk.entity.Item" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>物品列表</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <style>
        .header {
            text-align: center;
            padding-top: 20px;
        }

        .header h1 {
            font-size: 36px;
            font-weight: bold;
            margin: 0;
            padding: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>仓库管理系统</h1>
</div>

    <div class="container" style="padding: 20px">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-headr">
                    <h1>
                        <small>信息列表 ———————— 显示所有库存信息</small>
                    </h1>
                    <span style="color:#FAF520 ;font-weight: bold">${flageMsg}</span>
                </div>
            </div>
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/addItem">入库</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/item/getAllItem">显示全部信息</a>
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form class="form-inline" action="${pageContext.request.contextPath}/item/getItemByNameOrCategory" method="get" style="float:right">
                    <span style="color:#FAF520 ;font-weight: bold">${error}</span>
                    <input type="text" name="keyword" class="form-control" placeholder="请输入要查询物品名称或种类">
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>
            </div>

        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>物品ID</th>
                        <th>物品名称</th>
                        <th>物品图片</th>
                        <th>物品数量</th>
                        <th>物品价格</th>
                        <th>物品类别</th>
                    </tr>
                    </thead>

                    <%-- 人员从数据库中查询出来--%>
                    <tbody>
                    <c:forEach items="${itemList}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td><img src="${item.image}"></td>
                            <td>${item.quantity}</td>
                            <td>${item.price}</td>
                            <td>${item.category}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/item/updateItemPage?id=${item.id}">修改</a>
                                &nbsp; ||&nbsp;
                                <a href="${pageContext.request.contextPath}/item/deleteItem?id=${item.id}">刪除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
