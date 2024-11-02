<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý tin đăng</title>
        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="post/style.jsp" />
    </head>
    <body>
        <jsp:include page="post/headerPost.jsp" />
        <div class="container-fluid ">
        <div class="row" >
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">

                <div class="p-3">
                    <h4>${sessionScope.user.userName}</h4>
                    <p>Mã thành viên: ${sessionScope.user.userId}</p>
                    <p>Số dư tài khoản: ${sessionScope.newAccountBalance}</p>
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
                <!-- Main Content -->
                <div class="content col-md-9 main-content" style="margin-top: 3px">
                    <div class="pt-3 pb-2 mb-3 border-bottom">
                        <h2>Quản lý tin đăng</h2>
                    </div>
                    
                    <div>
                    <!-- Table for listing posts -->
                    <c:if test="${empty listPost}">
                        <h3>Không có tin đăng nào.</h3>
                    </c:if>
                    <c:if test="${not empty listPost}">
                    <table class="table table-bordered mt-3 ">
                        <thead class="text-center">
                            <tr>
                                <th>Mã tin</th>
                                <th>Tiêu đề</th>                              
                                <th>Ngày đăng</th>
                                <th>Ngày hết hạn</th>
                                <th>Thời hạn bài đăng</th>
                                <th>Cấp độ</th>
                                <th>Tiền trả</th>
                                <th>Cập nhật</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="p" items="${listPost}">
                            <tr>
                                <td>${p.postId}</td>
                                <td>${p.title}</td>
                                <td>${p.postDate}</td>
                                <td>${p.getExpiryDate()}</td>
                                <td>${p.timeLimit} Ngày</td>
                                <td>${p.rank}</td>
                                <td>${p.amount}</td>
                                <td>
                                    <a href="PostServlet?command=delete&userId=${sessionScope.user.userId}&roomId=${p.roomId}&postId=${p.postId}" class="btn btn-danger">Xóa</a>
                                    <a href="PostServlet?command=update&roomId=${p.roomId}&postId=${p.postId}" class="btn btn-warning">Chỉnh sửa</a>
                                    <a href="extendPost.jsp?command=extend&userId=${sessionScope.user.userId}&postId=${p.postId}&rank=${p.rank}&timeLimit=${p.timeLimit}&expiryDate=${p.getExpiryDate()}&amount=${p.amount}" class="btn btn-primary">Gia hạn</a>
                                </td>
                                
                            </tr>
                              </c:forEach>
                        </tbody>
                    </table>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>