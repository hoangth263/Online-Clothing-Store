<%-- 
    Document   : register
    Created on : Jul 6, 2022, 7:42:14 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value="/css/site2.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container">
        <form  action="<c:url value="/user/register_handler.do"/>"  style="max-width:700px;margin:auto" method="post">
            <h2><span class="glyphicon glyphicon-user"></span> Register</h2>
            <div class="input-container">
                <i class="fa fa-address-card icon"></i>
                <input class="input-field" type="text" placeholder="Enter Your Name" name="name" value="${name}" required>
            </div>

            <div class="input-container">
                <i class="fa fa-phone icon"></i>
                <input class="input-field" type="tel" placeholder="Enter Your Phone's Number" name="phone" value="${phone}" required>
            </div>
            <i style="color: red">${pmessage}</i>

            <div class="input-container">
                <i class="fa fa-location-arrow icon"></i>
                <input class="input-field" type="text" placeholder="Enter Your Address" name="address" value="${address}"  required>
            </div>

            <div class="input-container">
                <i class="fa fa-envelope icon"></i>
                <input class="input-field" type="email" placeholder="Enter Your Email" name="email" value="${email}"  required>
            </div>
            <i style="color: red">${emessage}</i>

            <div class="input-container">
                <i class="fa fa-user icon"></i>
                <input class="input-field" type="text" placeholder="Enter Username" name="userName" value="${userName}"  required>
            </div>
            <i style="color: red">${message}</i>

            <div class="input-container">
                <i class="fa fa-key icon"></i>
                <input class="input-field" type="password" placeholder="Enter Password" name="password" value="${password}"  required>
            </div> 
            <div class="input-container">
                <i class="fa fa-check icon"></i>
                <input class="input-field" type="password" placeholder="Repeat Password" name="re-password" value="${rpassword}" required>
            </div> 
            <i style="color: red">${rmessage}</i>
            <div class="psw">
                <label>
                    &nbsp;
                </label>
                <a href="<c:url value="/user/login.do"/>" >Login</a><br/>
                <a href="<c:url value="/user/register.do"/>">Register</a><br/>
            </div>
            <button type="submit" style="color: white" name="op">Register</button>
        </form>

    </div>
</body>