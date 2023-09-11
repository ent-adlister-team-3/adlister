<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>

<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col align-self-center px-2 mx-2 my-5 d-flex justify-content-center">
            <div class="card card-size" style="width: 35rem;">
                <%--            <img class="card-img-top" src="..." alt="Card image cap">--%>
                <div class="card-body card-size">
                    <h1 class="card-title text-center"><strong>Log In</strong></h1>
                    <div class="my-4">
                        <p>Don't have an account yet? <a class="link-pink link-opacity-100 link-opacity-50-hover"
                                                         href="/register">Sign Up Now!</a></p>
                    </div>
                    <form action="/login" method="POST">
                        <div class="form-group mb-4">
                            <label for="username">Username</label>
                            <input id="username" name="username" class="form-control search-opa" type="text"
                                   placeholder="PowerPuffGirls">
                        </div>
                        <div class="form-group mb-4">
                            <label for="password">Password</label>
                            <input id="password" name="password" class="form-control search-opa " type="password"
                                   placeholder="Bubble, Buttercup, Blossom">
                        </div>
                        <div class="wbd">
                            <input type="submit" class="btn btn-primary btn-block custom-registration-button shadow"
                                   value="Log In">
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>


</body>
</html>
