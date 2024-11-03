<%-- 
    Document   : support
    Created on : Nov 2, 2024, 9:13:16 AM
    Author     : HIEU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hỗ trợ</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
        <style>
            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
            }
            .card-body {
                padding: 1.5rem; /* Tăng khoảng cách bên trong card */
            }
            .list-group-item {
                margin-bottom: 10px; /* Thêm khoảng cách giữa các mục trong danh sách */
            }

            .fw-semibold {
                margin-right: 10px; /* Thêm khoảng cách giữa nhãn và giá trị */
            }

        </style>
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
        <div class="container my-5" id="support">
            <h1 class="text-center text-primary mb-4">Thông Tin Hỗ Trợ</h1>
            <h4 class="text-center text-secondary mb-5">Người Chủ Trang Web</h4>

            <!-- Hàng đầu với 3 card -->
            <div class="row g-4">
                <div class="col-lg-4 d-flex justify-content-center">
                    <div class="card shadow-lg h-100">
                        <div class="card-body text-center">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Tên: </span> Nguyễn Lâm Hải
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Email: </span> lamhai@gmail.com
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Số điện thoại:</span> 0123456789
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Địa chỉ:</span> 123 Võ Chí Công, Đà Nẵng
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex justify-content-center">
                    <div class="card shadow-lg h-100">
                        <div class="card-body text-center">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Tên:</span> Trần Lê Trung Hiếu
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Email:</span> trunghieu@gmail.com
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Số điện thoại:</span> 0987654321
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Địa chỉ:</span> 456 Trần Đại Nghĩa, Đà Nẵng
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 d-flex justify-content-center">
                    <div class="card shadow-lg h-100">
                        <div class="card-body text-center">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Tên:</span> Phạm Nguyễn Nam Khánh
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Email:</span> namkhanh@gmail.com
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Số điện thoại:</span> 0912345678
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Địa chỉ:</span> 789 Lê Hữu Trác, Đà Nẵng
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hàng thứ hai với 2 card -->
            <div class="row g-4 mt-3">
                <div class="col-lg-6 d-flex justify-content-center">
                    <div class="card shadow-lg h-100">
                        <div class="card-body text-center">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Tên:</span> Nguyễn Đức Tài
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Email:</span> ductai@gmail.com
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Số điện thoại:</span> 0934567890
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Địa chỉ:</span> 123 Hùng Vương, Đà Nẵng
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 d-flex justify-content-center">
                    <div class="card shadow-lg h-100">
                        <div class="card-body text-center">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Tên:</span> Trịnh Quốc Trung
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Email:</span> quoctrung@gmail.com
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Số điện thoại:</span> 0976543210
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span class="fw-semibold">Địa chỉ:</span> 459 Lê Duẩn, Đà Nẵng
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
