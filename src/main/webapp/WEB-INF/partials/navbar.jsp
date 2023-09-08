<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--&lt;%&ndash; 1 row Navbar&ndash;%&gt;--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <a class="navbar-brand" href="/ads">Puff Clothing</a>--%>
<%--    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>

<%--    --%>

<%--    <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--        <ul class="navbar-nav ms-auto">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty sessionScope.user}">--%>
<%--                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 1 row Navbar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/ads">Puff Clothing</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <c:if test="${pageContext.request.requestURI == '/WEB-INF/ads/index.jsp'}">

        <form>
            <div class="input-group">
                <input type="text" class="form-control" id="searchQuery" placeholder="Search for Clothes" onkeyup="filterAds()">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" onclick="filterAds()">Search</button>
                </div>
            </div>
        </form>

    </c:if>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

</nav>

