<%-- 
    Document   : index
    Created on : Jul 6, 2022, 10:16:04 AM
    Author     : ThienHoang 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Home Page </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="slideshow-container banner">
                <div class="mySlides w3-container w3-center w3-animate-right">
                    <div class="numbertext">1 / 3</div>
                    <a href="#">
                        <img src="<c:url value="/images/Banner.png"/>" style="width: 100%"/>
                    </a>
                    <div class="text"></div>
                </div>

                <div class="mySlides w3-container w3-center w3-animate-right">
                    <div class="numbertext">2 / 3</div>
                    <a>
                        <img src="<c:url value="/images/banner1.jpg"/>" style="width: 100%"/>
                        <div class="text"></div>
                    </a>
                </div>

                <div class="mySlides w3-container w3-center w3-animate-right">
                    <div class="numbertext">3 / 3</div>
                    <a>
                        <img src="<c:url value="/images/banner3.jpg"/>" style="width: 100%"/>
                    </a>
                    <div class="text"></div>
                </div>
            </div>
            <br>

            <div style="text-align:center; padding-bottom: 20px">
                <button class="dot" onclick="currentDiv(0)"></button> 
                <button class="dot" onclick="currentDiv(1)"></button> 
                <button class="dot" onclick="currentDiv(2)"></button> 
            </div>

            <!--            <div class="w3-center w3-section" style="text-align: center">
                            <button class="w3-button dot" onclick="currentDiv(0)">1</button> 
                            <button class="w3-button dot" onclick="currentDiv(1)">2</button> 
                            <button class="w3-button dot" onclick="currentDiv(2)">3</button> 
                        </div>-->

            <script>
                let slideIndex = 0;
                showSlides();


                function showSlides() {
                    let i;
                    let slides = document.getElementsByClassName("mySlides");
                    let dots = document.getElementsByClassName("dot");
//                    let dots = document.getElementsByClassName("demo");
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    slideIndex++;
                    if (slideIndex > slides.length) {
                        slideIndex = 1
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    dots[slideIndex - 1].className += " active";
                    slides[slideIndex - 1].style.display = "block";
                    setTimeout(showSlides, 5000); // Change image every 2 seconds
                }
            </script>
        </div> <!--Kết thúc container-fluid-->

        <div class="container container-fluid">

            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>Best Seller</h2>
                </div>
            </div>

            <div class="row ">
                <div class="col-md-2" style="margin-left: 35px">
                    <a  href="<c:url value="/cart/detail.do?id=S004"/>" class="zoom">
                        <div class="service-row">
                            <img style="width: 100%; position: relative" class= "img-responsive" src="<c:url value="/images/Shirt (4).jpg"/>"/>
                            <div class="service-item" style="position: absolute; bottom: 0; width: 100%">
                                <h3 class="service-item-title">Nike Blue</h3>
                                <p>Shirt 1</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-2" style="margin-left: 35px">
                    <a href="<c:url value="/cart/detail.do?id=S005"/>" class="zoom">
                        <div class="service-row">
                            <img style="width: 100%;" class= "img-responsive" src="<c:url value="/images/Shirt (5).jpg"/>"/>
                            <div class="service-item" style="position: absolute; bottom: 0; width: 100%">
                                <h3 class="service-item-title">Dallas</h3>
                                <p>Shirt 2</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-2" style="margin-left: 35px">

                    <a href="<c:url value="/cart/detail.do?id=S006"/>" class="zoom">
                        <div class="service-row">
                            <img style="width: 100%;" class= "img-responsive" src="<c:url value="/images/Shirt (6).jpg"/>"/>
                            <div class="service-item" style="position: absolute; bottom: 0; width: 100%">
                                <h3 class="service-item-title">Yankees</h3>
                                <p>Shirt 3</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-2" style="margin-left: 35px">
                    <a href="<c:url value="/cart/detail.do?id=S007"/>" class="zoom">
                        <div class="service-row">
                            <img style="width: 100%;" class= "img-responsive" src="<c:url value="/images/Shirt (7).jpg"/>"/>
                            <div class="service-item" style="position: absolute; bottom: 0; width: 100%">
                                <h3 class="service-item-title">Stylelist</h3>
                                <p>Shirt 4</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-2" style="margin-left: 35px">
                    <a href="<c:url value="/cart/detail.do?id=S008"/>" class="zoom">
                        <div class="service-row">
                            <img style="width: 100%;" class= "img-responsive" src="<c:url value="/images/Shirt (8).jpg"/>"/>
                            <div class="service-item" style="position: absolute; bottom: 0; width: 100%">
                                <h3 class="service-item-title">Jordan</h3>
                                <p>Shirt 5</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>New Arrival</h2>
                    <p class="combo-header-des">Check It Out</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="<c:url value="/cart/detail.do?id=S009"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Shirt (9).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title it" style="color: black">Stussy Yellow Stripe Shirt</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>200.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">160.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="<c:url value="/cart/detail.do?id=S010"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Shirt (10).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title" style="color: black">Ringer Vintage Shirt</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>200.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">160.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="<c:url value="/cart/detail.do?id=J001"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Jacket (1).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title" style="color: black">Supreme Red Jacket</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>200.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">160.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="<c:url value="/cart/detail.do?id=J002"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Jacket (2).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title" style="color: black">The North Face Jacke</p>
                                <!--                                <p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>200.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">160.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>


            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>Sale Off</h2>
                    <p class="combo-header-des">So you know it good</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <a href="<c:url value="/cart/detail.do?id=J003"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Jacket (3).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title it" style="color: black">Scrapes Jacket</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>500.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">220.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="<c:url value="/cart/detail.do?id=J004"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Jacket (4).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title" style="color: black">Gile Jacket</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>500.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">220.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="<c:url value="/cart/detail.do?id=J007"/>">
                        <div class="zoom1">
                            <img src="<c:url value="/images/Jacket (7).jpg"/>" class="img-responsive"/>
                            <div class="item">
                                <p class="item-title" style="color: black">Mizzou Hoodie</p>
                                <!--<p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>-->
                                <p style="color: black">Price: <del>500.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">220.000vnđ</span></p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>

            <div class="row" style="margin-top: 20px">
                <!--                <div class="col-md-6">
                                    <div>
                                        <img src="" class="img-responsive"/>
                                    </div>
                                </div>
                
                                <div>
                                    <div class="col-md-3">
                                        <img src="" class="img-responsive"/>
                                        <div class="item">
                                            <p class="item-title">Chưa nghĩ ra</p>
                                            <p>Discount locations:<span style="font-weight:bold; margin-left: 10px;">Tan Phu District Branch</span> </p>
                                            <p><del>100%</del> <span style="color: #F72B2F; margin-left:10px; ">80%</span></p>
                                        </div>
                                    </div>
                                </div>
                
                                <div>
                                    <div class="col-md-3">
                                        <img src="" class="img-responsive"/>
                                        <div class="item">
                                            <p class="item-title">Chưa nghĩ ra</p>
                                            <p>Discount locations:<span style="font-weight: bold;margin-left: 10px;">Tan Phu District Branch</span> </p>
                                            <p><del>60.000vnđ</del> <span style="color: #F72B2F; margin-left:10px; ">0vnđ</span></p>
                                        </div>
                                    </div>
                                </div>-->

            </div>

        </div>

    </body>
</html>

