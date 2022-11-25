<%-- 
    Document   : confirm
    Created on : Jul 18, 2022, 3:06:31 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Order Confirm</title>
    </head>
    <body>
        <div class="container">
            <h1>Order Successfully!</h1>
            <h3>We will contact you soon</h3>
            <div class="continue">
                <a href="<c:url value="/home/index.do"/>">Continue Purchasing &DoubleRightArrow;</a>
            </div>
        </div>
    </body>
</html>
