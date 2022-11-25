<%-- 
    Document   : detail
    Created on : Jul 8, 2022, 2:18:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Item Detail</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <meta name="robots" content="noindex,follow" />
    </head>
    <body>
            <div class="container">
                <div class="col-md-6 left-column">
                    <img src="<c:url value="/images/${product.image}"/>" alt=""/>
                </div>
                <div class="col-md-6 right-column" >
                    <form action="<c:url value="/cart/addtocart.do?pId=${product.pId}&userName=${userName}"/>">

                        <!-- Product Description -->
                        <div class="product-description">
                            <span>${product.category}</span>
                            <h1>${product.pName}</h1>
                            <p>The preferred choice of a vast range of acclaimed DJs. Punchy, bass-focused sound and high isolation. Sturdy headband and on-ear cushions suitable for live performance</p>
                        </div>

                        <!-- Product Configuration -->

                        <div class="product-size">
                            <div class="col-md-6">
                                <span>Size</span>
                                <div class="size-choose">
                                    <div>
                                        <input id="S" type="radio" name="size" value="S" checked>
                                        <label for="S" style=" padding: 10px"><span>S</span></label>
                                    </div>
                                    <div>
                                        <input id="M" type="radio"  name="size" value="M">
                                        <label for="M" style=" padding: 10px"><span>M</span></label>
                                    </div>
                                    <div>
                                        <input id="L" type="radio"  name="size" value="L">
                                        <label for="L" style=" padding: 10px"><span>L</span></label>
                                    </div>
                                    <div>
                                        <input id="XL" type="radio"  name="size" value="XL">
                                        <label for="XL" style=" padding: 10px"><span>XL</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <span>Quantity</span>
                                <div class="form-group">
                                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="99">
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="id" value="${product.pId}">

                        <!-- Product Pricing -->
                        <div class="product-price">
                            <span>${price}</span>
                            <br/><input type="submit" class="cart-btn" value="Add to cart">
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>