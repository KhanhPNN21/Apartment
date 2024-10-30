<%-- 
    Document   : editUserInfo
    Created on : Oct 30, 2024, 10:16:05 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật thông tin cá nhân</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #1874CD;">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="#">ApartmentProVjp.com</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link text-white" href="#">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Bảng giá dịch vụ</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Hỗ trợ</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 min-vh-100" style="background-color: #D0D0D0;">
                    <div class="p-3">
                        <h4>${sessionScope.user.userName}</h4>
                        <p>Mã thành viên: ${sessionScope.user.userId}</p>
                        <p>TK Chính: ${sessionScope.user.accountBalance}</p>
                        <div class="row mb-3">
                            <a href="recharge.jsp" class="btn btn-warning btn-sm mb-2">Nạp tiền</a>
                            <a href="post.jsp" class="btn btn-danger btn-sm mb-3">Đăng tin</a>
                        </div>    
                        <hr>
                        <ul class="nav flex-column">
                            <li class="nav-item"><a href="posthistory.jsp" class="nav-link">Quản lý tin đăng</a></li>
                            <li class="nav-item"><a href="editUserInfor.jsp" class="nav-link">Sửa thông tin cá nhân</a></li>
                            <li class="nav-item"><a href="recharge.jsp" class="nav-link">Nạp tiền vào tài khoản</a></li>
                            <li class="nav-item"><a href="recharge_history.jsp" class="nav-link">Lịch sử nạp tiền</a></li>
                            <li class="nav-item"><a href="payment_history.jsp" class="nav-link">Lịch sử thanh toán</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Bảng giá dịch vụ</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Liên hệ</a></li>
                            <li class="nav-item">
                                <a href="#" class="nav-link text-danger" onclick="document.getElementById('logoutForm').submit()">Đăng xuất</a>
                                <form id="logoutForm" action="LoginServlet" method="post" style="display: none;">
                                    <input type="hidden" name="action" value="logout">
                                </form>
                            </li>
                        </ul>  
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="pt-3 pb-2 mb-3 border-bottom">
                        <h2>Cập nhật thông tin cá nhân</h2>
                    </div>

                    <form>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Mã thành viên</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${sessionScope.user.userId}" readonly>
                            </div>
                        </div>
                            
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Họ và tên</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${sessionScope.user.fullName}">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Tên đăng nhập</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="${sessionScope.user.userName}" readonly>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Mật khẩu</label>
                            <div class="col-sm-10">
                                <a href="#" class="text-decoration-none btn btn-secondary" onclick="togglePasswordForm()">Đổi mật khẩu</a>
                            </div>
                        </div>

                        <div id="passwordForm" class="d-none">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Mật khẩu mới</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="newPassword">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Xác nhận mật khẩu</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="confirmPassword">
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Số điện thoại</label>
                            <div class="col-sm-10">
                                <input id="phoneInput" type="text" class="form-control" value="${sessionScope.user.phone}" readonly onfocus="this.removeAttribute('readonly');" onblur="this.setAttribute('readonly', 'readonly');">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input id="emailInput" type="text" class="form-control" value="${sessionScope.user.email}" readonly onfocus="this.removeAttribute('readonly');" onblur="this.setAttribute('readonly', 'readonly');">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-10 offset-sm-2">
                                <button type="button" class="btn btn-primary" onclick="saveChanges()">Lưu & Cập nhật</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            let initialPhone = document.getElementById("phoneInput").value.trim();
            let initialEmail = document.getElementById("emailInput").value.trim();

            function togglePasswordForm() {
                const passwordForm = document.getElementById("passwordForm");
                passwordForm.classList.toggle("d-none");
            }

            function saveChanges() {
                const phoneInput = document.getElementById("phoneInput");
                const emailInput = document.getElementById("emailInput");

                const phoneValue = phoneInput.value.trim();
                const emailValue = emailInput.value.trim();

                if (phoneValue === "" && emailValue === "") {
                    alert("Cần ít nhất một trong hai trường: số điện thoại hoặc email.");
                    return;
                }

                if (phoneValue !== initialPhone && emailValue !== initialEmail) {
                    alert("Chỉ được thay đổi một trong hai trường hoặc xóa một trong hai.");
                    return;
                }

                const newPassword = document.getElementById("newPassword").value.trim();
                const confirmPassword = document.getElementById("confirmPassword").value.trim();

                if (newPassword || confirmPassword) {
                    if (newPassword !== confirmPassword) {
                        alert("Mật khẩu mới và xác nhận mật khẩu không trùng khớp.");
                        return;
                    }
                }

                phoneInput.readOnly = true;
                emailInput.readOnly = true;

                initialPhone = phoneValue;
                initialEmail = emailValue;

                alert("Đã lưu thay đổi thành công.");
            }
        </script>
    </body>
</html>
