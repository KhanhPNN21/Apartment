<%-- 
    Document   : recharge
    Created on : Oct 31, 2024, 5:24:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recharge Account</title>
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
                        <li class="nav-item"><a class="nav-link text-white" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Rooms</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Houses</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar with full viewport height -->
                <div class="col-md-3 min-vh-100" style="background-color: #D0D0D0;">
                    <div class="p-3">
                        <h4>Trung Trịnh</h4>
                        <p>Mã thành viên: 145976</p>
                        <p>TK Chính: 0</p>
                        <div class="row mb-3">
                            <a href="recharge.jsp" class="btn btn-warning btn-sm mb-2">Nạp tiền</a>
                            <a href="post.jsp" class="btn btn-danger btn-sm mb-3">Đăng tin</a>
                        </div> 
                        <hr>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="post_history.jsp" class="nav-link">Quản lý tin đăng</a>
                            </li>
                            <li class="nav-item">
                                <a href="editUserInfor.jsp" class="nav-link">Sửa thông tin cá nhân</a>
                            </li>
                            <li class="nav-item">
                                <a href="recharge.jsp" class="nav-link">Nạp tiền vào tài khoản</a>
                            </li>
                            <li class="nav-item">
                                <a href="recharge_history.jsp" class="nav-link">Lịch sử nạp tiền</a>
                            </li>
                            <li class="nav-item">
                                <a href="payment_history.jsp" class="nav-link">Lịch sử thanh toán</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">Bảng giá dịch vụ</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">Liên hệ</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link text-danger">Thoát</a>
                            </li>
                        </ul>  
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3>Nạp tiền vào tài khoản</h3>
                        <div class="bg-light p-2 rounded text-end">
                            <p class="mb-0">Số dư tài khoản</p>
                            <h4 class="text-success">0đ</h4>
                        </div>
                    </div>
                    
                    <h5>Mời bạn chọn phương thức nạp tiền</h5>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <div class="card" style="width: 300px; height: 200px" id="bankTransferCard">
                                <div class="card-body">
                                    <img class="card-img img-fluid"  src="https://www.pngitem.com/pimgs/m/333-3330392_bank-transfer-logo-png-transparent-png.png" alt="Bank Transfer" style="width: 300px; height: 150px">
                                    <h5 class="card-title text-center">Chuyển khoản</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <div class="card" style="width: 300px; height: 200px" id="creditCard">
                                <div class="card-body">
                                    <img class="card-img img-fluid"  src="https://cdn.thuvienphapluat.vn/uploads/tintuc/2023/11/27/du-no-the-tin-dung.jpg" alt="Visa" style="width: 300px; height: 150px">
                                    <h5 class="card-title text-center">Thẻ tín dụng</h5>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="modal fade" id="bankTransferModal" tabindex="-1" aria-labelledby="bankTransferModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="bankTransferModalLabel">Form Chuyển khoản</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div>
                                            <img src="img/qr_code.jpg" class="img-fluid" alt="QR Code">
                                        </div>
                                        <div>
                                            <label for="amount" class="form-label">Số tiền</label>
                                            <input type="number" class="form-control" id="amount" name="amountRecharge" placeholder="Nhập số tiền">
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
                                    <h5 class="modal-title" id="creditCardModalLabel">Form Thẻ tín dụng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="mb-3">
                                            <label for="creditCardNumber" class="form-label">Số thẻ</label>
                                            <input type="text" class="form-control" id="creditCardNumber" placeholder="Số thẻ tín dụng">
                                        </div>
                                        <div class="mb-3">
                                            <label for="cardHolderName" class="form-label">Tên chủ thẻ</label>
                                            <input type="text" class="form-control" id="cardHolderName" placeholder="Tên chủ thẻ">
                                        </div>
                                        <div class="mb-3">
                                            <label for="expiryDate" class="form-label">Ngày hết hạn</label>
                                            <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY">
                                        </div>
                                        <div class="mb-3">
                                            <label for="cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" placeholder="Mã CVV">
                                        </div>
                                        <div>
                                            <label for="amount" class="form-label">Số tiền</label>
                                            <input type="number" class="form-control" id="amount" name="amountRecharge"  placeholder="Nhập số tiền">
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