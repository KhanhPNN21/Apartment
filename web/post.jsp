<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post a Property</title>
        <!-- Bootstrap 5.3.3 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f4f4f4;
            }
            .sidebar {
                background-color: #2c3e50; /* Màu nền của sidebar */
                color: #ecf0f1; /* Màu chữ */
                padding: 20px; /* Padding cho nội dung bên trong */
                border-radius: 8px; /* Bo góc */
                height: auto; /* Cho phép chiều cao tự động mở rộng */
                min-height: 100vh; /* Đảm bảo sidebar chiếm ít nhất chiều cao của viewport */
            }

            .nav-link {
                color: #ecf0f1 !important;
            }
            .nav-link:hover {
                color: #3498db !important;
            }
            .card {
                background-color: #f8f9fa; /* Màu nền trắng */
                border: 1px solid #007bff; /* Viền mỏng */
                border-radius: 8px; /* Bo góc cho card */
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
            }
            .form-label {
                font-weight: 600;
            }
            .btn-primary {
                background: linear-gradient(90deg, #3498db, #8e44ad);
                border: none;
            }
            .btn-primary:hover {
                background: linear-gradient(90deg, #2980b9, #732d91);
            }
            input, select, textarea {
                border-radius: 8px;
                border: 1px solid #bdc3c7;
                transition: all 0.3s;
            }
            input:focus, select:focus, textarea:focus {
                border-color: #3498db;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
                outline: none;
            }
            .alert {
                background-color: #e74c3c;
                color: white;
            }
            .text-danger {
                color: red !important;
            }

        </style>

    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #28a745;">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="#"style="margin-right: 40px;">ApartmentProVjp.com</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0 justify-content-evenly" style="width: 100%;">
                        <li class="nav-item"> <!-- Không thêm mx ở đây -->
                            <a class="nav-link text-white" href="#">Trang chủ</a>
                        </li>
                        <li class="nav-item"> <!-- Không thêm mx ở đây -->
                            <a class="nav-link text-white" href="#">Bảng giá dịch vụ</a>
                        </li>
                        <li class="nav-item"> <!-- Không thêm mx ở đây -->
                            <a class="nav-link text-white" href="#">Hỗ trợ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <div class="container-fluid ">
            <div class="row" >
                <!-- Sidebar -->
                <div class="col-md-3 sidebar">

                    <div class="p-3">
                        <h4>${sessionScope.user.userName}</h4>
                        <p>Mã thành viên: ${sessionScope.user.userId}</p>
                        <p>TK Chính: ${sessionScope.user.accountBalance}</p>
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
                    <div class="card my-3">
                        <div class="card-body">
                            <h4>Đăng tin mới</h4>
                            <div class="alert alert-danger" style="background-color: #FFCC99; color: black ">
                                Nếu bạn đã từng đăng tin trên ApartmentProVjp.com, hãy sử dụng chức năng GIA HẠN / NÂNG CẤP để làm mới.
                            </div>
                            <form action="PostServlet?userId=${param.userId}" method="POST" >
                                <!-- Location Section -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="district" class="form-label">Quận/Huyện</label>
                                        <select id="district" class="form-select" name="district" >
                                            <option value="">Chọn quận huyện</option>
                                            <option value="lien_chieu">Quận Liên Chiểu</option>
                                            <option value="hai_chau">Quận Hải Châu</option>
                                            <option value="ngu_hanh_son">Quận Ngũ Hành Sơn</option>
                                            <option value="son_tra">Quận Sơn Trà</option>
                                            <option value="cam_le">Quận Cẩm Lệ</option>
                                            <option value="thanh_khe">Quận Thanh Khê</option>
                                            <option value="hoa_vang">Huyện Hòa Vang</option>
                                            <option value="hoang_sa">Huyện Hoàng Sa</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="ward" class="form-label">Phường/Xã</label>
                                        <select id="ward" class="form-select" name="ward">
                                            <option value="">Chọn phường xã</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- House Information -->
                                <div class="mb-3">
                                    <label for="houseNumber" class="form-label">Số nhà</label>
                                    <input type="text" class="form-control" required="" placeholder="Nhập số nhà và đường" id="houseNumber" name="houseNumber">
                                </div>

                                <div class="mb-3">
                                    <label for="apartmentName" class="form-label">Tên chung cư/căn hộ</label>
                                    <input type="text" class="form-control" required="" placeholder="Nhập tên chung cư/căn hộ" id="apartmentName" name="apartmentName">
                                </div>    

                                <!-- Description Section -->
                                <br><div class="mb-3">
                                    <h4>Thông tin mô tả</h4>
                                </div>

                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input type="text" class="form-control" placeholder="Nhập tiêu đề bài đăng" id="title" name="title" required>
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Mô tả</label>
                                    <textarea type="text" class="form-control" placeholder="Nhập mô tả" id="description" name="description"></textarea>
                                </div>    

                                <div class="mb-3">
                                    <label for="ownerName" class="form-label">Tên người cho thuê</label>
                                    <input type="text" class="form-control" id="ownerName" value="${sessionScope.user.fullName}"
                                           name="ownerName"  readonly>
                                </div>
                                <div class="mb-3 row">   
                                    <div class="col-md-6">
                                        <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                        <input type="tel" class="form-control" id="phoneNumber"  
                                               name="phoneNumber"  value="${sessionScope.user.phone}" readonly>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <label for="rentPrice" class="form-label">Giá cho thuê triệu/tháng (VND)</label>
                                        <input type="number" class="form-control" id="rentPrice" name="rentPrice" required
                                               placeholder="Nhập giá cho thuê">
                                    </div>
                                </div>       
                                    
                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        <label for="area" class="form-label">Diện tích (m²)</label>
                                        <input type="number" class="form-control" id="area" name="area" required
                                               oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Nhập diện tích">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="roomNumber" class="form-label">Số phòng</label>
                                        <input type="number" required class="form-control" id="roomNumber" name="roomNumber" placeholder="Nhập số phòng">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="roomAvailable" class="form-label">Số lượng phòng</label>
                                        <input type="number" required class="form-control" id="roomAvailable" name="roomAvailable" placeholder="Nhập số lượng phòng còn trống">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="images" class="form-label">Hình ảnh</label>
                                    <input type="file" class="form-control" id="images" name="images[]" multiple accept=".jpg, .jpeg, .png, .img">
                                    <small class="form-text text-muted">Chọn nhiều hình ảnh (JPG, PNG, IMG).</small>
                                </div>

                                <br><div class="mb-3">
                                    <h4>Tiền đăng</h4>
                                </div>

                                <div class="mb-3">
                                    <label for="level" class="form-label">Cấp độ bài đăng</label>
                                    <select id="level" class="form-select" name="level" onchange="updatePrice()">
                                        <option value="">Chọn cấp độ</option>
                                        <option value="1">Cấp độ 1</option>
                                        <option value="2">Cấp độ 2</option>
                                        <option value="3">Cấp độ 3</option>
                                        <option value="4">Cấp độ 4</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="duration" class="form-label">Số ngày tồn tại bài đăng</label>
                                    <select id="duration" class="form-select" name="duration" onchange="updatePrice()">
                                        <option value="">Chọn số ngày</option>
                                        <option value="3">3 ngày</option>
                                        <option value="7">7 ngày</option>
                                        <option value="30">30 ngày</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="price" class="form-label">Giá bài đăng (VNĐ)</label>
                                    <input type="text" class="form-control" id="price" placeholder="Số tiền" name="price" readonly>
                                </div>

                                <button type="submit" id="submitBtn" class="btn btn-primary">Đăng tin</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and Popper.js -->
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

        <script>
            document.getElementById('submitBtn').addEventListener('click', function (event) {
                const districtSelect = document.getElementById('district');
                if (districtSelect.value === "") {
                    event.preventDefault();
                    alert("Vui lòng chọn quận/huyện trước khi đăng tin!");
                }
            });
        </script>

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

        <script>
            document.getElementById('submitBtn').addEventListener('click', function (event) {
                const levelSelect = document.getElementById('level');
                if (rentalFormSelect.value === "") {
                    event.preventDefault();
                    alert("Vui lòng chọn cấp độ bài đăng trước khi đăng tin!");
                }
            });
        </script>

        <script>
            document.getElementById('submitBtn').addEventListener('click', function (event) {
                const durationSelect = document.getElementById('duration');
                if (rentalFormSelect.value === "") {
                    event.preventDefault();
                    alert("Vui lòng chọn chọn số ngày tồn tại bài đăng trước khi đăng tin!");
                }
            });
        </script>
    </body>
</html>
