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
        <jsp:include page="post/leftPost.jsp" />
                <!-- Main Content -->
                <div class="content col-md-9" style="margin-top: 3px">
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