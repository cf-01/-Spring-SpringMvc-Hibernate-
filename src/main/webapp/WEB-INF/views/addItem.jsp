<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/12/8
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增物品</title>
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
                    <samll>入库物品</samll>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/item/addItem" method="post">
        <div class="form-group">
            <table>物品名称</table>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="form-group">
            <table>物品图片链接</table>
            <input type="text" name="image" class="form-control"  required>
        </div>
        <div class="form-group">
            <table>物品数量</table>
            <input type="number" name="quantity" class="form-control" required>
        </div>
        <div class="form-group">
            <table>物品价格</table>
            <input type="text" name="price" class="form-control" required>
        </div>
        <div class="form-group">
            <table>物品类别</table>
            <input type="text" name="category" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="添加">
        </div>
    </form>
</div>

</body>
</html>
