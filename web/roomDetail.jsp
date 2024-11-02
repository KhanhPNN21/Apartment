<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, Model.Rooms, Model.RoomDAO" %>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin chi tiết phòng trọ</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/home.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
                    <h4 class="fw-bold text-primary">${room.title}</h4>

                    <!-- First row with 3 attributes -->
                    <div class="row">
                        <div class="col-md-4">
                            <p>Số tiền: <span class="fw-bold">${room.price}</span> / tháng</p>
                        </div>
                        <div class="col-md-4">
                            <p>Phòng: <span class="fw-bold">${room.roomNumber}</span></p>
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
                        <p>Địa chỉ: <span class="fw-bold">${room.street}, ${room.ward}, ${room.district}</span></p>

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
                            <p>Mã tin: <span class="fw-bold">${room.roomId}</span></p>
                        </div>
                        <div class="col-md-6">
                            <p>Khu vực: <span class="fw-bold">${room.ward}, ${room.district}</span></p>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Second row with 2 attributes -->
                        <div class="col-md-6">
                            <p>Cấp độ tin tức: <span class="fw-bold">${room.rank}</span></p>
                        </div>
                        <div class="col-md-6">
                            <p>Ngày đăng: <span class="fw-bold">${room.postDate}</span></p>
                        </div>
                    </div>



                    <!-- Contact information -->
                    <h5 class="fw-bold mt-4 text-primary">Thông tin liên hệ</h5>
                    <p>Tên: <span class="fw-bold">${room.fullName}</span></p>
                    <p>SĐT: <span class="fw-bold">${room.phone}</span></p>
                    <p>Email: <span class="fw-bold">${room.email}</span></p>
                </div>

                <div class="col-md-4">
                    <h5 class="fw-bold text-primary">ĐỀ XUẤT KHÁC</h5>
                    <ul class="list-unstyled">
                        <c:choose>
                            <c:when test="${not empty rooms}">
                                <c:forEach var="r" items="${rooms}">
                                    <!-- Phần tử liệt kê phòng trọ -->
                                    <div class="listing-item mb-4 p-3 border rounded featured-item">
                                        <a href="DetailServlet?roomId=${r.roomId}" class="text-decoration-none text-dark">
                                            <div class="row">
                                                <!-- Cột hiển thị hình ảnh -->
                                                <div class="col-md-4">
                                                    <img src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2021/03/10/z2372642429419-09c9c7a541863ae55ad41b3e267136f4_1615391265.jpg" 
                                                         alt="Image" class="img-fluid rounded">
                                                </div>

                                                <!-- Cột hiển thị thông tin chi tiết -->
                                                <div class="col-md-8">
                                                    <c:choose>
                                                        <c:when test="${r.rank == 4}">
                                                            <strong><h5 class="mb-2 title-4"> <div style="color:orange" class="stars">★★★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${r.rank == 3}">
                                                            <strong><h5 class="mb-2 title-3"> <div style="color: orange" class="stars">★★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${r.rank == 2}">
                                                            <strong><h5 class="mb-2 title-2"> <div style="color: orange" class="stars">★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${r.rank == 1}">
                                                            <strong><h5 class="mb-2 title-1"> <div style="color: orange" class="stars">★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                    </c:choose>
                                                    <ul class="list-unstyled">
                                                        <li><strong>Giá:</strong> ${r.price} VND</li>
                                                        <li><strong>Diện Tích:</strong> ${r.area} m²</li>
                                                        <li><strong>Địa Chỉ:</strong> ${r.ward}</li>
                                                        <li><strong>Số Phòng:</strong> ${r.roomNumber}</li>
                                                        <li><strong>Ngày Đăng:</strong> ${r.postdate}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>Không có phòng nào.</p>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>