<%-- 
    Document   : header
    Created on : Oct 31, 2024, 9:57:11 AM
    Author     : acer
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg ">
            <div class="container d-flex justify-content-between">
                <a class="navbar-brand" href="#">ApartmentProvjp.com</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="d-flex align-items-center mx-auto">
                    <img class="logo mx-3" src="img/logo.jpg" alt="Logo">
                </div>

                <div class="d-flex align-items-center flex-column">
                    <div class="d-flex align-items-center mb-2">
                        <a href="Login.jsp" class="btn btn-outline-primary me-2 featured-item">Đăng nhập</a>
                        <a href="Signup.jsp" class="btn btn-primary featured-item">Đăng kí</a>
                    </div>
                    <input type="text" class="form-control" style="width: 300px;" placeholder="Tìm phòng trọ..." aria-label="Search"> <!-- Thay đổi width tại đây -->
                </div>


            </div>
        </nav>
        <nav class="navbar navbar-expand-lg sticky-navbar" style="background-color: #B39B86;"> <!-- Màu be -->
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarLinks" aria-controls="navbarLinks" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarLinks">
                    <ul class="navbar-nav mx-auto w-100 justify-content-around">
                        <li class="nav-item active">
                            <a class="nav-link featured-item" href="home.jsp" style="color: #ededed;"><h6>Trang Chủ</h6></a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link featured-item" href="payment.jsp" style="color: #f5f4f4;"><h6>Liên Hệ</h6></a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Service_price.jsp" style="color: #fefbfb;"><h6>Bảng Giá Dịch Vụ</h6></a> <!-- Màu chữ -->
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
