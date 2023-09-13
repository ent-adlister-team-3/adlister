<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad"/>
    </jsp:include>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col align-self-center px-2 mx-2 my-5 d-flex justify-content-center">
            <div class="card card-size" style="width: 35rem;">
                <div class="card-body card-size">
                    <h1 class="card-title text-center"><strong>Edit your Post</strong></h1>
                    <form action="/ads/edit" method="POST" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="title"><strong>Title:</strong></label>
                            <input id="title" name="title" class="form-control" type="text" value="${editedAd.getTitle()}">
                            <br>
                        </div>
                        <div class="form-group">
                            <label for="description"><strong>Description:</strong></label>
                            <textarea id="description" name="description" class="form-control" type="text">${editedAd.getDescription()}</textarea>
                            <br>
                        </div>
                        <div class="form-group">
                            <label for="price"><strong>Price:</strong></label>
                            <input id="price" name="price" class="form-control" type="text" value="${editedAd.getPrice()}">
                            <br>
                        </div>
                        <div id="errorSpan"></div>
                        <input name="edit" value="${editedAd.getId()}" type="hidden">
                        <input type="submit" class="btn btn-primary btn-block custom-registration-button shadow">
                        <div class="text-center">
                            <br>
                            <a class="link-pink link-opacity-100 link-opacity-50-hover"
                               href="/profile">Cancel</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        let title = document.getElementById("title").value;
        let description = document.getElementById("description").value;
        let price = document.getElementById("price").value;
        let errorSpan = document.getElementById("errorSpan");

        if (title.trim() === "") {
            errorSpan.innerHTML = "<span style='color: red;'>Please enter a title.</span>";
            return false;
        }

        if (!/^\d+(\.\d{1,2})?$/.test(price)) {
            errorSpan.innerHTML = "<span style='color: red;'>Price must be a number with one or two decimal places.</span>";
            return false;
        }

        errorSpan.innerHTML = "";

        return true;
    }
</script>


</body>
</html>
