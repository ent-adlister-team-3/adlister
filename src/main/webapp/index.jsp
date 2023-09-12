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
        <div class="image-text-1">
            <h2>Shop Sustainably</h2>
        </div>
        <div class="image-text-2">
            <h2>Sell your old clothes</h2>
        </div>
        <div class="image-text-3">
            <h2>Save the planet</h2>
        </div>
        <form action="/register" method="GET">
            <input name="register" type="hidden">
            <button class="register-btn" type="submit">Sign up now!</button>
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

</body>
</html>
