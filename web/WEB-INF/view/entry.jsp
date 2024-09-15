<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon"
          href="${pageContext.request.contextPath}/resources/img/favicon.ico"
          type="image/x-icon"/>
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/entry.css"/>
    <title>Sign in & Sign up Form</title>
</head>
<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <form class="sign-in-form"
                  onsubmit="return validateSignInForm()" id="signInForm">
                <h2 class="title">Sign in</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="Username" name="userName" oninput="this.setCustomValidity('')">
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" name="password" oninput="this.setCustomValidity('')">
                </div>
                <input type="submit" value="Login" class="btn solid"/>
                <p class="social-text">Or Sign in with social platforms</p>
                <div class="social-media">
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                </div>
            </form>
            <form:form modelAttribute="newPlayer" action="sign-up-form" method="post"
                       class="sign-up-form" onsubmit="return validateSignUpForm()" id="signUpForm">
                <h2 class="title">Sign up</h2>
                <div class="input-field">
                    <i class="fas fa-user-circle"></i>
                    <form:input id="userName" path="userName" placeholder="Username"
                                oninput="this.setCustomValidity('')"/>
                </div>
                <p id="userNameSuggestion" class="error"></p>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <form:input path="fullName" placeholder="Name" oninput="this.setCustomValidity('')"/>
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <form:input id='email' path="email" placeholder="Email"
                                oninput="this.setCustomValidity('')"/>
                </div>
                <p id="emailSuggestion" class="error"></p>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <form:password path="password" placeholder="Password" oninput="this.setCustomValidity('')"/>
                </div>
                <input id="submitSignUpButton" type="submit" class="btn" value="Sign up"/>
                <p class="social-text">Or Sign up with social platforms</p>
                <div class="social-media">
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                </div>
            </form:form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h2>New here ?</h2>
                <p>
                    Join Minesweeper today.
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Sign up
                </button>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/log.svg" class="image" alt=""/>
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h2>One of us ?</h2>
                <p>
                    Sign in to Minesweeper
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Sign in
                </button>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/register.svg" class="image" alt=""/>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/entry.js"></script>
</body>
</html>

