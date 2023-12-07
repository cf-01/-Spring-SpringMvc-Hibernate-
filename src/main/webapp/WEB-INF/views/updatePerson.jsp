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
    <title>修改人员信息页面</title>
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
                    <samll>修改人员</samll>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/person/updatePerson" method="post">

        <input type="hidden" name="id" value="${person.id}">
        <div class="form-group">
            <table>人员名字</table>
            <input type="text" name="username" class="form-control" value="${person.username}" required>
        </div>
        <div class="form-group">
            <table>人员电话</table>
            <input type="text" name="phone" class="form-control"  value="${person.phone}" required>
        </div>
        <div class="form-group">
            <table>人员地址</table>
            <input type="text" name="address" class="form-control" value="${person.address}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改">
        </div>
    </form>

</div>
</body>
</html>
