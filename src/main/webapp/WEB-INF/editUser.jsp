<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="editUser"/>
    </jsp:include>
    <title>Edit User</title>
    <script>
        function validatePhoneNumber() {
            const phoneInput = document.getElementById("phoneNumber");
            const phoneError = document.getElementById("phoneError");
            const phoneNumber = phoneInput.value;

            if (phoneNumber.length !== 10 || !/^\d+$/.test(phoneNumber)) {
                phoneError.textContent = "Please enter a 10-digit phone number";
                document.querySelector("button[type=submit]").disabled = true;
            } else {
                phoneError.textContent = "";
                document.querySelector("button[type=submit]").disabled = false;
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col align-self-center px-2 mx-2 my-5 d-flex justify-content-center">
            <div class="card card-size" style="width: 35rem;">
                <div class="card-body card-size">
                    <h1 class="card-title text-center"><strong>Edit User</strong></h1>
                    <form action="/editUser" method="POST">
                        <div class="form-group mb-4">
                            <input type="hidden" name="editId" value="${user.id}">
                        </div>
                        <div class="form-group mb-4">
                            <label for="username">Username:</label>
                            <input id="username" type="text" name="username" class="form-control wbd" value="${user.username}">
                        </div>
                        <br>
                        <div class="form-group mb-4">
                            <label for="phoneNumber">Phone Number:</label>
                            <input id="phoneNumber" type="text" name="phone_number" class="form-control wbd" value="${user.phoneNumber}" oninput="validatePhoneNumber()" required>
                            <span id="phoneError" class="text-danger"></span>
                        </div>
                        <br>
                        <div class="form-group mb-4">
                            <label for="email">Email:</label>
                            <input id="email" type="email" name="email" class="form-control wbd" value="${user.email}">
                        </div>
                        <br>
                        <br>
                        <div class="form-group mb-4">
                            <button type="submit" class="btn btn-primary btn-block custom-registration-button shadow">Save</button>
                        </div>
                    </form>
                    <a class="link-pink link-opacity-100 link-opacity-50-hover" href="/profile">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
