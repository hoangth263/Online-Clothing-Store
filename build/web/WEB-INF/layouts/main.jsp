<%-- 
    Document   : main
    Created on : Jul 6, 2022, 10:14:23 AM
    Author     : ThienHoang 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
<!--        <title>Home Page</title>-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>

        <div class="container-fluid text-center">

            <div class="row">

                <nav class="navbar navbar-inverse bg-primary" role="navigation">
                    <div class="container-fluid">
                        <!--Brand and toggle get grouped for better mobile display--> 
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div>
                            <a href="<c:url value="/"/>" style="padding: 0; margin-bottom: 30px">
                                <img src="<c:url value="/images/logo3.png"/>" width="300" height="180" />
                            </a> 
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <div class="text-center col-md-4" >
                                <ul class="nav navbar-nav" >
                                    <li> 
                                        <a class="link" href="<c:url value="/home/index.do"/>" style="color: white">Home</a> 
                                    </li>

                                    <li style="margin-left: 30px; margin-right: 30px">
                                        <a  class="link" href="<c:url value="/product/listall.do"/>" style="color: white">Category</a>
                                        <ul>
                                            <li><a class="link" href="<c:url value="/product/listshirts.do"/>">Shirts</a></li>
                                            <li><a class="link" href="<c:url value="/product/listjackets.do"/>">Jackets</a></li>
                                            <li><a class="link" href="<c:url value="/product/listtrousers.do"/>">Trousers</a></li>
                                            <li><a class="link" href="<c:url value="/product/listaccessories.do"/>">Accessories</a></li>
                                        </ul>
                                    </li>

                                    <li style="margin-right: 20px">
                                        <a  class="link" href="<c:url value="/home/about.do"/>" style="color: white">About Us</a> 
                                    </li>

                                </ul>
                            </div>

                            <div class="col-md-4">
                                <form class="example  text-center" style="color: black; margin-left: 50px" action="<c:url value="/product/search.do" />">
                                    <input type="text" placeholder="Search..." name="search">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </div>

                            <div  class="col-md-4 ">
                                <a class="text-center link"  href="<c:url value="/cart/cartview.do"/>" style="text-align: center;position: relative;">
                                    <i class="fa fa-shopping-cart" style="font-size:30px; "></i>
                                    <sup style="position: absolute;font-size: 10pt; top: 15px; right: 0px;color: red"><strong>${count}</strong></sup>
                                </a>
                                <c:choose>
                                    <c:when test="${login}">
                                        <ul class="login ">
                                            <li>
                                                <a class="link" >Hi, ${name}</a>
                                                <ul>
                                                    <li><a class="link" href="<c:url value="/user/information.do"/>">Information</a></li>
                                                    <li><a class="link" href="<c:url value="/user/logout.do"/>">Logout</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="link" href="<c:url value="/user/login.do"/>">
                                            <i class="fa fa-user" style="font-size:30px"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div> <!-- /.navbar-collapse -->
                    </div>  <!--/.container-fluid--> 
                </nav>

            </div>
        </div>

        <!--Content-->
        <div class="container-fluid text-center row ">
            <div class="col" style="min-height: 500px">
                <jsp:include page="/WEB-INF/view/${controller}/${action}.jsp"/>
            </div>
        </div>

        <div class="container-fluid text-center ">
            <div class="footer  row ">
                <div class="col-md-4 " style="text-align: left; padding-left: 5%">
                    <table >
                        <tr>
                            <td>
                                <i class="mr fa fa-phone" style="font-size:24px"></i><br/>
                            </td>
                            <td>: 01234567890 </td>
                        </tr>

                        <tr>
                            <td>
                                <i class="mr fa fa-envelope" style="font-size:24px"></i><br/>
                            </td>
                            <td>: chuacomail@gmail.com</td>
                        </tr>

                        <tr> 
                            <td>
                                <i class="mr fa fa-map-marker" style="font-size:24px"></i>
                            </td>
                            <td style="letter-spacing: -1px;font-size: 11pt">: Lầu 1, Số 163 Trần Trọng Cung, Phường Tân Thuận Đông, Quận 7, Tp. Hồ Chí Minh</td>
                        </tr>

                    </table>

                </div>

                <div class="text-center  col-md-4" style="padding-top: 5.5%" >
                    <h5>&copy; Copyright 2022. T-Shirts.VN</h5>
                </div>

                <div class="col-md-4" style="float: left; padding-right: 5%;text-align: left;">
                    <h4><strong>Clothes Boutique</strong> luôn lắng nghe bạn!</h4>
                    <p>Chúng tôi luôn trân trọng và mong đợi nhận được mọi ý kiến đóng góp từ khách hàng để có thể nâng cấp trải nghiệm dịch vụ và sản phẩm tốt hơn nữa.</p>
                </div>

            </div>
        </div>

    </body>
</html>

