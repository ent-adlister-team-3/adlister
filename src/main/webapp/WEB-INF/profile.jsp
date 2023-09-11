<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
</header>

<div class="container">
    <div class="row">
        <div class="col-4 py-5">
            <div class="">
                <h1><strong>Welcome,<br>${sessionScope.user.username}!</strong></h1>
            </div>
            <div class="">
                <p>Phone Number: ${sessionScope.user.phoneNumber}<br></p>
                <p>Email: ${sessionScope.user.email}</p>
                <br>
                <form action="/editUser" method="GET">
                    <input type="hidden" name="editId" value="${sessionScope.user.getId()}">
                    <button type="submit">Edit your profile</button>
                </form>
            </div>

            <div class="horizontal-line pt-2 mt-2"></div>


            <div class="">
                <h1 class="text-center">Create a new Post</h1>
                <form action="/ads/create" method="post">
                    <div class="form-group mb-4 mt-2">
                        <label for="title">Title</label>
                        <input id="title" name="title" class="form-control search-opa" type="text" placeholder="Enter Title...">
                    </div>
                    <div class="form-group mb-4">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control search-opa" type="text" placeholder="Enter Brief Description..."></textarea>
                    </div>
                    <div class="form-group mb-4">
                        <label for="price">Price</label>
                        <input id="price" name="price" class="form-control search-opa" type="text" placeholder="1-9999999">
                    </div>
                    <input type="submit" class="btn btn-block btn-primary mt-3">
                    <a href="/profile" class="btn btn-block btn-default">Cancel</a>
                </form>
            </div>


        </div>


        <div class="col-8 py-5">
            <article>
                <div>
                    <div>
                        <div>
                            <div class="row">
                                <c:forEach var="ad" items="${userAds}">
                                    <div class="col-4"> <!-- Adjust the column width as needed -->
                                        <div class="card shadow mb-3">
                                                <%-- <img class="card-img-top" src="..." alt="Card image cap"> --%>
                                            <div class="card-body">
                                                <h5 class="card-title">Ad Title: ${ad.title} <br></h5>
                                                <p class="card-text">Ad Description: ${ad.description}</p>
                                                <form action="/ads/edit" method="GET">
                                                    <input name="edit" value="${ad.id}" type="hidden">
                                                    <button type="submit">Edit</button>
                                                </form>
                                                <form action="/ads/delete" method="POST">
                                                    <input name="delete" value="${ad.id}" type="hidden">
                                                    <button type="submit">Delete</button>
                                                </form>
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

        </div>
    </div>
</div>


</body>
</html>
