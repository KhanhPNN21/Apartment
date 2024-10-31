<%-- 
    Document   : home
    Created on : Oct 12, 2024, 12:32:19 PM
    Author     : acer
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ApartmentProvje</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css"/>
<!--        <link rel="stylesheet" href="css/user.css"/>-->

    </head>
    <body>
  <% 
    // Kiểm tra thuộc tính 'user' trong session
    if (session.getAttribute("user") != null) {
        // Người dùng đã đăng nhập, include trang a.jsp
%>
        <jsp:include page="headeruser.jsp" />
<% 
    } else {
        // Người dùng chưa đăng nhập, include trang b.jsp
%>
        <jsp:include page="headerhome.jsp" />
<% 
    } 
%>
    <jsp:include page="searchbar.jsp"/>
    <jsp:include page="body.jsp" />
</body>
</html>

