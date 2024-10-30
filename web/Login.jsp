<%-- 
    Document   : Login
    Created on : Oct 25, 2024, 11:01:13 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- JSTL Core Library -->
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập</title>
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
                border-radius: 15px;
                padding: 2rem;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Đổ bóng nhẹ */
                max-width: 450px;
                width: 100%;
                position: relative; /* Để đảm bảo thẻ ở trên gradient */
                z-index: 2; /* Đặt lớp trên cùng */
            }
            .form-label {
                font-weight: bold;
            }
            .text-danger {
                font-weight: bold;
                color: #dc3545; /* Màu đỏ cho thông báo lỗi */
            }
            .btn-success {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-success:hover {
                opacity: 0.9; /* Hiệu ứng hover */
            }
            .footer-link {
                margin-top: 1rem;
            }
            .footer-link a {
                text-decoration: none; /* Xóa gạch chân */
                color: #007bff; /* Màu chữ cho các liên kết */
            }
            .footer-link a:hover {
                text-decoration: underline; /* Thêm gạch chân khi hover */
                color: #0056b3; /* Màu chữ khi hover */
            }
        </style>
    </head>
    <body>
        <div class="gradient-overlay"></div> <!-- Đặt gradient lên trên ảnh nền -->
        <div class="container">
            <div class="card mx-auto">
                <h2 class="text-center mb-4">Đăng Nhập</h2>

                <c:if test="${not empty mess}">
                    <p class="text-danger text-center" style="font-size: 1.2rem; margin-top: 1rem;">⚠️ ${mess} ⚠️</p>
                </c:if>

                <form action="LoginServlet" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="mb-3">
                        <label for="inputUser" class="form-label">Tên đăng nhập</label>
                        <input class="form-control ${not empty errorMessage ? "is-invalid" : ""}" id="inputUser" name="username" type="text" placeholder="Tên đăng nhập" required />
                        <span class="text-danger">${not empty errorMessage ? errorMessage : ''}</span>
                    </div>
                    <div class="mb-3">
                        <label for="inputPass" class="form-label">Mật khẩu</label>
                        <div class="input-group">
                            <input class="form-control ${not empty errorMessage ? "is-invalid" : ""}" id="inputPass" name="password" type="password" placeholder="Mật khẩu" required />
                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <span class="text-danger">${not empty errorMessage ? errorMessage : ''}</span>
                    </div>
                    <div class="form-check mb-3">
                        <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu 🔒</label>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-success" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                    </div>
                    <div class="text-center footer-link">
                        <p>
                            <a href="Forget_pass.jsp">Quên mật khẩu? 🕵️‍♂️</a> | <a href="Signup.jsp">Tạo tài khoản mới 🎉</a>
                        </p>
                        <p>
                            <a href="home.jsp"><i class="fas"></i> Trở về trang chủ 🏠</a>
                        </p>
                    </div>
                </form>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#inputPass');

            togglePassword.addEventListener('click', function (e) {
                // Thay đổi thuộc tính type của trường mật khẩu
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);

                // Thay đổi icon mắt
                this.querySelector('i').classList.toggle('fa-eye');
                this.querySelector('i').classList.toggle('fa-eye-slash');
            });
        </script>
    </body>
</html>
