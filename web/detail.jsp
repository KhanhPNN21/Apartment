<%-- 
    Document   : roomDetail
    Created on : Oct 24, 2024, 10:39:20 PM
    Author     : Tai
--%>

<%@page import="Model.Home_DAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<%@ page import="java.sql.*, Model.Rooms, DAO.RoomDAO" %>
<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));
    System.out.println("Room ID: " + roomId);
    Home_DAO roomDAO = new Home_DAO();
    Rooms room = roomDAO.getRoomById(roomId);
    System.out.println(room);

%>
<r:set var="r" value="${room}"/>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin chi tiết phòng trọ</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                font-family: 'Arial', 'sans-serif';
                text-align: left; /* Căn chỉnh nội dung sang bên trái */
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <!-- Image section -->
                    <div class="text-center mb-4">
                        <img src="https://feliz-home.com.vn/wp-content/uploads/2023/02/uecuhb.jpg" alt="Room Image" class="img-fluid border rounded-3 shadow-sm" style="max-height: 300px; width: 100%; object-fit: cover;">
                    </div>

                    <!-- Room information -->
                    <h5 class="fw-bold text-primary">TÊN</h5>
                    <p class="text-muted">${r.title}</p>

                    <!-- First row with 3 attributes -->
                    <div class="row">
                        <div class="col-md-4">
                            <p>Số tiền: <span class="fw-bold">${r.price}</span> / tháng</p>
                        </div>
                        <div class="col-md-4">
                            <p>Phòng: <span class="fw-bold">${r.roomNumber}</span></p>
                        </div>
                        <div class="col-md-4">
                            <p>Diện tích: <span class="fw-bold">${room.area} m²</span></p>
                        </div>
                    </div>

                    <!-- Second row with 2 attributes -->
                    <div class="row">
                        <div class="col-md-6">
                            <p>Thời gian: <span class="fw-bold">${room.postDate}</span></p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <p>Địa chỉ: <span class="fw-bold">${room.street}, ${room.ward}, ${room.district}</span></p>
                        </div>
                    </div><br>

                    <h5 class="fw-bold text-primary">THÔNG TIN MÔ TẢ</h5>
                    <div>
                        ${room.description}
                    </div><br>    
                    <!-- Post Information -->
                    <h5 class="fw-bold mt-4 text-primary">ĐẶC ĐIỂM TIN ĐĂNG</h5>
                    <div class="row">
                        <!-- First row with 2 attributes -->
                        <div class="col-md-6">
                            <p>Mã tin: <span class="fw-bold"></span></p>
                        </div>
                        <div class="col-md-6">
                            <p>Khu vực: <span class="fw-bold">${room.ward}, ${room.district}</span></p>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Second row with 2 attributes -->
                        <div class="col-md-6">
                            <p>Cấp độ tin tức: <span class="fw-bold"></span></p>
                        </div>
                        <div class="col-md-6">
                            <p>Ngày đăng: <span class="fw-bold">${room.postDate}</span></p>
                        </div>
                    </div>



                    <!-- Contact information -->
                    <h5 class="fw-bold mt-4 text-primary">Thông tin liên hệ</h5>
                    <p>Tên: <span class="fw-bold">${contactName}</span></p>
                    <p>SĐT: <span class="fw-bold">${contactPhone}</span></p>
                    <p>Email: <span class="fw-bold">${contactEmail}</span></p>
                </div>

                <div class="col-md-4">
                    <h5 class="fw-bold text-primary">ĐỀ XUẤT KHÁC</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-decoration-none btn btn-outline-primary btn-sm mb-2">Thông tin 1</a></li>
                        <li><a href="#" class="text-decoration-none btn btn-outline-primary btn-sm mb-2">Thông tin 2</a></li>
                        <li><a href="#" class="text-decoration-none btn btn-outline-primary btn-sm mb-2">Thông tin 3</a></li>
                        <li><a href="#" class="text-decoration-none btn btn-outline-primary btn-sm mb-2">Thông tin 4</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>