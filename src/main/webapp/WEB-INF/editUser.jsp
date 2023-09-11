<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="editUser"/>
    </jsp:include>
    <title>Edit User</title>
</head>
<body>
<h1>Edit User</h1>
<form action="/editUser" method="POST">
    <input type="hidden" name="editId" value="${user.id}">
    <label for="username">Username:</label>
    <input id="username" type="text" name="username" value="${user.username}" required><br>
    <label for="email">Email:</label>
    <input id="email" type="email" name="email" value="${user.email}" required><br>
    <label for="password">Password:</label>
    <input id="password" type="password" name="password" required><br>
    <button type="submit">Save</button>
</form>
<a href="/profile">Cancel</a>


</body>
</html>
