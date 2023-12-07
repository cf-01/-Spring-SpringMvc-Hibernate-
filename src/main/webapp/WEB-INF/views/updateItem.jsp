<%--
  Created by IntelliJ IDEA.
  User: Kingkang
  Date: 2022/11/27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改物品信息页面</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-headr">
                <h1>
                    <samll>修改物品</samll>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/item/updateItem" method="post">

        <input type="hidden" name="id" value="${item.id}">
        <div class="form-group">
            <table>物品名称</table>
            <input type="text" name="name" class="form-control" value="${item.name}" required>
        </div>
        <div class="form-group">
            <table>物品图片链接</table>
            <input type="text" name="image" class="form-control"  value="${item.image}"  required>
        </div>
        <div class="form-group">
            <table>物品数量</table>
            <input type="number" name="quantity" class="form-control" value="${item.quantity}"  required>
        </div>
        <div class="form-group">
            <table>物品价格</table>
            <input type="text" name="price" class="form-control" value="${item.price}" required>
        </div>
        <div class="form-group">
            <table>物品类别</table>
            <input type="text" name="category" class="form-control"  value="${item.category}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改">
        </div>
    </form>

</div>
</body>
</html>
