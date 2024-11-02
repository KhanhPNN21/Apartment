<%-- 
    Document   : editUserInfo
    Created on : Oct 30, 2024, 10:16:05 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật thông tin cá nhân</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="post/style.jsp" />
    </head>
    <body>
        <jsp:include page="post/headerPost.jsp" />
        <jsp:include page="post/leftPost.jsp" />
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
