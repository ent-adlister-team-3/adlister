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

<div class="container">
    <div class="row">
        <div class="col align-self-center px-2 mx-2 my-5 d-flex justify-content-center">
            <div class="card card-size" style="width: 35rem;">
                <div class="card-body card-size">
                    <h1 class="card-title text-center"><strong>Edit User</strong></h1>
                    <form action="/editUser" method="POST">
                        <div class="form-group mb-4">
                            <input type="hidden" name="editId" value="${user.id}">
                            <label for="username">Username:</label>
                        </div>
                        <div class="form-group mb-4">
                            <input type="text" name="username" class="form-control search-opa" value="${user.username}" required><br>
                            <label for="email">Email:</label>
                        </div>
                        <div class="form-group mb-4">
                            <input type="email" name="email" class="form-control search-opa" value="${user.email}" required><br>
                            <label for="password">Password:</label>
                        </div>
                        <div class="form-group mb-4">
                            <input type="password" name="password" class="form-control search-opa" value="${user.password}" required><br>
                            <button type="submit"class="btn btn-primary btn-block custom-registration-button shadow">Save</button>
                        </div>
                    </form>
                    <a href="/profile">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
