<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />


    <div class="row">
        <div class="col-4 px-5 mx-2 my-5">
            <h1 class="text-center"><strong>Log In</strong></h1>
            <div class="my-4">
                <p>Don't have an account yet? <a class="link-primary link-opacity-100 link-opacity-50-hover" href="/register">Sign Up Now!</a></p>
            </div>
            <form action="/login" method="POST">
                <div class="form-group mb-4">
                    <label for="username">Username</label>
                    <input id="username" name="username" class="form-control" type="text" placeholder="PowerPuffGirls">
                </div>
                <div class="form-group mb-4">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password" placeholder="Bubble, Buttercup, Blossom">
                </div>
                <div>
                    <input type="submit" class="btn btn-primary btn-block custom-registration-button" value="Log In">

                </div>
            </form>
        </div>
        <div class="col-8">

        </div>
    </div>

</body>
</html>
