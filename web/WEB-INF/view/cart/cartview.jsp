<%-- 
    Document   : cartview
    Created on : Jul 4, 2022, 5:16:19 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="locale" value="vi_VN" scope="page"/>
<fmt:setLocale value="vi_VN"/>
<html>
    <head>
        <title> Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <div class="card container">
            <div class="card-header">
                <h4>
                    Your Cart
                </h4> 
            </div>
            <c:choose>
                <c:when test="${login}">
                    <form action="<c:url value='/cart/checkout.do'/>">
                        <div class="form-group">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th >No.</th>
                                        <th >Product's Name</th>
                                        <th >Quantity</th>
                                        <th >Size</th>
                                        <th >Price</th>
                                        <th ></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="0"/>
                                    <c:forEach var="cart" items="${list}" varStatus="loop">
                                        <tr>
                                            <td style="text-align: left;font-size: 15pt ">${loop.count}</td>
                                            <td >
                                                <a href="<c:url value="/cart/detail.do?id=${cart.pId}"/>" class="cart-item">
                                                    <img src="<c:url value="/images/${cart.image}"/>" alt=""/>
                                                    ${cart.pName}
                                                </a>
                                            </td>
                                            <td style="float: left;font-size: 20px">${cart.quantity}</td>
                                            <td style="text-align: left;font-size: 15pt">${cart.size}</td>
                                            <td style="text-align: left; font-size: 15pt;" ><fmt:formatNumber value="${cart.price}" type="currency" pattern="#,###.000 đ"/></td>
                                            <td >
                                                <a href="<c:url value="/cart/delete.do?pId=${cart.pId}&size=${cart.size}"/>">Delete</a>
                                            </td>
                                        </tr>
                                        <c:set var="total" value="${total + cart.price * cart.quantity}"/>
                                    </c:forEach>
                                    <tr>
                                        <th colspan="5" style="text-align: right; font-size: 15pt;" >Total</th>
                                        <th style="text-align: center; font-size: 15pt;" ><fmt:formatNumber value="${total}" type="currency" pattern="#,###.000 đ"/></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <button class="cart-btn" type="submit" name="total" value="${total}">Check out</button>  
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="<c:url value='/cart/information.do'/>">
                        <div class="form-group">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th >No.</th>
                                        <th >Product's Name</th>
                                        <th >Quantity</th>
                                        <th >Size</th>
                                        <th >Price</th>
                                        <th ></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="0"/>
                                    <c:forEach var="cart" items="${list}" varStatus="loop">
                                        <tr>
                                            <td style="text-align: left;font-size: 15pt ">${loop.count}</td>
                                            <td >
                                                <a href="<c:url value="/cart/detail.do?id=${cart.pId}"/>" class="cart-item">
                                                    <img src="<c:url value="/images/${cart.image}"/>" alt=""/>
                                                    ${cart.pName}
                                                </a>
                                            </td>
                                            <td style="float: left;font-size: 20px">${cart.quantity}</td>
                                            <td style="text-align: left;font-size: 15pt">${cart.size}</td>
                                            <td style="text-align: left; font-size: 15pt;" ><fmt:formatNumber value="${cart.price}" type="currency" pattern="#,###.000 đ"/></td>
                                            <td >
                                                <a href="<c:url value="/cart/delete.do?pId=${cart.pId}&size=${cart.size}"/>">Delete</a>
                                            </td>
                                        </tr>
                                        <c:set var="total" value="${total + cart.price * cart.quantity}"/>
                                    </c:forEach>
                                    <tr>
                                        <th colspan="5" style="text-align: right; font-size: 15pt;" >Total</th>
                                        <th style="text-align: center; font-size: 15pt;" ><fmt:formatNumber value="${total}" type="currency" pattern="#,###.000 đ"/></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <button class="cart-btn" type="submit" name="total" value="${total}">Check out</button>  
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
