<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>


</head>
<body>

<header>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
</header>

<div class="container">
    <div class="row">
        <div class="col">
            <h1>Welcome,<br>
                ${sessionScope.user.username}!</h1>
        </div>
        <div class="col text-center">
            Phone Number: ${sessionScope.user.phoneNumber}<br>
            Email: ${sessionScope.user.email}
        </div>
    </div>
</div>
<article>
    <div>
        ${sessionScope.ads.title} <br>
        ${sessionScope.ads.description} <br>
            ${sessionScope.ads.price} <br>
    </div>
</article>
</body>
</html>
