<%-- 
    Document   : Login
    Created on : Oct 12, 2024, 10:28:42 AM
    Author     : PC
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
                background: url('image/background2.jpg') no-repeat center center fixed;
                background-size: cover;
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
                background: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }

            .card {
                background-color: rgba(255, 255, 255, 0.9);
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
                max-width: 500px;
                width: 100%;
                position: relative;
                z-index: 2;
                margin-top: 0; /* Giảm khoảng cách giữa logo và form đăng nhập */
            }

            .form-control {
                background-color: rgba(255, 255, 255, 0.9);
                border: 1px solid #ced4da;
                outline: none;
                border-radius: 10px;
            }

            .btn-success {
                background-color: rgba(40, 167, 69, 0.9);
                border-color: rgba(40, 167, 69, 0.9);
            }

            .btn-success:hover {
                background-color: rgba(40, 167, 69, 1);
                border-color: rgba(40, 167, 69, 1);
            }

            .form-label {
                font-weight: bold;
                font-size: 0.88rem;
            }

            .text-danger {
                font-size: 0.8rem;
                color: #dc3545;
            }

            .footer-link {
                margin-top: 0.7rem;
            }

            .footer-link a {
                text-decoration: none;
                color: #007bff;
            }

            .footer-link a:hover {
                text-decoration: underline;
                color: #0056b3;
            }

            .required {
                color: red;
                font-size: 0.8em;
                margin-left: 2px;
            }

            .logo-container {
                display: flex;
                justify-content: center;
                margin-bottom: 0; /* Giảm khoảng cách giữa logo và form đăng nhập */
                padding-bottom: 0; /* Không có padding dưới logo */
            }

            .logo-container img {
                max-width: 100%;
                height: auto;
                opacity: 0.7; /* Làm cho logo mờ hơn */
                border: none; /* Bỏ ô viền quanh logo */
                border-radius: 3%; /* Tạo hình tròn cho logo */
            }

            .small-text {
                text-decoration: none;
            }

            .input-group {
                position: relative;
            }

            .input-group-text {
                border: none;
                background-color: transparent;
                cursor: pointer;
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                padding: 0.375rem;
            }
        </style>
    </head>
    <body>
        <div class="gradient-overlay"></div>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <!-- Cột logo -->
                <div class="col-md-5 text-center logo-container">
                    <img src="img/logo.jpg" alt="Logo" class="img-fluid"> <!-- Bỏ margin-bottom -->
                </div>

                <!-- Cột form đăng nhập -->
                <div class="col-md-5">
                    <div class="card">
                        <h2 class="text-center mb-3">Chào mừng trở lại!</h2>
                        <p class="text-center">Rất vui mừng khi được gặp lại bạn!</p> 
                        <c:if test="${not empty mess}">
                            <p class="text-danger text-center" style="font-size: 1.2rem; margin-top: 1rem;">⚠️ ${mess} ⚠️</p>
                        </c:if>

                        <form action="LoginServlet" method="post">
                            <input type="hidden" name="action" value="login">
                            <div class="mb-3">
                                <label for="inputUser" class="form-label">TÊN ĐĂNG NHẬP <span class="required">*</span></label>
                                <input class="form-control ${not empty errorMessage ? "is-invalid" : ""}" id="inputUser" name="username" type="text" placeholder="Tên đăng nhập" required />
                            </div>
                            <div class="mb-3">
                                <label for="inputPass" class="form-label">MẬT KHẨU <span class="required">*</span></label>
                                <div class="input-group">
                                    <input class="form-control ${not empty errorMessage ? "is-invalid" : ""}" id="inputPass" name="password" type="password" placeholder="Mật khẩu" required />
                                    <span class="input-group-text" id="togglePassword">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                                <span class="text-danger">${not empty errorMessage ? errorMessage : ''}</span>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu 🔒</label>
                                </div>
                                <a href="Forget_pass.jsp" class="small-text">Quên mật khẩu? 🕵️‍♂️</a>
                            </div>

                            <div class="d-grid">
                                <button class="btn btn-success" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                            </div>
                            <div class="text-center footer-link">
                                <p>
                                    <a href="Signup.jsp">Tạo tài khoản mới 🎉</a>
                                </p>
                                <p>
                                    <a href="home.jsp"><i class="fas"></i> Trở về trang chủ 🏠</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // ẩn hiện mật khẩu
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
