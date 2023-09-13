<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad Details"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<%--<div class="page-wrapper">--%>
<%--    <div class="container">--%>
<%--        <div class="details-container">--%>

<%--            --%>
<%--            --%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>





    <div class="details-container">
        <c:choose>
        <c:when test="${adDetails.getUserId() == sessionScope.user.id}">
            <div class="details-card">
                <div class="row">
                    <div class="card col card-rem">
                        <h1>${adDetails.getTitle()}</h1>
                        <p>Price: $<fmt:formatNumber value="${adDetails.getPrice()}" type="number"
                                                     minFractionDigits="2"
                                                     maxFractionDigits="2"/></p>
                        <p>Description: ${adDetails.getDescription()}</p>
                        <div class="button-container">
                            <form class="btn-spacing" action="/ads/edit" method="GET">
                                <input name="edit" value="${adDetails.getId()}" type="hidden">
                                <button class="btn-edit details" type="submit">Edit</button>
                            </form>
                            <form action="/ads/delete" method="POST">
                                <input name="delete" value="${adDetails.getId()}" type="hidden">
                                <button class="btn-edit details" type="submit">Delete</button>
                            </form>
                        </div>
                    </div>
                    <div class="card col card-rem">
                        <p class="contact-title">Contact the seller:</p>
                        <c:choose>
                            <c:when test="${empty users}">
                                <p>Sorry, no users found</p>
                            </c:when>
                            <c:otherwise>
                                <c:set var="contactInfoFound" value="false" scope="page"/>
                                <c:forEach var="user" items="${users}">
                                    <c:if test="${adDetails.getUserId() == user.id}">
                                        <p>Phone number: (<c:out value="${fn:substring(user.phoneNumber, 0, 3)}"/>)
                                            <c:out value="${fn:substring(user.phoneNumber, 3, 6)}"/>-<c:out
                                                    value="${fn:substring(user.phoneNumber, 6, 10)}"/>
                                        </p>
                                        <p>Email: ${user.email}</p>
                                        <c:set var="contactInfoFound" value="true" scope="page"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${!contactInfoFound}">
                                    <p>Sorry, contact info not found</p>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </div>
                        <%--                    <div class="button-container">--%>
                        <%--                        <form action="/ads/edit" method="GET">--%>
                        <%--                            <input name="edit" value="${adDetails.getId()}" type="hidden">--%>
                        <%--                            <button class="btn-edit" type="submit">Edit</button>--%>
                        <%--                        </form>--%>
                        <%--                        <form action="/ads/delete" method="POST">--%>
                        <%--                            <input name="delete" value="${adDetails.getId()}" type="hidden">--%>
                        <%--                            <button class="btn-edit" type="submit">Delete</button>--%>
                        <%--                        </form>--%>
                        <%--                    </div>--%>
                </div>
            </div>
        </c:when>
        <c:otherwise>
        <div class="details-card">
            <div class="row">
                <div class="card col card-rem">
                    <h1>${adDetails.getTitle()}</h1>
                    <p>Price: $<fmt:formatNumber value="${adDetails.getPrice()}" type="number"
                                                 minFractionDigits="2"
                                                 maxFractionDigits="2"/></p>
                    <p>Description: ${adDetails.getDescription()}</p>
                </div>
                <div class="card col card-rem">
                    <p>Contact the Seller:</p>
                    <c:choose>
                        <c:when test="${empty users}">
                            <p>Sorry, no users found</p>
                        </c:when>
                        <c:otherwise>
                            <c:set var="contactInfoFound" value="false" scope="page"/>
                            <c:forEach var="user" items="${users}">
                                <c:if test="${adDetails.getUserId() == user.id}">
                                    <p>Phone number: (<c:out value="${fn:substring(user.phoneNumber, 0, 3)}"/>)
                                        <c:out value="${fn:substring(user.phoneNumber, 3, 6)}"/>-<c:out
                                                value="${fn:substring(user.phoneNumber, 6, 10)}"/>
                                    </p>
                                    <p>Email: ${user.email}</p>
                                    <c:set var="contactInfoFound" value="true" scope="page"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${!contactInfoFound}">
                                <p>Sorry, contact info not found</p>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
            <div class="row">
                <a href="/" class="link-pink link-opacity-100 link-opacity-50-hover">GO TO HOME PAGE</a>
            </div>
        </div>
    </div>

</body>
</html>
