<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 1 row Navbar--%>
<nav class="color-cycling-navbar navbar-expand-lg navbar-light bg-light color-cycling-navbar">
<%--<nav class="navbar navbar-expand-lg shadow navbar-light bg-light color-cycling-navbar">--%>
    <a class="navbar-brand mx-4" href="/">Puff Clothing</a>
    <img src="/img/icons.png" class="mx-4" alt="ppg" style="max-height: 40px; width: auto; display: block; margin: 0 auto">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


<%--    Pill search button--%>
<%--    Needs tp be centered (its currently above)--%>
    <c:if test="${pageContext.request.requestURI == '/index.jsp'}">
        <form>
            <div class="input-group search-inc mx-4 px-4">
                <input type="text" class="form-control pill-search" id="searchQuery" placeholder="Search for Clothes" onkeyup="filterAds()">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary tryThisOut" type="button" onclick="filterAds()">Search</button>
                </div>
            </div>
        </form>
    </c:if>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto ">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">
                             <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                                <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg>
                                </span>
                            Login
                        </a>
                    </li>
<%--                    register button is getting removed Ava is going to put it in the home page "hero"--%>
<%--                    <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>--%>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

</nav>

