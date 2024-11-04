<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    
    <!-- Link to Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Link to Google Fonts for Vietnamese support -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap&subset=vietnamese" rel="stylesheet">
    
    <style>
        /* Styling for the body and fonts */
        body {
            background: url('image/background2.jpg') no-repeat center center fixed;
            background-position: center;
            background-color: #eee;
            background-repeat: no-repeat;
            background-size: cover;
            color: #505050;
            font-family: 'Noto Sans', Arial, sans-serif; /* Font with Vietnamese support */
            font-size: 14px;
            font-weight: normal;
            line-height: 1.5;
            text-transform: none;
        }

        .forgot {
            background-color: #fff;
            padding: 12px;
            border: 1px solid #dfdfdf;
        }

        .padding-bottom-3x {
            padding-bottom: 72px !important;
        }

        .card-footer {
            background-color: #fff;
        }

        .btn {
            font-size: 13px;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #76b7e9;
            outline: 0;
            box-shadow: 0 0 0 0px #28a745;
        }

        /* Custom CSS for error alert */
        .custom-alert {
            background-color: #f8d7da; /* Màu nền */
            color: #721c24; /* Màu chữ */
            padding: 15px; /* Padding cho thông báo */
            border-radius: 5px; /* Bo góc */
            margin-bottom: 20px; /* Khoảng cách phía dưới */
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
    <div class="container padding-bottom-3x mb-2 mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="forgot">
                    <h2>Quên mật khẩu?</h2>
                    <p>Thay đổi mật khẩu của bạn theo 3 bước đơn giản. Điều này sẽ giúp bạn bảo vệ tài khoản của mình!</p>
                    <ol class="list-unstyled">
                        <li><span class="text-primary text-medium">1. </span>Nhập địa chỉ email của bạn bên dưới.</li>
                        <li><span class="text-primary text-medium">2. </span>Hệ thống của chúng tôi sẽ gửi cho bạn một OTP đến email của bạn.</li>
                        <li><span class="text-primary text-medium">3. </span>Nhập OTP ở trang tiếp theo.</li>
                    </ol>
                </div>
                
                <!-- Hiển thị thông báo lỗi nếu có -->
                <c:if test="${not empty errorMessage}">
                    <div class="custom-alert" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                    
                <form class="card mt-4" action="forgotPassword" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="email-for-pass">Nhập địa chỉ email của bạn</label>
                            <input class="form-control" type="text" name="email" id="email-for-pass" required>
                            <small class="form-text text-muted">Nhập địa chỉ email đã đăng ký. Sau đó, chúng tôi sẽ gửi mã OTP đến địa chỉ này.</small>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-success" type="submit">Đặt lại mật khẩu</button>
                        <button class="btn btn-danger" type="button" onclick="window.location.href='home.jsp'">Trở về trang chủ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Script for Bootstrap functionality -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
