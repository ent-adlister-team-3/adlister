<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <script>
        function validateForm() {
            let username = document.getElementById("username").value;
            let phoneNumber = document.getElementById("phoneNumber").value;
            let email = document.getElementById("email").value;
            let password = document.getElementById("password").value;
            let confirm_password = document.getElementById("confirm_password").value;


            let usernameError = document.getElementById("usernameError");
            let phoneNumberError = document.getElementById("phoneNumberError");
            let emailError = document.getElementById("emailError");
            let passwordError = document.getElementById("passwordError");
            let confirmPasswordError = document.getElementById("confirmPasswordError");


            usernameError.textContent = "";
            emailError.textContent = "";
            passwordError.textContent = "";
            confirmPasswordError.textContent = "";
            phoneNumberError.textContent = "";

            if (username === "") {
                usernameError.textContent = "Please enter a username.";
                return false;
            }

            if (phoneNumber === "") {
                phoneNumberError.textContent = "Please enter a phone number.";
                return false;
            }

            if (email === "") {
                emailError.textContent = "Please enter an email.";
                return false;
            }

            if (password === "") {
                passwordError.textContent = "Please enter a password.";
                return false;
            }

            if (confirm_password === "") {
                confirmPasswordError.textContent = "Please confirm your password.";
                return false;
            }

            if (password !== confirm_password) {
                confirmPasswordError.textContent = "Passwords do not match.";
                return false;
            }

            return true;
        }
    </script>
    <script>
        function validatePhoneNumber() {
            const phoneInput = document.getElementById("phoneNumber");
            const phoneError = document.getElementById("phoneError");
            const phoneNumber = phoneInput.value;

            if (phoneNumber.length !== 10 || !/^\d+$/.test(phoneNumber)) {
                phoneError.textContent = "Please enter a 10-digit phone number";
                document.querySelector("input[type=submit]").disabled = true;
            } else {
                phoneError.textContent = "";
                document.querySelector("input[type=submit]").disabled = false;
            }
        }
    </script>

</head>
<body>
<header>


</header>
<div class="container-fluid min-vh-100 p-0">
    <div class="row min-vh-100 p-0">
        <div class="col-8">
            <jsp:include page="/WEB-INF/partials/carosuel.jsp"/>
        </div>
        <div class="col-4 py-5 mr-2">


            <h1 class="text-center"><strong>Sign Up</strong></h1>

            <form action="/register" method="post" onsubmit="return validateForm()">
                <div class="form-group mb-4 ">
                    <label for="username">Username</label> <br>
                    <input id="username" name="username" class="form-control search-opa-R" type="text"
                           placeholder="Enter Username...">
                    <c:if test="${param.error == 'username-exists'}">
                        <span class="text-danger">Username already exists. Please choose another one.</span>
                    </c:if>
                    <span id="usernameError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="phoneNumber">Phone Number:</label>
                    <input id="phoneNumber" type="text" name="phone_number" class="form-control search-opa-R" placeholder="Enter Phone Number..." oninput="validatePhoneNumber()" required>
                    <span id="phoneError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="email">Email</label>
                    <input id="email" name="email" class="form-control search-opa-R" type="text"
                           placeholder="Enter Email...">
                    <c:if test="${param.error == 'email-exists'}">
                        <span class="text-danger">Email already exists. Please use another email.</span>
                    </c:if>
                    <span id="emailError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4 ">
                    <label for="password">Password</label><br>
                    <input id="password" name="password" class="form-control search-opa-R" type="password"
                           placeholder="Enter Password...">
                    <span id="passwordError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="confirm_password">Confirm Password</label><br>
                    <input id="confirm_password" name="confirm_password" class="form-control search-opa-R"
                           type="password"
                           placeholder="Re-Enter Password...">
                    <span id="confirmPasswordError" class="text-danger"></span>
                </div>
                <div class="py-3 wbd">
                    <input type="submit" class="btn btn-primary shadow btn-block custom-registration-button" disabled>
                </div>
            </form>
            <div>
                <p> Already Have an Account? <a class="link-pink link-opacity-100 link-opacity-50-hover" href="/login">Login</a>
                </p>
            </div>
        </div>
    </div>
</div>
<div>
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</div>
</body>
</html>
