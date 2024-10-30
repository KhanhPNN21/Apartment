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
                        <li class="nav-item"><a class="nav-link text-white" href="#">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Bảng giá dịch vụ</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#">Hỗ trợ</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Sidebar -->
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar with full viewport height -->
                <div class="col-md-3 min-vh-100" style="background-color: #D0D0D0;">

                    <div class="p-3">
                        <h4>${sessionScope.user.userName}</h4>
                        <p>Mã thành viên: ${sessionScope.user.userId}</p>
                        <p>TK Chính: ${sessionScope.user.accountBalance}</p>
                        <div class="row mb-3">
                            <a href="recharge.jsp" class="btn btn-warning btn-sm mb-2">Nạp tiền</a>
                            <a href="post.jsp" class="btn btn-danger btn-sm mb-3">Đăng tin</a>
                        </div>    
                        <hr>

                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="posthistory.jsp" class="nav-link">Quản lý tin đăng</a>
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
                                <td><a href="#" class="btn btn-danger">Xóa bài viết</a>
                                    <a href="#" class="btn btn-warning">Chỉnh sửa bài viết</a></td>
                            </tr>
                              </c:forEach>
                        </tbody>
                    </table>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            //Phường/Xã theo Quận/Huyện
            const wardsByDistrict = {
                "lien_chieu": ["Phường Hòa Hiệp Bắc", "Phường Hòa Hiệp Nam", "Phường Hòa Khánh Bắc", "Phường Hòa Khánh Nam", "Phường Hòa Minh"],

                "hai_chau": ["Phường Bình Hiên", "Phường Bình Thuận", "Phường Hải Châu 1", "Phường Hải Châu 2", "Phường Hòa Cường Bắc", "Phường Hòa Cường Nam", "Phường Hòa Thuận Đông",
                "Phường Hòa Thuận Tây", "Phường Nam Dương", "Phường Phước Ninh", "Thạch Thang", "Thanh Bình", "Thuận Phước"],

                "ngu_hanh_son": ["Phường Hòa Quý", "Phường Khuê Mỹ", "Phường Mỹ An", "Phường Hòa Hải"],

                "son_tra": ["Phường An Hải Bắc", "Phường An Hải Đông", "Phường An Hải Tây", "Phường Mân Thái", "Phường Nại Hiên Đông", "Phường Phước Mỹ", "Phường Thọ Quang"],

                "cam_le": ["Phường Hòa An", "Phường Hòa Phát", "Phường Hòa Thọ Đông", "Phường Hòa Thọ Tây", "Phường Khuê Trung", "Phường Hòa Xuân"],

                "thanh_khe": ["Phường An Khê", "Phường Chính Gián", "Phường Hòa Khê", "Phường Tam Thuận", "Phường Tân Chính", "Phường Thạc Gián", "Phường Thanh Khê Đông", "Phường Thanh Khê Tây", "Phường Vĩnh Trung", "Phường Xuân Hà"],

                "hoa_vang": ["Xã Hòa Bắc", "Xã Hòa Châu", "Xã Hòa Khương", "Xã Hòa Liên", "Xã Hòa Nhơn", "Xã Hòa Ninh", "Xã Hòa Phong", "Xã Hòa Phú", "Xã Hòa Phước", "Xã Hòa Sơn", "Xã Hòa Tiến"],

                "hoang_sa": ["Huyện Đảo Hoàng Sa"]
                };

            document.getElementById('district').addEventListener('change', function () {
                const district = this.value;
                const wardSelect = document.getElementById('ward');

                wardSelect.innerHTML = '<option value="">Chọn phường xã</option>';

                if (district && wardsByDistrict[district]) {
                    wardsByDistrict[district].forEach(function (ward) {
                    const option = document.createElement('option');
                    option.value = ward;
                    option.textContent = ward;
                    wardSelect.appendChild(option);
                    });
                }
            });
        </script>
    </body>
</html>