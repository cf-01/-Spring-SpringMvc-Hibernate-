<%--
  Created by IntelliJ IDEA.
  User: Kingkang
  Date: 2022/11/29
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<form method="post" action="/user/saveUser">
    <p>用户名:<input name="username"></p>
    <p>地址：<input name="address"></p>
    <p>电话：<input name="phone"></p>

    <p>
        <button type="submit">添加</button>
    </p>
    <a href="/user/userList">用户列表</a>
</form>
</body>
</html>
