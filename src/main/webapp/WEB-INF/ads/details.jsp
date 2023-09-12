<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad Details"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <c:choose>
        <c:when test="${adDetails.getUserId() == sessionScope.user.id}">
            <h1>${adDetails.getTitle()}</h1>
            <p>${adDetails.getDescription()}</p>
            <p>${adDetails.getPrice()}</p>
            <p>Contact the seller:</p>
            <p>${sessionScope.user.phoneNumber}</p>
            <p>${sessionScope.user.email}</p>
            <form action="/ads/edit" method="GET">
                <input name="edit" value="${adDetails.getId()}" type="hidden">
                <button type="submit">Edit</button>
            </form>
            <form action="/ads/delete" method="POST">
                <input name="delete" value="${adDetails.getId()}" type="hidden">
                <button type="submit">Delete</button>
            </form>
        </c:when>
        <c:otherwise>
            <h1>${adDetails.getTitle()}</h1>
            <p>${adDetails.getDescription()}</p>
            <p>${adDetails.getPrice()}</p>
            <p>Contact the Seller:</p>
            <c:choose>
                <c:when test="${empty users}">
                    <p>Sorry, no users found</p>
                </c:when>
                <c:otherwise>
                    <c:set var="contactInfoFound" value="false" scope="page"/>
                    <c:forEach var="user" items="${users}">
                        <c:if test="${adDetails.getUserId() == user.id}">
                            <p>${user.phoneNumber}</p>
                            <p>${user.email}</p>
                            <c:set var="contactInfoFound" value="true" scope="page"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${!contactInfoFound}">
                        <p>Sorry, contact info not found</p>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
