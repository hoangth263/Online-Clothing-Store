<%-- 
    Document   : information
    Created on : Jul 7, 2022, 1:33:39 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <h2><span></span> Information</h2>
    <div class="container"> 
        <table class=" table table-striped" style="text-align: left">
            <tr>
                <td>
                    <strong>User's Name</strong>
                </td>
                <td>
                    ${userInfo.name}
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Phone's Number</strong>
                </td>
                <td>
                    ${userInfo.phone}
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Address</strong>
                </td>
                <td>
                    ${userInfo.address}
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Email</strong>
                </td>
                <td>
                    ${userInfo.email}
                </td>
            </tr>
        </table>
    </div>
</body>