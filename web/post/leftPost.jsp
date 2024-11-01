<%-- 
    Document   : leftPost
    Created on : Oct 31, 2024, 9:49:54 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container-fluid ">
        <div class="row" >
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">

                <div class="p-3">
                    <h4>${sessionScope.user.userName}</h4>
                    <p>Mã thành viên: ${sessionScope.user.userId}</p>
                    <p>Số dư tài khoản: ${sessionScope.user.accountBalance}</p>
                    <div class="row mb-3">
                        <a href="recharge.jsp?userId=${sessionScope.user.userId}" class="btn btn-warning btn-sm mb-2">Nạp tiền</a>
                        <a href="post.jsp?userId=${sessionScope.user.userId}" class="btn btn-danger btn-sm mb-3">Đăng tin</a>
                    </div>   
                    <hr>

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="PostServlet?command=history&userId=${sessionScope.user.userId}" class="nav-link">Quản lý tin đăng</a>
                        </li>
                        <li class="nav-item">
                            <a href="editUserInfor.jsp" class="nav-link">Cập nhật thông tin cá nhân</a>
                        </li>
                        <li class="nav-item">
                            <a href="RechargeServlet?command=getRecharge&userId=${sessionScope.user.userId}" class="nav-link">Lịch sử nạp tiền</a>
                        </li>
                        <li class="nav-item">
                            <a href="RechargeServlet?command=getPayment&userId=${sessionScope.user.userId}" class="nav-link">Lịch sử thanh toán</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-danger" onclick="document.getElementById('logoutForm').submit()">Đăng xuất</a>
                                <form id="logoutForm" action="LoginServlet" method="post" style="display: none;">
                                    <input type="hidden" name="action" value="logout">
                                </form>
                        </li>
                    </ul> 
                </div>
            </div>
</html>
