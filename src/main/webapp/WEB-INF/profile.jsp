<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>

    <script>
        function validateForm() {
            let price = document.getElementById("price").value;
            let title = document.getElementById("title").value;

            let priceError = document.getElementById("priceError");
            let titleError = document.getElementById("titleError");

            priceError.textContent = "";
            titleError.textContent = "";

            if (title === "") {
                titleError.textContent = "Please enter a Title.";
                return false
            }

            if (price === "") {
                priceError.textContent = "Please enter a number.";
                return false;
            }



            if (!/^\d+(\.\d+)?$/.test(price)) {
                priceError.textContent = "Please enter a valid number.";
                return false;
            }

            return true;
        }

    </script>


</head>
<body>

<header>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
</header>

<div class="container">
    <div class="row">
        <div class="col-4 py-5">
            <div>
                <h1><strong>Welcome,<br>${sessionScope.user.username}!</strong></h1>
            </div>
            <div class="">
                <p>Phone number: (<c:out value="${fn:substring(sessionScope.user.phoneNumber, 0, 3)}"/>)
                    <c:out value="${fn:substring(sessionScope.user.phoneNumber, 3, 6)}"/>-<c:out
                            value="${fn:substring(sessionScope.user.phoneNumber, 6, 10)}"/>
                </p>
                <p>Email: ${sessionScope.user.email}</p>
                <br>
                <form action="/editUser" method="GET">
                    <input type="hidden" name="editId" value="${sessionScope.user.getId()}">
                    <button type="submit" class="edit-profile-btn">

                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-pencil" viewBox="0 0 16 16">
                            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                        </svg>

                        Edit your profile
                    </button>
                </form>
            </div>
            <br>
            <div class="horizontal-line pt-2 mt-2"></div>
            <br>
            <div>
                <h1><strong>Create a new Post</strong></h1>
                <form action="/ads/create" method="post" onsubmit="return validateForm()">
                    <div class="form-group mb-4 mt-2">
                        <label for="title">Title</label>
                        <input id="title" name="title" class="form-control search-opa" type="text" placeholder="Enter Title...">
                        <span id="titleError" class="text-danger"></span>
                    </div>
                    <div class="form-group mb-4">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control search-opa" type="text" placeholder="Enter Brief Description..."></textarea>
                    </div>
                    <div class="form-group mb-4">
                        <label for="price">Price</label>
                        <input id="price" name="price" class="form-control search-opa" type="text" step=".01" placeholder="0.00">
                        <p id="error" class="text-danger"></p>
                    </div>

                    <input type="submit" class="btn btn-block btn-primary mt-3">
                </form>

                <script>
                    function validateForm() {
                        const input = document.getElementById('price');
                        const error = document.getElementById('error');
                        const value = input.value;

                        if (/^\d*\.?\d{0,2}$/.test(value)) {
                            error.textContent = '';
                            return true;
                        } else {
                            error.textContent = 'Please enter a valid double with up to two decimal places.';
                            return false;
                        }
                    }
                </script>
            </div>
        </div>


        <div class="col-8 py-5">
            <div class="centerText center-text mb-5">
                <h2 class="center-text"><strong>Here are you current posts!</strong></h2>
            </div>
            <div>
                <div class="horizontal-line pt-2 mt-2"></div>
            </div>
            <article>
                <div class="row">
                    <c:forEach var="ad" items="${userAds}">
                        <div class="col-4">
                            <div class="card shadow mb-3">
                                <div class="card-body">
                                    <div class="col">
                                        <h5 class="card-title text-center">${ad.title} <br></h5>
                                    </div>
                                    <div class="row">
                                        <p class="card-text"><strong>Description</strong>: ${ad.description}</p>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <form action="/ads/edit" method="GET">
                                                <input name="edit" value="${ad.id}" type="hidden">
                                                <button type="submit" class="btn-edit">Edit</button>
                                            </form>
                                        </div>
                                        <div class="col">
                                            <form action="/ads/delete" method="POST">
                                                <input name="delete" value="${ad.id}" type="hidden">
                                                <button type="submit" class="btn-edit">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item price-color text-center">Price:
                                        $<fmt:formatNumber value="${ad.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </article>

        </div>
    </div>
</div>


</body>
</html>
