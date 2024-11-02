<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Post a Property</title>
        <!-- Bootstrap 5.3.3 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="post/style.jsp" />
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="post/headerPost.jsp" />
        <jsp:include page="post/leftPost.jsp" />

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
                                <select id="district" class="form-select" name="district">
                                    <option value="${detail.district}">${detail.district}</option>
                                        <option value="Quận Liên Chiểu">Quận Liên Chiểu</option>
                                        <option value="Quận Hải Châu">Quận Hải Châu</option>
                                        <option value="Quận Ngũ Hành Sơn">Quận Ngũ Hành Sơn</option>
                                        <option value="Quận Sơn Trà">Quận Sơn Trà</option>
                                        <option value="Quận Cẩm Lệ">Quận Cẩm Lệ</option>
                                        <option value="Quận Thanh Khê">Quận Thanh Khê</option>
                                        <option value="Huyện Hòa Vang">Huyện Hòa Vang</option>
                                        <option value="Huyện Hoàng Sa">Huyện Hoàng Sa</option>
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
    // Phường/Xã theo Quận/Huyện
    const wardsByDistrict = {
        "Quận Liên Chiểu": ["Phường Hòa Hiệp Bắc", "Phường Hòa Hiệp Nam", "Phường Hòa Khánh Bắc", "Phường Hòa Khánh Nam", "Phường Hòa Minh"],
        "Quận Hải Châu": ["Phường Bình Hiên", "Phường Bình Thuận", "Phường Hải Châu 1", "Phường Hải Châu 2", "Phường Hòa Cường Bắc", "Phường Hòa Cường Nam", "Phường Hòa Thuận Đông", "Phường Hòa Thuận Tây", "Phường Nam Dương", "Phường Phước Ninh", "Thạch Thang", "Thanh Bình", "Thuận Phước"],
        "Quận Ngũ Hành Sơn": ["Phường Hòa Quý", "Phường Khuê Mỹ", "Phường Mỹ An", "Phường Hòa Hải"],
        "Quận Sơn Trà": ["Phường An Hải Bắc", "Phường An Hải Đông", "Phường An Hải Tây", "Phường Mân Thái", "Phường Nại Hiên Đông", "Phường Phước Mỹ", "Phường Thọ Quang"],
        "Quận Cẩm Lệ": ["Phường Hòa An", "Phường Hòa Phát", "Phường Hòa Thọ Đông", "Phường Hòa Thọ Tây", "Phường Khuê Trung", "Phường Hòa Xuân"],
        "Quận Thanh Khê": ["Phường An Khê", "Phường Chính Gián", "Phường Hòa Khê", "Phường Tam Thuận", "Phường Tân Chính", "Phường Thạc Gián", "Phường Thanh Khê Đông", "Phường Thanh Khê Tây", "Phường Vĩnh Trung", "Phường Xuân Hà"],
        "Huyện Hòa Vang": ["Xã Hòa Bắc", "Xã Hòa Châu", "Xã Hòa Khương", "Xã Hòa Liên", "Xã Hòa Nhơn", "Xã Hòa Ninh", "Xã Hòa Phong", "Xã Hòa Phú", "Xã Hòa Phước", "Xã Hòa Sơn", "Xã Hòa Tiến"],
        "Huyện Hoàng Sa": ["Huyện Đảo Hoàng Sa"]
    };
 
     // Xác định quận hiện tại từ `detail.district` trong JSP
    const currentDistrict = "${detail.district}";
    const currentWard = "${detail.ward}";

    // Hàm cập nhật danh sách phường/xã
    function updateWards(district) {
        const wardSelect = document.getElementById('ward');
        wardSelect.innerHTML = ''; // Xóa các tùy chọn phường hiện có

        // Thêm các phường/xã tương ứng với quận/huyện đã chọn
        if (district && wardsByDistrict[district]) {
            wardsByDistrict[district].forEach(function (ward) {
                const option = document.createElement('option');
                option.value = ward;
                option.textContent = ward;

                // Đặt mặc định cho phường hiện tại nếu khớp
                if (ward === currentWard) {
                    option.selected = true;
                }

                wardSelect.appendChild(option);
            });
        }
    }

    // Gọi updateWards ngay khi trang tải để cập nhật danh sách phường/xã theo district hiện tại
    document.addEventListener("DOMContentLoaded", function () {
        updateWards(currentDistrict);

        // Xóa các tùy chọn quận trùng với `currentDistrict` ở phía dưới
        const districtSelect = document.getElementById('district');
        Array.from(districtSelect.options).forEach((option, index) => {
            if (index > 0 && option.value === currentDistrict) {
                option.remove();
            }
        });
    });

    // Khi chọn quận/huyện mới, cập nhật danh sách phường/xã
    document.getElementById('district').addEventListener('change', function () {
        updateWards(this.value);
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

</body>
</html>
