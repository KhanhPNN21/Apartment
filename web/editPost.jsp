<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post a Property</title>
        <!-- Bootstrap 5.3.3 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #1874CD;">
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
        <div class="container-fluid ">
            <div class="row" >
                <!-- Sidebar -->
                <div class="col-md-3" style="background-color: #D0D0D0;">

                    <div class="p-3" style="background-color: #D0D0D0;">
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
                    <div class="card">
                        <div class="card-body">
                            <h4>Chỉnh sửa bài đăng-Mã tin:${postId} </h4>
                            <div class="alert alert-danger">
                                Nếu bạn đã từng đăng tin trên ApartmentProVjp.com, hãy sử dụng chức năng GIA HẠN / NÂNG CẤP để làm mới.
                            </div>
                            <form action="PostServlet"  method="GET" >
                                   <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                   <input type="hidden" name="postId" value="${postId}">
                                <div class="row mb-3">
                                    <div class="col-md-3">
                                        <label for="district" class="form-label">Quận/Huyện</label>
                                        <select id="district" class="form-select" name="district"  >
                                            <option value="${detail.district}" >${detail.district}</option>
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

                                    <div class="col-md-3">
                                        <label for="ward" class="form-label">Phường/Xã</label>
                                        <select id="ward" class="form-select" name="ward">
                                            <option value="${detail.ward}">${detail.ward}</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- House Information -->
                                <div class="mb-3">
                                    <label for="houseNumber" class="form-label">Số nhà</label>
                                    <input type="text" class="form-control" required="" value="${detail.street}" id="houseNumber" name="houseNumber">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="apartmentName" class="form-label">Tên chung cư/căn hộ</label>
                                    <input type="text" class="form-control" required="" value="${detail.apartmentName}" id="apartmentName" name="apartmentName">
                                </div>    

                                <!-- Description Section -->
                                <br><div class="mb-3">
                                    <h4>Thông tin mô tả</h4>

                                </div>

                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input type="text" class="form-control" value="${detail.title}" id="title" name="title" required="">
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Mô tả</label>
                                    <input type="text" class="form-control" value="${detail.description}" id="description" name="description">
                                </div>    

                                <div class="mb-3">
                                    <label for="ownerName" class="form-label">Tên người cho thuê</label>
                                    <input type="text" class="form-control" id="ownerName" value="${detail.fullName}"
                                           name="ownerName"  readonly>
                                </div>
                                <div class="mb-3 row">   
                                    <div class="col-md-4">
                                        <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                        <input type="tel" class="form-control" id="phoneNumber"  
                                               name="phoneNumber"  value="${detail.phone}" readonly>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4">
                                        <label for="rentPrice" class="form-label">Giá cho thuê triệu/tháng (VND)</label>
                                        <input type="number" class="form-control" id="rentPrice" name="rentPrice" required=""
                                                      value="${detail.price}">
                                    </div>
                                </div>        
                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        <label for="area" class="form-label">Diện tích (m²)</label>
                                        <input type="number" class="form-control" id="area" name="area" required=""
                                               oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.area}">
                                    </div>
                                                                       
                                    <div class="col-md-4">
                                        <label for="roomNumber" class="form-label">Số phòng</label>
                                        <input type="number" required="" class="form-control" id="roomNumber" name="roomNumber" value="${detail.roomNumber}">
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <label for="roomAvailable" class="form-label">Số lượng phòng</label>
                                        <input type="number" required="" class="form-control" id="roomAvailable" name="roomAvailable" placeholder="Nhập số lượng phòng còn trống">
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="images" class="form-label">Hình ảnh</label>
                                    <input type="file" class="form-control" id="images" name="images[]" multiple accept=".jpg, .jpeg, .png, .img">
                                    <small class="form-text text-muted">Chọn nhiều hình ảnh (JPG, PNG, IMG).</small>
                                </div>
                                <br>
                                <button type="submit" id="submitBtn" name="command" value="updatePost" class="btn btn-primary">Chỉnh sửa</button>
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

                wardSelect.innerHTML = ' <option value="${detail.ward}">${detail.ward}</option>';

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
            document.getElementById('submitBtn').addEventListener('click', function(event) {
                const districtSelect = document.getElementById('district');
                if (districtSelect.value === "") {
                    event.preventDefault();
                    alert("Vui lòng chọn quận/huyện trước khi đăng tin!"); 
                }
            });
        </script>
        
    </body>
</html>
