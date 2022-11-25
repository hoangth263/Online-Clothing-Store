<%-- 
    Document   : category
    Created on : Jul 9, 2022, 6:08:43 PM
    Author     : Thien's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<body>
    <a href="<c:url value="/cart/detail.do?id=${product.pId}"/>"> ${product.pName}</a>
</body>
