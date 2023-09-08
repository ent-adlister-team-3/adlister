<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit User"/>
    </jsp:include>
    <title>Edit User</title>
</head>
<body>
<h1>Edit User</h1>
<form action="ads/edit-user" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <label for="username">Username:</label>
    <input type="text" name="username" value="${user.username}" required><br>
    <label for="email">Email:</label>
    <input type="email" name="email" value="${user.email}" required><br>
    <label for="password">Password:</label>
    <input type="password" name="password" value="${user.password}" required><br>
    <button type="submit">Save</button>
</form>
<a href="/profile">Cancel</a>


</body>
</html>
