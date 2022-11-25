<%-- 
    Document   : login
    Created on : Jul 4, 2022, 12:27:10 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>About Us</title>
    </head>
    <body>
        <div class="container">
            <div class="col-md-6">
                <a href="<c:url value="/home/index.do"/>">
                    <img src="<c:url value="/images/logo3.png"/>" alt="" style="width: 500px; height: 400px"/>
                </a>
            </div>
            <div class="col-md-6">
                <h1>About Us!</h1>
                <h3>Giới thiệu sơ về Clothes Boutique</h3>
                <hr>
                <br>
                <table cellspacing="10" style="text-align: left;">
                    <tr>
                        <td>
                            <i class='fas fa-map-marker-alt' style='font-size:24px'></i>
                        </td>
                        <td>
                            &nbsp; Homeless
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-envelope" style="font-size:24px"></i>
                        </td>
                        <td>
                            &nbsp; khongcomail123@gmail.com
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-phone" style="font-size:24px"></i>
                        </td>
                        <td>
                            &nbsp; 01234567890
                        </td>    
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
