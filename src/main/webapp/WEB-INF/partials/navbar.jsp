<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="color-cycling-navbar navbar-expand-lg navbar-light bg-light color-cycling-navbar shadow">
    <img src="/img/icons.png" class="mx-4" alt="ppg"
         style="max-height: 40px; width: auto; display: block; margin: 0 auto">
    <a class="navbar-brand font-size" href="/">
        <c:choose>
            <c:when test="${pageContext.request.requestURI.endsWith('/profile.jsp')}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-skip-backward" viewBox="0 0 16 16">
                    <path d="M.5 3.5A.5.5 0 0 1 1 4v3.248l6.267-3.636c.52-.302 1.233.043 1.233.696v2.94l6.267-3.636c.52-.302 1.233.043 1.233.696v7.384c0 .653-.713.998-1.233.696L8.5 8.752v2.94c0 .653-.713.998-1.233.696L1 8.752V12a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5zm7 1.133L1.696 8 7.5 11.367V4.633zm7.5 0L9.196 8 15 11.367V4.633z"/>
                </svg>
                Main Page</c:when>
            <c:when test="${pageContext.request.requestURI.endsWith('/login.jsp')}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-skip-backward" viewBox="0 0 16 16">
                    <path d="M.5 3.5A.5.5 0 0 1 1 4v3.248l6.267-3.636c.52-.302 1.233.043 1.233.696v2.94l6.267-3.636c.52-.302 1.233.043 1.233.696v7.384c0 .653-.713.998-1.233.696L8.5 8.752v2.94c0 .653-.713.998-1.233.696L1 8.752V12a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5zm7 1.133L1.696 8 7.5 11.367V4.633zm7.5 0L9.196 8 15 11.367V4.633z"/>
                </svg>
                Main Page</c:when>
            <c:otherwise>Puff Clothing</c:otherwise>
        </c:choose>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <c:if test="${pageContext.request.requestURI == '/index.jsp'}">
        <form style="margin-bottom: 2px">
            <div class="input-group search-inc mx-4 px-4">
                <input type="text" class="form-control pill-search" id="searchQuery" placeholder="Search for Clothes"
                       onkeyup="filterAds()">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary tryThisOut" type="button" onclick="filterAds()">Search
                    </button>
                </div>
            </div>
        </form>
    </c:if>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto ">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <c:if test="${not pageContext.request.requestURI.endsWith('/login.jsp')}">
                        <li class="nav-item">
                            <a class="nav-link" href="/login" style="margin-right: 24px">
                                <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                                <path fill-rule="evenodd"
                                      d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg>
                                </span>
                                Login</a>
                        </li>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <c:if test="${not pageContext.request.requestURI.endsWith('/profile.jsp')}">
                        <li class="nav-item" id="profileTab"><a class="nav-link" href="/profile"
                                                                style="margin-right: 16px">Profile</a></li>
                    </c:if>
                    <li class="nav-item"><a class="nav-link" href="/logout" style="margin-right: 24px">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>


</nav>

