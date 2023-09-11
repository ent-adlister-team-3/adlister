<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <script>
        function validateForm() {
            let username = document.getElementById("username").value;
            let email = document.getElementById("email").value;
            let password = document.getElementById("password").value;
            let confirm_password = document.getElementById("confirm_password").value;
            let phoneNumber = document.getElementById("phoneNumber").value;

            let usernameError = document.getElementById("usernameError");
            let emailError = document.getElementById("emailError");
            let passwordError = document.getElementById("passwordError");
            let confirmPasswordError = document.getElementById("confirmPasswordError");
            let phoneNumberError = document.getElementById("phoneNumberError");

            usernameError.textContent = "";
            emailError.textContent = "";
            passwordError.textContent = "";
            confirmPasswordError.textContent = "";
            phoneNumberError.textContent = "";

            if (username === "") {
                usernameError.textContent = "Please enter a username.";
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

            if (phoneNumber === "") {
                phoneNumberError.textContent = "Please enter a phone number.";
                return false;
            }

            if (password !== confirm_password) {
                confirmPasswordError.textContent = "Passwords do not match.";
                return false;
            }

            return true;
        }
    </script>

    <link rel="icon" type="image/x-icon" href="../img/favicon.ico.png">

</head>
<body>
<header>


</header>
<div class="">
    <div class="row">
        <div class="col-8">
            <jsp:include page="/WEB-INF/partials/carosuel.jsp" />
        </div>
        <div class="col-4 py-5 mr-2">


            <h1 class="text-center"><strong>Sign Up</strong></h1>

            <form action="/register" method="post" onsubmit="return validateForm()">
                <div class="form-group mb-4 ">
                    <label for="username" >Username</label> <br>
                    <input id="username" name="username" class="form-control search-opa" type="text" placeholder="Enter Username...">
                    <span id="usernameError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="email">Email</label>
                    <input id="email" name="email" class="form-control search-opa" type="text" placeholder="Enter Email...">
                    <span id="emailError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4 ">
                    <label for="password">Password</label><br>
                    <input id="password" name="password" class="form-control search-opa" type="password"
                           placeholder="Enter Password...">
                    <span id="passwordError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="confirm_password" >Confirm Password</label><br>
                    <input id="confirm_password" name="confirm_password" class="form-control search-opa" type="password"
                           placeholder="Re-Enter Password...">
                    <span id="confirmPasswordError" class="text-danger"></span>
                </div>
                <div class="form-group mb-4">
                    <label for="phoneNumber">Phone Number</label><br>
                    <input id="phoneNumber" name="phoneNumber" class="form-control search-opa" type="text"
                           placeholder="Enter Phone Number...">
                    <span id="phoneNumberError" class="text-danger"></span>
                </div>
                <div class="py-3 wbd">
                    <input type="submit" class="btn btn-primary shadow btn-block custom-registration-button">
                </div>
            </form>
            <div>
               <p> Already Have an Account? <a class="link-pink link-opacity-100 link-opacity-50-hover" href="/login">Login</a></p>
            </div>
        </div>
    </div>
</div>
<div>
    <jsp:include page="/WEB-INF/partials/script.jsp" />
</div>
</body>
</html>
