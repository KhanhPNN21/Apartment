<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
                    <div class="p-3 " style="color: black; ">
                        <h2>Quản lý tin đăng</h2>
                    </div>
                     
                    
                    <div>
                    <!-- Table for listing posts -->
                    <c:if test="${listPost == null}">
                        <h3>Không có tin đăng nào.</h3>
                    </c:if>
                    <c:if test="${listPost != null}">
                    <table class="table table-bordered mt-3 ">
                        <thead class="text-center">
                            <tr>
                                <th>Mã tin</th>
                                <th>Tiêu đề</th>                              
                                <th>Ngày bắt đầu</th>
                                <th>Ngày hết hạn</th>
                                <th>Thời hạn bài đăng</th>
                                <th>Cấp độ</th>
                                <th>Tiền trả</th>
                                <th>Chỉnh sửa</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="p" items="${listPost}">
                            <tr>
                                <td>${p.postId}</td>
                                <td>${p.title}</td>
                                <td>${p.postDate}</td>
                                <td>${p.getExpiryDate()}</td>
                                <td>${p.timeLimit}-Ngày</td>
                                <td>${p.rank}</td>
                                <td>${p.amount}</td>
                                <td><a href="PostServlet?command=delete&userId=${sessionScope.user.userId}&roomId=${p.roomId}&postId=${p.postId}" class="btn btn-danger">Xóa bài viết</a>
                                    <a href="PostServlet?command=update&roomId=${p.roomId}&postId=${p.postId}" class="btn btn-warning">Chỉnh sửa bài viết</a></td>
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