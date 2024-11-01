<%-- 
    Document   : payment_history
    Created on : Nov 1, 2024, 9:50:00 AM
    Author     : PC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recharge Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="post/style.jsp" />
    </head>
    <body>
        <jsp:include page="post/headerPost.jsp" />
        <jsp:include page="post/leftPost.jsp" />

        <!-- Main Content -->
        <div class="col-md-9">
            <div class="pt-3 pb-2 mb-3 border-bottom">
                <h2>Lịch sử thanh toán tin</h2>
            </div>
            <c:if test="${empty payHis}">
                <h3>Bạn chưa có giao dịch nào.</h3>
            </c:if>
            <c:if test="${not empty payHis}">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Thời gian</th>
                            <th>Mã tin đăng</th>
                            <th>Phí</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${payHis}">
                            <tr>
                                <td>${p.postDate}</td>
                                <td>${p.postId}</td>
                                <td>${p.amount}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
