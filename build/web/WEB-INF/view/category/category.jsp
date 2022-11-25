<%-- 
    Document   : category
    Created on : Jul 4, 2022, 12:45:01 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Category</title>
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
            <c:set var="check" value="0"/>

            <!-- LIST ONE TYPE -->
            
            <c:if test="${category>=1&&category<=4}">

                <div class="row">

                    <div class="col-md-12 text-center">

                        <c:if test="${category==1}">    
                            
                            <h2 >SHIRTS</h2>
                            
                        </c:if>
                        <c:if test="${category==2}">    
                            
                            <h2 >TROUSERS</h2>
                            
                        </c:if>
                        <c:if test="${category==3}">    
                            
                            <h2 >JACKETS</h2>
                            
                        </c:if>
                        <c:if test="${category==4}">    
                            
                            <h2 >ACCESSORIES</h2>
                            
                        </c:if>
                            
                    </div>

                </div>

                <div class="row">

                    <c:forEach var="product" items="${listProduct}">
                        
                        <div class="col-md-3 text-center" >

                            <div>
                                
                                <a href="<c:url value="/cart/detail.do?id=${product.pId}"/>" class="zoom">
                                    
                                    <img style="width: 100%;" alt="${product.pName}" alt="${product.pName}" class="img-responsive" src="<c:url value="/images/${product.image}"/>" />
                                    <div class="item">
                                        
                                        <p class="item-title1">${product.pName}</p>
                                        <p>Price: <span style=" margin-left:10px; ">${product.price}00 vnđ</span></p>
                                    </div>
                                    
                                </a>

                            </div>

                        </div>
                        <c:set var="check" value="${check+1}"/>       
                        
                    </c:forEach>
                    <br/>
                    <c:if test="${check==0}">

                            <div class="col-md-12 text-center">

                                <p>NOT AVAILABLE!!!</p>

                            </div>

                    </c:if>

                </div>

            </c:if>

            <!--LIST ALL ITEMS-->

            <c:if test="${category==0||category==null}">
                
                <c:forEach var="category" begin="1" end="4">

                    <div class="row ">
                        
                        <div class="col-md-12 text-center">

                            <c:if test="${category==1}">   
                                
                                <h2 >SHIRTS</h2>
                                
                            </c:if>
                            <c:if test="${category==2}">    
                                
                                <h2 >TROUSERS</h2>
                                
                            </c:if>
                            <c:if test="${category==3}">   
                                
                                <h2 >JACKETS</h2>
                                
                            </c:if>
                            <c:if test="${category==4}">    
                                
                                <h2 >ACCESSORIES</h2>
                                
                            </c:if>
                                
                        </div>
                        
                    </div>

                    <div class="row">

                        <c:forEach var="product" items="${listProduct}">
                            
                            <c:if test="${product.caId==category}">
                                
                                <div class="col-md-3 text-center">

                                    <div >
                                        
                                        <a href="<c:url value="/cart/detail.do?id=${product.pId}"/>" class="zoom">
                                            
                                            <img style="width: 100%;text-center" alt="${product.pName}" class="img-responsive " src="<c:url value="/images/${product.image}"/>" />
                                            <div class="item">
                                                
                                                <p class="item-title1">${product.pName}</p>
                                                <p>Price: <span style="margin-left:10px; ">${product.price}00 vnđ</span></p>
                                                
                                            </div>
                                                
                                        </a>
                                                
                                    </div>

                                </div>
                                <c:set var="check" value="${check+1}"/>   
                                
                            </c:if>
                            
                        </c:forEach>
                        <c:if test="${check==0}">

                                <div class="col-md-12 text-center">

                                    <p>NOT AVAILABLE!!!</p>

                                </div>
                            
                        </c:if>

                    </div>
                    <br/>
                    <c:set var="check" value="0"/>
                    
                </c:forEach>
                    
            </c:if>

        </div>

    </body>
    
</html>