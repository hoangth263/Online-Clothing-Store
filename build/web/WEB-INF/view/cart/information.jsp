<%-- 
    Document   : checkout
    Created on : Jul 11, 2022, 8:11:34 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Infomation</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Check out</title>
    </head>
    <body>
        <div class="container">
            <form action="<c:url value="/cart/confirm.do"/>">
                <table class="table table-striped info" style="text-align: right;">
                    <tr>
                        <td><Strong>Name:</Strong></td>
                        <td>
                            <input type="text" name="name" value="" style="float: left">
                        </td>
                    </tr>
                    <tr>
                        <td><Strong>Phone:</Strong></td>
                        <td>
                            <input type="tel" name="phone" value="" style="float: left">
                        </td>
                    </tr>
                    <tr>
                        <td><Strong>Email:</Strong></td>
                        <td>
                            <input type="email" name="email" value="" style="float: left">
                        </td>
                    </tr>
                    <tr>
                        <td><Strong>Address:</Strong></td>
                        <td>
                            <input type="text" name="address" value="" style="float: left">
                        </td>
                    </tr>
                </table>
            </form>
            <table class="table">
                <c:forEach var="cart" items="${list}" varStatus="loop">
                    <tr>
                        <td style="text-align: left;font-size: 15pt ">${loop.count}</td>
                        <td >
                            <div class="cart-item">
                                <img src="<c:url value="/images/${cart.image}"/>" alt=""/>
                                <p style=""><Strong>${cart.pName}</Strong></p>
                            </div>
                        </td>
                        <td style="text-align: center; font-size: 15pt;" ><fmt:formatNumber value="${cart.price}" type="currency" pattern="#,###.000 đ"/></td>
                    <td>x${cart.quantity}</td>
                    <td style="text-align: left;font-size: 15pt">${cart.size}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <th colspan="4" style="text-align: right; font-size: 15pt;" >Total</th>
                    <th style="text-align: center; font-size: 15pt;" ><fmt:formatNumber value="${total}" type="currency" pattern="#,###.000 đ"/></th>
                </tr>
            </table>
            <div class="purchase-btn">
                <a href="<c:url value="/cart/confirm.do?uId=&total=${total}"/>">Purchase</a>
            </div>
        </div>
    </body>
</html>
