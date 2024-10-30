<%-- 
    Document   : Signup
    Created on : Oct 25, 2024, 11:02:43 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- JSTL Core Library -->
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Ký</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                background: url('image/background.jpg') no-repeat center center fixed; /* Đường dẫn tới ảnh nền */
                background-size: cover; /* Ảnh nền phủ toàn bộ màn hình */
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative; /* Để gradient nằm trên ảnh nền */
            }
            .gradient-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.5); /* Gradient nền với độ tối */
                z-index: 1; /* Đặt lớp trên cùng */
            }
            .card {
                background-color: rgba(255, 255, 255, 0.9); /* Màu nền của thẻ với độ trong suốt */
                border-radius: 15px;
                padding: 2rem;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Đổ bóng mạnh hơn */
                max-width: 450px; /* Giới hạn chiều rộng của thẻ card */
                width: 100%; /* Đảm bảo thẻ chiếm toàn bộ chiều rộng có sẵn */
                position: relative; /* Để đảm bảo thẻ ở trên gradient */
                z-index: 2; /* Đặt lớp trên cùng */
            }
            .form-label {
                font-weight: bold;
            }
            .text-danger {
                font-weight: bold;
            }
            .btn-primary {
                background-color: #007bff; /* Màu của nút Đăng ký */
                border-color: #007bff;
                padding: 10px; /* Thêm khoảng cách cho nút */
            }
            .footer-link {
                margin-top: 1rem;
            }
            /* Thêm quy tắc CSS để xóa gạch chân cho các liên kết */
            .footer-link a {
                text-decoration: none; /* Xóa gạch chân */
                color: #007bff; /* Màu chữ cho các liên kết */
            }
            .footer-link a:hover {
                text-decoration: underline; /* Thêm gạch chân khi hover */
                color: #0056b3; /* Màu chữ khi hover */
            }
            h2 {
                font-size: 1.5rem; /* Đặt kích thước tiêu đề */
                color: #333; /* Màu tiêu đề */
            }
        </style>
    </head>
    <body>
        <div class="gradient-overlay"></div> <!-- Đặt gradient lên trên ảnh nền -->
        <div class="container">
            <div class="card mx-auto">
                <h2 class="text-center mb-4">Đăng Ký Tài Khoản <i class="fas fa-user-plus"></i></h2>
                    <c:if test="${not empty mess}">
                    <p class="text-danger text-center">⚠️ ${mess} ⚠️</p>
                </c:if>
                <form action="signup" method="post">
                    <div class="mb-3">
                        <label for="inputUserReg" class="form-label">Tên đăng nhập</label>
                        <input name="user" type="text" id="inputUserReg" class="form-control" placeholder="Tên đăng nhập" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassReg" class="form-label">Mật khẩu</label>
                        <input name="pass" type="password" id="inputPassReg" class="form-control" placeholder="Mật khẩu" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputConfirmPass" class="form-label">Xác nhận mật khẩu</label>
                        <input name="confirmPass" type="password" id="inputConfirmPass" class="form-control" placeholder="Xác nhận mật khẩu" required>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                    </div>
                    <div class="text-center footer-link">
                        <p>Đã có tài khoản? <a href="Login.jsp" class="link-primary">Đăng nhập</a> 🎉</p>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
