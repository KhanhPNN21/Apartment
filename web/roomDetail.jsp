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
                font-family: 'Roboto','Arial' ;
            }
            .container {
                margin-top: 20px;
            }
            .list {
                border: 1px solid black;
                transition: transform 0.3s ease-in-out;
            }
            .list:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            }
            .stars {
                display: inline-block;
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <% 
    if (session.getAttribute("user") != null) {
        %>
        <jsp:include page="headeruser.jsp" />
        <% 
            } else {
        %>
        <jsp:include page="headerhome.jsp" />
        <% 
            } 
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <!-- Main Card for All Room Details -->
                    <!-- Image Section -->
                    <div id="roomCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
                        <!-- Indicators -->
                        <div class="carousel-indicators">
                            <c:forEach var="imgUrl" items="${room.imgUrls}" varStatus="status">
                                <button type="button" data-bs-target="#roomCarousel" data-bs-slide-to="${status.index}"
                                        class="${status.first ? 'active' : ''}" 
                                        aria-current="${status.first ? 'true' : 'false'}" 
                                        aria-label="Slide ${status.index + 1}"></button>
                            </c:forEach>
                        </div>

                        <!-- Carousel Images -->
                        <div class="carousel-inner">
                            <c:forEach var="imgUrl" items="${room.imgUrls}" varStatus="status">
                                <div class="carousel-item ${status.first ? 'active' : ''}">
                                    <img src="${imgUrl}" class="d-block w-100 img-fluid border rounded-3 shadow-sm" 
                                         alt="Room Image" style="max-height: 300px; object-fit: cover;">
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Navigation controls -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#roomCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#roomCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <!-- Main Card for All Room Details -->
                    <div class="card shadow-sm" style="background-color: rgba(255, 255, 255, 0.9); border: 1px solid black;">
                        <div class="card-body">

                            <!-- Room Information -->
                            <c:choose>
                                <c:when test="${room.rank == 4}">
                                    <h4 class="fw-bold" style="color: red;">${room.title}</h4>
                                </c:when>
                                <c:when test="${room.rank == 3}">
                                    <h4 class="fw-bold" style="color: pink;">${room.title}</h4>
                                </c:when>
                                <c:when test="${room.rank == 2}">
                                    <h4 class="fw-bold" style="color: orange;">${room.title}</h4>
                                </c:when>
                                <c:when test="${room.rank == 1}">
                                    <h4 class="fw-bold" style="color: #0000FF;">${room.title}</h4>
                                </c:when>
                            </c:choose>

                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <p style="color: #0d8901;">
                                        <strong>Số tiền:</strong> 
                                        <span class="fw-bold" id="roomPrice">${room.price}</span><strong>/tháng</strong>
                                    </p>
                                </div>

                                <div class="col-md-3">
                                    <p><strong>Phòng:</strong> <span class="fw-bold"></span>${room.roomNumber}</p>
                                </div>
                                <div class="col-md-3">
                                    <p><strong>Diện tích:</strong> <span class="fw-bold"></span>${room.area} m²</p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <p><strong>Thời gian:</strong> <span class="fw-bold"></span>${room.postDate}</p>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <p><strong>Địa chỉ:</strong> <span class="fw-bold"></span>${room.street}, ${room.ward}, ${room.district}</p>
                            </div>
                            <!-- Section Separator -->
                            <hr>

                            <!-- Room Description -->
                            <h5 class="fw-bold">THÔNG TIN MÔ TẢ</h5>
                            <p>${room.description}</p>

                            <!-- Section Separator -->
                            <hr>

                            <!-- Post Information -->
                            <h5 class="fw-bold">ĐẶC ĐIỂM TIN ĐĂNG</h5>
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <p><strong>Mã tin:</strong> <span class="fw-bold"></span>${room.roomId}</p>
                                </div>
                                <div class="col-md-7">
                                    <p><strong>Khu vực:</strong> <span class="fw-bold"></span>${room.ward}, ${room.district}</p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <p><strong>Cấp độ tin tức:</strong> <span class="fw-bold"></span>${room.rank}</p>
                                </div>
                                <div class="col-md-7">
                                    <p><strong>Ngày đăng:</strong> <span class="fw-bold"></span>${room.postDate}</p>
                                </div>
                            </div>

                            <!-- Section Separator -->
                            <hr>

                            <!-- Contact Information -->
                            <h5 class="fw-bold">THÔNG TIN LIÊN HỆ</h5>
                            <p><strong>Tên:</strong> <span class="fw-bold"></span>${room.fullName}</p>
                            <p><strong>SĐT:</strong> <span class="fw-bold"></span>${room.phone}</p>
                            <p><strong>Email:</strong> <span class="fw-bold"></span>${room.email}</p>
                        </div>
                    </div>
                </div>


                <!-- Suggested Rooms Section -->
                <div class="col-md-4">
                    <h5 class="fw-bold text-primary">ĐỀ XUẤT KHÁC</h5>
                    <ul class="list-unstyled">
                        <c:choose>
                            <c:when test="${not empty rooms}">
                                <c:forEach var="r" items="${rooms}">

                                    <div class="listing-item mb-4 p-3 border rounded featured-item " style="background-color: transparent; border: 1px solid black">
                                        <a href="DetailServlet?roomId=${r.roomId}" class="text-decoration-none text-dark">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <img src="${r.imgUrl}" alt="Image" class="img-fluid rounded">
                                                </div>

                                                <div class="col-md-8">
                                                    <c:choose>
                                                        <c:when test="${r.rank == 4}">
                                                            <h5 class="mb-2" style="color: red;">★★★★★ ${r.title}</h5>
                                                        </c:when>
                                                        <c:when test="${r.rank == 3}">
                                                            <h5 class="mb-2" style="color: #FF1493;">★★★★ ${r.title}</h5>
                                                        </c:when>
                                                        <c:when test="${r.rank == 2}">
                                                            <h5 class="mb-2" style="color: #CD6600;">★★★ ${r.title}</h5>
                                                        </c:when>
                                                        <c:when test="${r.rank == 1}">
                                                            <h5 class="mb-2" style="color: #0000FF;">★★ ${r.title}</h5>
                                                        </c:when>
                                                    </c:choose>
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <strong>Giá:</strong> <fmt:formatNumber value="${r.price}" type="currency" currencySymbol="₫" />
                                                        </li>
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
        <script>
            window.onload = function () {
                const priceElement = document.getElementById('roomPrice');
                const price = parseInt(priceElement.innerText, 10);
                priceElement.innerText = price.toLocaleString('vi-VN') + ' ₫'; // Format price and append currency symbol
            };
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
