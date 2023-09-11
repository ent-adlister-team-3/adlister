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

            console.log("Search Query:", searchQuery); // Log the search query
            console.log("Number of Ads:", ads.length); // Log the number of ads

            for (let i = 0; i < ads.length; i++) {
                let adTitle = ads[i].getElementsByClassName("ad-title")[0].innerText.toLowerCase();
                console.log("Ad Title:", adTitle); // Log each ad title
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

<div class="container">
    <h1>Here Are all the ads!</h1>
    <c:forEach var="ad" items="${ads}">
                <div class="ad-card col-md-6">
                    <h2 class="ad-title">${ad.title}</h2>
                    <form action="/ads/details" method="GET">
                        <input class="ad-id" name="details" value="${ad.id}" type="hidden">
                        <button type="submit">Show more</button>
                    </form>
                </div>
    </c:forEach>
</div>
</body>
</html>
