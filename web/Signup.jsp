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
                background: url('image/background2.jpg') no-repeat center center fixed; /* Đường dẫn tới ảnh nền */
                background-size: cover; /* Ảnh nền phủ toàn bộ màn hình */
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative; /* Để gradient nằm trên ảnh nền */
            }
            .gradient-overlay {
                position: fixed; /* Sử dụng position fixed để overlay cố định */
                top: 0;
                left: 0;
                width: 100%; /* Chiếm toàn bộ chiều rộng */
                height: 100%; /* Chiếm toàn bộ chiều cao */
                background: rgba(0, 0, 0, 0.5); /* Màu nền tối cho overlay */
                z-index: 1; /* Đảm bảo overlay nằm trên nền */
            }
            .card {
                background-color: rgba(255, 255, 255, 0.9); /* Màu nền của thẻ với độ trong suốt */
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3    ); /* Đổ bóng mạnh hơn */
                max-width: 500px; /* Giới hạn chiều rộng của thẻ card */
                width: 100%; /* Đảm bảo thẻ chiếm toàn bộ chiều rộng có sẵn */
                position: relative; /* Để đảm bảo thẻ ở trên gradient */
                z-index: 2; /* Đặt lớp trên cùng */

            }
            .form-label {
                font-weight: bold;
                font-size: 0.85rem; /* Thay đổi cỡ chữ tại đây */
            }
            .text-danger {
                font-weight: bold;
            }
            .btn-primary {
                background-color: #007bff; /* Màu của nút Đăng ký */
                border-color: #007bff;
                padding: 10px; /* Thêm khoảng cách cho nút */
            }
            .form-text {
                padding-top: 4px;
                font-size: 0.8rem; /* Thay đổi cỡ chữ tại đây */
                color: #6c757d; /* Thay đổi màu sắc tại đây, có thể sử dụng mã màu hoặc tên màu CSS */
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
                margin-bottom: 1rem;
                margin-top: 7.5rem;
            }
            .mb-3 {
                margin-bottom: 0.75rem; /* Reduced spacing between form fields */
            }
            form {
                margin-bottom: 0px;
            }
            .text-left {
                font-size: 0.8rem;
                text-align: left; /* Căn lề trái */
            }

            .highlight {
                color: #0099FF	; /* Màu xanh cho các cụm từ */
                /* Để làm nổi bật (tuỳ chọn) */
            }
            .underline {
                text-decoration: none; /* Không gạch chân mặc định */
                transition: text-decoration 0.3s; /* Hiệu ứng chuyển tiếp mượt mà */
            }

            .underline:hover {
                text-decoration: underline; /* Gạch chân khi rê chuột vào */
            }
            .required {
                color: red; /* Đặt màu đỏ cho dấu sao */
                font-size: 0.8em; /* Điều chỉnh kích thước dấu sao nhỏ hơn */
                margin-left: 2px; /* Tạo khoảng cách giữa label và dấu sao */
            }
            .footer-link strong {
                font-size: 0.9rem; /* Chỉnh kích thước chữ tại đây */
            }
            .input-group-text {
                border: none; /* Bỏ viền */
                background-color: transparent; /* Đặt màu nền trong suốt */
                cursor: pointer; /* Thay đổi con trỏ khi hover */
                position: absolute; /* Đặt vị trí tuyệt đối */
                right: 10px; /* Định vị cách cạnh bên phải */
                top: 50%; /* Đặt nó giữa chiều cao ô nhập */
                transform: translateY(-50%); /* Giúp căn giữa chính xác */
                padding: 0.375rem; /* Thêm padding để biểu tượng không bị chèn sát viền */
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
                <form action="RegisterServlet" method="post">
                    <input type="hidden" name="action" value="signup">
                    <!-- Trường Họ và Tên -->
                    <div class="mb-3">
                        <label for="inputFullName" class="form-label">HỌ VÀ TÊN <span class="required">*</span></label>
                        <input name="fullName" type="text" id="inputFullName" class="form-control" placeholder="Họ và Tên" required>
                        <small id="fullNameMessage" class="form-text text-muted" style="display: none;">Đây sẽ là giao diện hiển thị của bạn trước những người khác. Bạn có thể sử dụng các kí tự đặc biệt và emoji.</small>
                    </div>
                    <div class="mb-3">
                        <label for="inputUserReg" class="form-label">TÊN ĐĂNG NHẬP <span class="required">*</span></label>
                        <input name="user" type="text" id="inputUserReg" class="form-control" placeholder="Tên đăng nhập" required>
                        <small id="userRegMessage" class="form-text text-muted" style="display: none;">Vui lòng chỉ sử dụng chữ cái, chữ cái dấu gạch dưới _, không được có khoảng trắng.</small>
                    </div>
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">EMAIL <span class="required">*</span></label>
                        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputSdt" class="form-label">SỐ ĐIỆN THOẠI <span class="required">*</span></label>
                        <input name="sdt" type="tel" id="inputSdt" class="form-control" placeholder="Số điện thoại" 
                               required pattern="[0-9]*" onkeypress="return event.charCode >= 48 && event.charCode <= 57" title="Chỉ cho phép nhập số">
                        <small id="sdtMessage" class="form-text text-muted" style="display: none;">Vui lòng chỉ nhập chữ số.</small>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassReg" class="form-label">MẬT KHẨU <span class="required">*</span> </label>
                        <div class="input-group">
                            <input name="pass" type="password" id="inputPassReg" class="form-control" placeholder="Mật khẩu" required>
                            <span class="input-group-text" id="togglePasswordReg">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="inputConfirmPass" class="form-label">XÁC NHẬN MẬT KHẨU <span class="required">*</span></label>
                        <div class="input-group">
                            <input name="confirmPass" type="password" id="inputConfirmPass" class="form-control" placeholder="Xác nhận mật khẩu" required>
                            <span class="input-group-text" id="toggleConfirmPassword">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                    </div>

                    <div class="d-grid">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                    </div>
                    <p class="text-muted mt-1 text-left">
                        Khi nhấn nút đăng ký, nghĩa là bạn đã đồng ý với 
                        <span class="highlight underline">Điều Khoản Dịch Vụ</span> và 
                        <span class="highlight underline">Chính Sách Bảo Mật</span> của ApartmentProvjp.
                    </p>

                    <div class="text-center footer-link">
                        <p>
                            <strong><a href="Login.jsp" class="link-primary">Đã có tài khoản?</a></strong> 🎉
                        </p>
                        <p>
                            <strong><a href="home.jsp"><i class="fas"></i>Trở về trang chủ 🏠</a></strong>
                        </p>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                   // Hiển thị/ẩn mật khẩu cho mật khẩu chính
                                   const togglePasswordReg = document.querySelector('#togglePasswordReg');
                                   const passwordReg = document.querySelector('#inputPassReg');
                                   togglePasswordReg.addEventListener('click', function (e) {
                                       const type = passwordReg.getAttribute('type') === 'password' ? 'text' : 'password';
                                       passwordReg.setAttribute('type', type);
                                       this.querySelector('i').classList.toggle('fa-eye');
                                       this.querySelector('i').classList.toggle('fa-eye-slash');
                                   });

                                   // Hiển thị/ẩn mật khẩu cho xác nhận mật khẩu
                                   const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
                                   const confirmPassword = document.querySelector('#inputConfirmPass');
                                   toggleConfirmPassword.addEventListener('click', function (e) {
                                       const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
                                       confirmPassword.setAttribute('type', type);
                                       this.querySelector('i').classList.toggle('fa-eye');
                                       this.querySelector('i').classList.toggle('fa-eye-slash');
                                   });
        </script>        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                   // Lấy các phần tử input và message
                                   const inputFullName = document.getElementById('inputFullName');
                                   const fullNameMessage = document.getElementById('fullNameMessage');

                                   // Hiển thị thông báo khi ô nhập liệu được focus
                                   inputFullName.addEventListener('focus', () => {
                                       fullNameMessage.style.display = 'block';
                                   });

                                   // Ẩn thông báo khi ô nhập liệu mất focus
                                   inputFullName.addEventListener('blur', () => {
                                       fullNameMessage.style.display = 'none';
                                   });
        </script>
        <script>
            // Lấy phần tử input và message cho "Tên đăng nhập"
            const inputUserReg = document.getElementById('inputUserReg');
            const userRegMessage = document.getElementById('userRegMessage');

            // Hiển thị thông báo khi ô nhập liệu được focus
            inputUserReg.addEventListener('focus', () => {
                userRegMessage.style.display = 'block';
            });

            // Ẩn thông báo khi ô nhập liệu mất focus
            inputUserReg.addEventListener('blur', () => {
                userRegMessage.style.display = 'none';
            });
        </script>
        <script>
            // Lấy phần tử input và message cho "Số điện thoại"
            const inputSdt = document.getElementById('inputSdt');
            const sdtMessage = document.getElementById('sdtMessage');

            // Hiển thị thông báo khi ô nhập liệu được focus
            inputSdt.addEventListener('focus', () => {
                sdtMessage.style.display = 'block';
            });

            // Ẩn thông báo khi ô nhập liệu mất focus
            inputSdt.addEventListener('blur', () => {
                sdtMessage.style.display = 'none';
            });
        </script>
        
        <script>
            //Check 2 pass và confirPass khác thì không cho vô
            document.addEventListener("DOMContentLoaded", function () {
                const passwordInput = document.getElementById("inputPassReg");
                const confirmPasswordInput = document.getElementById("inputConfirmPass");
                const registerButton = document.querySelector("button[type='submit']");
                registerButton.addEventListener("click", function (event) {
                    if (passwordInput.value !== confirmPasswordInput.value) {
                        event.preventDefault();
                        alert("Mật khẩu và xác nhận mật khẩu không khớp!");
                        confirmPasswordInput.focus();
                    }
                });
            });
        </script>
    </body>
</html>
