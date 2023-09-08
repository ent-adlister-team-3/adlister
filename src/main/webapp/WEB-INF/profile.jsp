<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1>Welcome,<br>${sessionScope.user.username}!</h1>
        </div>
        <div class="col text-center">
            Phone Number: ${sessionScope.user.phoneNumber}<br>
            Email: ${sessionScope.user.email}
        </div>
    </div>
</div>

<article>
    <div>
        <div>
            <div>
                <div class="row">
                    <c:forEach var="ad" items="${userAds}">
                        <div class="col-4"> <!-- Adjust the column width as needed -->
                            <div class="card mb-3">
                                    <%-- <img class="card-img-top" src="..." alt="Card image cap"> --%>
                                <div class="card-body">
                                    <h5 class="card-title">Ad Title: ${ad.title} <br></h5>
                                    <p class="card-text">Ad Description: ${ad.description}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Ad Price: ${ad.price}</li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</article>

</body>
</html>
