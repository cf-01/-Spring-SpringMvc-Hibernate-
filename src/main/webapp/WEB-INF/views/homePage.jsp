<%--
  Created by IntelliJ IDEA.
  User: Kingkang
  Date: 2022/11/28
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>仓库管理系统</title>
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
                        <small>信息列表 ———————— 显示所有库存信息</small>
                    </h1>
                    <span style="color:#FAF520 ;font-weight: bold">${flageMsg}</span>
                </div>
            </div>
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/person/savePersonPage">新增</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/person/findAll">显示全部信息</a>
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form class="form-inline" action="${pageContext.request.contextPath}/person/findById" method="get" style="float:right">
                    <span style="color:#FAF520 ;font-weight: bold">${error}</span>
                    <input type="text" name="id" class="form-control" placeholder="请输入要查询的人员id">
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>
            </div>

        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>人员id</th>
                            <th>人员名字</th>
                            <th>人员电话</th>
                            <th>人员地址</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <%--                        人员从数据库中查询出来--%>
                    <tbody>
                        <c:forEach items="${personList}" var="person">
                            <tr>
                                <td>${person.id}</td>
                                <td>${person.username}</td>
                                <td>${person.phone}</td>
                                <td>${person.address}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/person/updatePersonPage?id=${person.id}">修改</a>
                                    &nbsp; ||&nbsp;
                                    <a href="${pageContext.request.contextPath}/person/deletePerson?id=${person.id}">刪除</a>
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
