<%-- 
    Document   : headeruser
    Created on : Oct 31, 2024, 10:03:18 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <div class="dropdown position-relative me-2">
                            <button class="btn btn-outline-primary featured-item">
                                Quản lý tài khoản
                            </button>

                            <div class="dropdownmenu">
                                <a href="PostServlet?command=history&userId=${sessionScope.user.userId}" class="nav-link">Thông tin cá nhân</a>
                                <a href="#" onclick="document.getElementById('logoutForm').submit()">Đăng xuất</a>
                                <form id="logoutForm" action="LoginServlet" method="post" style="display: none;">
                                    <input type="hidden" name="action" value="logout">
                                </form>
                            </div>

                        </div>
                        <a href="post.jsp?userId=${sessionScope.user.userId}" class="btn btn-danger featured-item">Đăng Tin Miễn Phí </a>
                    </div>
                    <form action="SearchServlet" method="Post" class="search-form mb-4" id="searchForm">
                        <div class="input-group">
                            <input type="text" class="form-control" style="width: 300px;" name="name" placeholder="Tìm phòng trọ..." aria-label="Search" onkeypress="handleKeyPress(event)">
                        </div>
                    </form>

                    <script>
                        function handleKeyPress(event) {
                            // Kiểm tra nếu phím nhấn là phím Enter
                            if (event.key === "Enter") {
                                event.preventDefault(); // Ngăn chặn hành động mặc định của Enter
                                document.getElementById('searchForm').submit(); // Gửi biểu mẫu
                            }
                        }
                    </script>
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
                            <a class="nav-link featured-item" href="HomeServlet" style="color: #ededed;">Trang Chủ</a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link featured-item" href="Service_price.jsp" style="color: #f5f4f4;">Bảng Giá Dịch Vụ</a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="support.jsp" style="color: #fefbfb;"><h6 class="featured-item">Hỗ Trợ</h6></a> <!-- Màu chữ -->
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
