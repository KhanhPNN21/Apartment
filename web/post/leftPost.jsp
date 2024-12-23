<%-- 
    Document   : leftPost
    Created on : Oct 31, 2024, 9:49:54 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3 sidebar d-flex flex-column ">
                    <div class="p-3">
                        <h4>${sessionScope.user.fullName}</h4>
                        <p>Mã thành viên: ${sessionScope.user.userId}</p>
                        <p>TK Chính: ${sessionScope.user.accountBalance}</p>
                        <div class="row mb-3">
                            <a href="recharge.jsp?userId=${sessionScope.user.userId}" class="btn btn-warning btn-sm mb-2" style="background-color: #BBDEFB">Nạp tiền</a>
                            <a href="post.jsp?userId=${sessionScope.user.userId}" class="btn btn-danger btn-sm mb-3" style="background-color: #BBDEFB">Đăng tin</a>
                        </div>

                        <div class="row">
                            <div class="col-12 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="PostServlet?command=history&userId=${sessionScope.user.userId}" class="nav-link">
                                            <i class="fas fa-tasks"></i> Quản lý tin đăng
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="editUserInfor.jsp" class="nav-link">
                                            <i class="fas fa-user-edit"></i> Sửa thông tin cá nhân
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="RechargeServlet?command=getRecharge&userId=${sessionScope.user.userId}" class="nav-link">
                                            <i class="fas fa-history"></i> Lịch sử nạp tiền
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="RechargeServlet?command=getPayment&userId=${sessionScope.user.userId}" class="nav-link">
                                            <i class="fas fa-file-invoice-dollar"></i> Lịch sử thanh toán
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-2">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="#" onclick="document.getElementById('logoutForm').submit()" class="nav-link text-danger">
                                            <i class="fas fa-sign-out-alt"></i>Đăng xuất
                                             <form id="logoutForm" action="LoginServlet" method="post" style="display: none;">
                                            <input type="hidden" name="action" value="logout">
                                            </form>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
</html>
