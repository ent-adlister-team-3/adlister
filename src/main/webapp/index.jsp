<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>

    <script>
        function filterAds() {
            let searchQuery = document.getElementById("searchQuery").value.toLowerCase();
            let ads = document.getElementsByClassName("ad-card");
            let heroContainer = document.getElementById("hero-container");

            if (searchQuery.trim() === "") {
                heroContainer.classList.remove("hide-hero");
            } else {
                heroContainer.classList.add("hide-hero");
            }

            for (let i = 0; i < ads.length; i++) {
                let adTitle = ads[i].getElementsByClassName("ad-title")[0].innerText.toLowerCase();
                if (adTitle.includes(searchQuery)) {
                    ads[i].style.display = "block";
                } else {
                    ads[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="page-wrapper">
    <div class="hero-container" id="hero-container">
        <div class="image-text-1 shadow">
            <h2>Shop Sustainably</h2>
        </div>
        <div class="image-text-2 shadow">
            <h2>Sell your old clothes</h2>
        </div>
        <div class="image-text-3 shadow">
            <h2>Save the planet</h2>
        </div>
        <form action="/register" method="GET">
            <input name="register" type="hidden">
            <button class="register-btn shadow" type="submit">Sign up now!
                <div class="arrow-wrapper">
                    <div class="arrow"></div>
                </div>
            </button>
        </form>
    </div>
    <div class="card-container">
        <div class="card-row">

            <c:forEach var="ad" items="${ads}">
                <div class="ad-card shadow">
                    <div class="ad-title">
                        <h2>${ad.title}</h2>
                    </div>
                    <form action="/ads/details" method="GET">
                        <input class="ad-id" name="details" value="${ad.id}" type="hidden">
                        <button class="details-btn" type="submit">Show more</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="container-fluid bg-footer shadow">
    <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 border-top">
        <div class="col">
            <div>
                <a href="#" class="link-pink link-opacity-100 link-opacity-50-hover">GO TO TOP PAGE</a>
            </div>
        </div>
        <div class="col"></div>
        <div class="col">
            <section class="footer-text">Rick</section>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a href="https://github.com/rickmorales7693" class="link-pink link-opacity-100 link-opacity-50-hover">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                            <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                        </svg> Github
                    </a>
                </li>
            </ul>
        </div>
        <div class="col">
            <section class="footer-text">Vic</section>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                   <a href="https://github.com/VictorCalderonJ" class="link-pink link-opacity-100 link-opacity-50-hover">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                           <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                       </svg> Github
                   </a>
                </li>
            </ul>
        </div>
        <div class="col">
            <section class="footer-text">Ava</section>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                        <a href="https://github.com/ava-smith" class="link-pink link-opacity-100 link-opacity-50-hover">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg> Github
                        </a>
                </li>
            </ul>
        </div>
    </footer>
</div>

</body>
</html>
