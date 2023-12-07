<%@ page import="com.oyzk.entity.Person" %><%--
  Created by IntelliJ IDEA.
  User: Kingkang
  Date: 2022/11/29
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
</head>
<body>
<%
    Person u = (Person)request.getAttribute("user");
%>
<form method="post" action="/user/updateUser">
    <p>用户Id：<input name="id" value="<%=u.getId()%>" readonly></p>
    <p>用户名:<input name="username" value="<%=u.getUsername()%>"></p>
    <p>地址：<input name="address" value="<%=u.getAddress()%>"></p>
    <p>电话：<input name="phone" value="<%=u.getPhone()%>"></p>
    <p>
        <button type="submit">确认修改</button>
    </p>
    <a href="/user/userList">用户列表</a>
</form>
</body>
</html>
