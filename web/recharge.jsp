<%-- 
    Document   : recharge
    Created on : Oct 31, 2024, 5:24:33 PM
    Author     : PC
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
<html lang="en">
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
                <div class="col-md-9 main-content">
                    <a class="d-flex justify-content-between align-items-center mb-4">
                        <h3>Nạp tiền vào tài khoản</h3>
                    </a>
                    
                    <h5>Mời bạn chọn phương thức nạp tiền</h5>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <div class="card" style="width: 300px; height: 200px; border: 2px solid #83C0DF" id="bankTransferCard">
                                <div class="card-body">
                                    <img class="card-img img-fluid"  src="https://www.pngitem.com/pimgs/m/333-3330392_bank-transfer-logo-png-transparent-png.png" alt="Bank Transfer" style="width: 300px; height: 150px">
                                    <h5 class="card-title text-center">Chuyển khoản</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <div class="card" style="width: 300px; height: 200px; border: 2px solid #83C0DF" id="creditCard">
                                <div class="card-body">
                                    <img class="card-img img-fluid" src="https://cdn.thuvienphapluat.vn/uploads/tintuc/2023/11/27/du-no-the-tin-dung.jpg" alt="Visa" style="width: 300px; height: 150px">
                                    
                                    <h5 class="card-title text-center">Thẻ tín dụng</h5>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="modal fade" id="bankTransferModal" tabindex="-1" aria-labelledby="bankTransferModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="bankTransferModalLabel">Chuyển khoản</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="RechargeServlet" method="POST">
                                         <input type="hidden" name="userID" value="${sessionScope.user.userId}">
                                         <input type="hidden" name="paymentMethod" value="Chuyển khoản">
                                        <div>
                                            <img src="img/qr_code.jpg" class="img-fluid" alt="QR Code">
                                        </div>
                                        <div>
                                            <label for="amount" class="form-label">Số tiền</label>
                                            <input type="number" class="form-control" id="amount" name="amountRecharge" placeholder="Nhập số tiền" required>
                                        </div>
                                        <br>
                                        <button type="submit" class="btn btn-primary">Chuyển khoản</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="creditCardModal" tabindex="-1" aria-labelledby="creditCardModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="creditCardModalLabel">Thẻ tín dụng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="RechargeServlet" method="POST">
                                         <input type="hidden" name="paymentMethod" value="Thẻ tín dụng">
                                         <input type="hidden" name="userID" value="${sessionScope.user.userId}">
                                        <div class="mb-3">
                                            <label for="creditCardNumber" class="form-label">Số thẻ</label>
                                            <input type="text" class="form-control" id="creditCardNumber" placeholder="Số thẻ tín dụng" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cardHolderName" class="form-label">Tên chủ thẻ</label>
                                            <input type="text" class="form-control" id="cardHolderName" placeholder="Tên chủ thẻ" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="expiryDate" class="form-label">Ngày hết hạn</label>
                                            <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" placeholder="Mã CVV" required>
                                        </div>
                                        <div>
                                            <label for="amount" class="form-label">Số tiền</label>
                                            <input type="number" class="form-control" id="amount" name="amountRecharge"  placeholder="Nhập số tiền" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Thanh toán</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>  
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Thêm sự kiện click cho các card để hiển thị modal tương ứng
            document.getElementById("bankTransferCard").addEventListener("click", function () {
                var bankTransferModal = new bootstrap.Modal(document.getElementById("bankTransferModal"));
                bankTransferModal.show();
            });

            document.getElementById("creditCard").addEventListener("click", function () {
                var creditCardModal = new bootstrap.Modal(document.getElementById("creditCardModal"));
                creditCardModal.show();
            });
        </script>

    </body>
</html>