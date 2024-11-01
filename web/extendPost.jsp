<%-- 
    Document   : extendPost
    Created on : Nov 1, 2024, 10:09:37 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gia hạn tin đăng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="post/style.jsp" />
        <script>
            function updatePrice() {
                const level = document.getElementById('level').value;
                const duration = document.getElementById('duration').value;
                let price = 0;

                const prices = {
                    1: {3: 10000, 7: 20000, 30: 90000},
                    2: {3: 20000, 7: 40000, 30: 180000},
                    3: {3: 30000, 7: 60000, 30: 270000},
                    4: {3: 50000, 7: 100000, 30: 450000}
                };

                if (level && duration) {
                    price = prices[level][duration] || 0;
                }

                document.getElementById('price').value = price;
            }
        </script>
    </head>
    <body>
        <jsp:include page="post/headerPost.jsp" />
        <jsp:include page="post/leftPost.jsp" />
        <div class="col-md-9">
            <div class="container">
                <h3 class="mb-4">Gia hạn tin đăng</h3>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Bạn muốn gia hạn thêm bao lâu?</h5>
                        <form action="PostServlet" method="get">
                            <input type="hidden" name="command" value="extend">
                            <input type="hidden" name="userId" value="${param.userId}">
                            <input type="hidden" name="postId" value="${param.postId}">
                            <input type="hidden" name="expiryDate" value="${param.expiryDate}">

                            <!-- Display the rank of the post -->
                            <div class="mb-3">
                                <label for="level" class="form-label">Cấp độ bài đăng</label>
                                <input type="text" id="level" name="level" value="${param.rank}" class="form-control" readonly>
                            </div>

                            <!-- Duration selection -->
                            <div class="mb-3">
                                <label for="duration" class="form-label">Thời gian gia hạn</label>
                                <select id="duration" name="duration" class="form-select" onchange="updatePrice()" required>
                                    <option value="3" ${param.timeLimit == 3 ? 'selected' : ''}>3 ngày</option>
                                    <option value="7" ${param.timeLimit == 7 ? 'selected' : ''}>7 ngày</option>
                                    <option value="30" ${param.timeLimit == 30 ? 'selected' : ''}>30 ngày</option>
                                </select>
                            </div>

                            <!-- Display calculated price -->
                            <div class="mb-3">
                                <label for="price" class="form-label">Giá tiền</label>
                                <input type="text" id="price" name="price" class="form-control" readonly>
                            </div>

                            <button type="submit" class="btn btn-primary">Gia hạn</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
