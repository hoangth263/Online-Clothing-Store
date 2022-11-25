<%-- 
    Document   : search
    Created on : Jul 6, 2022, 10:49:46 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Result of : ${search}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/css/stylecategory.css"/>" rel="stylesheet">
    </head>
    <body>
        <div class="container cateLink">

            <div class="row">

                <div class="col-md-3 ">

                    <h3>Result of : <span style="color: red">${search}</span></h3>

                </div>

            </div>

            <div class="row">

                <c:forEach var="product" items="${listProduct}" >
                    
                    <div class="col-md-3 text-center" >
                        
                        <c:if test="${product.caId==1}">
                            
                            <c:set var="type" value="Shirt"/>
                            
                        </c:if>
                        <c:if test="${product.caId==2}">
                            
                            <c:set var="type" value="Trouser"/>
                            
                        </c:if>
                        <c:if test="${product.caId==3}">
                            
                            <c:set var="type" value="Jacket"/>
                            
                        </c:if>
                        <c:if test="${product.caId==4}">
                            
                            <c:set var="type" value="Accessory" />
                            
                        </c:if>
                        <div>

                            <a href="<c:url value="/cart/detail.do?id=${product.pId}"/>" class="zoom">
                                
                                <img style="width: 100%;" alt="${product.pName}" alt="${product.pName}" class="img-responsive" src="<c:url value="/images/${product.image}"/>" />
                                <div class="item">
                                    
                                    <p class="item-title1">${product.pName}</p>
                                    <p class="item-desc">Type: <span style="font-weight: bold;margin-left: 10px;">${type}</span> </p>
                                    <p>Price: <span style=" margin-left:10px; ">${product.price}00 vnđ</span></p>
                                    
                                </div>
                                
                            </a>

                        </div>

                    </div>

                </c:forEach>



                <c:if test="${list==null}">
                    
                    <div class="col-md-12 text-center">

                        <h2 class = "not-found">NOT FOUND.</h2>

                    </div>
                    
                </c:if>
                
            </div>
                    
        </div>
                    
    </body>
    
</html>