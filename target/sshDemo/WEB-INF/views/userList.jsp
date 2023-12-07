<%--
  Created by IntelliJ IDEA.
  User: Kingkang
  Date: 2022/11/29
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oyzk.entity.Person" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<a href="addUserPage">添加用户</a>
<table class="table-hover table-bordered">
    <tr>
        <th>人员id</th>
        <th>人员名字</th>
        <th>人员电话</th>
        <th>人员地址</th>
        <th>操作</th>
    </tr>
    <%
        if (request.getAttribute("userList") != null) {
    %>
    <%for (Person u : (List<Person>) request.getAttribute("userList")) {%>
    <tr>
        <td><%=u.getId()%>
        </td>
        <td><%=u.getUsername()%>
        </td>
        <td><%=u.getPhone()%>
        </td>
        <td><%=u.getAddress()%>
        </td>
        <td>
            <a href="updateUserByIdPage?id=<%=u.getId()%>">修改</a>
            <a href="deleteUser?id=<%=u.getId()%>">删除</a>
        </td>
    </tr>
    <%}%>
    <%}%>
</table>
</body>
</html>
