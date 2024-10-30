<%-- 
    Document   : search
    Created on : Oct 26, 2024, 12:09:11 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tìm kiếm phòng trọ</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            .nav-bar {
                background-color: #1874CD;
                color: white;
            }
            .search-bar {
                background-color: #f8f9fa;
                padding: 20px;
            }
            .popular-areas img {
                width: 100%;
                height: auto;
            }
            .result-card img {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>

        <nav class="navbar nav-bar py-3">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="#">ApartmentProVip.com</a>
                <div class="d-flex">
                    <span class="me-3 text-white">Xin chào, <strong>Trung Trinh</strong></span>
                    <a href="#" class="btn btn-outline-light btn-sm me-2">Quản lý tài khoản</a>
                    <a href="#" class="btn btn-danger btn-sm">Đăng tin miễn phí</a>
                </div>
            </div>
        </nav>

        <!-- Search Section -->
        <div class="search-bar">
            <div class="container">
                <h2 class="text-center mb-4">Tìm kiếm chỗ thuê ưng ý</h2>
                <form id="search-form" action="SearchServlet" method="GET" class="search-bar row g-3 align-items-end">
                    <div class="col-md-2">
                        <label for="district" class="form-label"></label>
                        <select id="district" class="form-select" name="district" onchange="this.form.submit()">
                            <option value="">Chọn quận huyện</option>
                            <option value="lien_chieu" ${district == 'lien_chieu' ? 'selected' : ''}>Quận Liên Chiểu</option>
                            <option value="hai_chau" ${district == 'hai_chau' ? 'selected' : ''}>Quận Hải Châu</option>
                            <option value="ngu_hanh_son" ${district == 'ngu_hanh_son' ? 'selected' : ''}>Quận Ngũ Hành Sơn</option>
                            <option value="son_tra" ${district == 'son_tra' ? 'selected' : ''}>Quận Sơn Trà</option>
                            <option value="cam_le" ${district == 'cam_le' ? 'selected' : ''}>Quận Cẩm Lệ</option>
                            <option value="thanh_khe" ${district == 'thanh_khe' ? 'selected' : ''}>Quận Thanh Khê</option>
                            <option value="hoa_vang" ${district == 'hoa_vang' ? 'selected' : ''}>Huyện Hòa Vang</option>
                            <option value="hoang_sa" ${district == 'hoang_sa' ? 'selected' : ''}>Huyện Hoàng Sa</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="ward" class="form-label"></label>
                        <select id="ward" class="form-select" name="ward" onchange="this.form.submit()">
                            <option value="">Chọn phường xã</option>
                            
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="price" class="form-label"></label>
                        <select id="price" class="form-select" name="price" onchange="this.form.submit()">
                            <option value="">Chọn mức giá</option>
                            <option value="under1m" ${price == 'under1m' ? 'selected' : ''}>Dưới 1 triệu</option>
                            <option value="between1mand2m" ${price == 'between1mand2m' ? 'selected' : ''}>1 - 2 triệu</option>
                            <option value="between2mand5m" ${price == 'between2mand5m' ? 'selected' : ''}>2 - 5 triệu</option>
                            <option value="upper5m" ${price == 'upper5m' ? 'selected' : ''}>Trên 5 triệu</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="area" class="form-label"></label>
                        <select id="area" class="form-select" name="area" onchange="this.form.submit()">
                            <option value="">Chọn diện tích</option>
                            <option value="under20" ${area == 'under20' ? 'selected' : ''}>Dưới 20 m²</option>
                            <option value="between20and30" ${area == 'between20and30' ? 'selected' : ''}>20 - 30 m²</option>
                            <option value="between30and50" ${area == 'between30and50' ? 'selected' : ''}>30 - 50 m²</option>
                            <option value="upper50" ${area == 'upper50' ? 'selected' : ''}>Trên 50 m²</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary w-100">Tìm kiếm</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="container mt-5">
            <h4 class="mb-4">Tổng "Số lượng tìm thấy" kết quả (cái này ko thích hoặc thấy đếm khó quá thì vứt cũng được)</h4>
            <div class="row">
                <div class="col-md-9">
                    <!-- Result Item -->
                    <c:choose>
                        <c:when test="${not empty rooms}">
                            <c:forEach var="room" items="${rooms}">
                                    <!-- Phần tử liệt kê phòng trọ -->
                                    <div class="listing-item mb-4 p-3 border rounded featured-item">
                                        <div class="row">
                                            <!-- Cột hiển thị hình ảnh -->
                                            <div class="col-md-4">
                                                <img src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2021/03/10/z2372642429419-09c9c7a541863ae55ad41b3e267136f4_1615391265.jpg" 
                                                     alt="Image" class="img-fluid rounded">
                                            </div>

                                            <!-- Cột hiển thị thông tin chi tiết -->
                                            <div class="col-md-8">
                                                <c:choose>
                                                    <c:when test="${room.rank == 4}">
                                                        <strong><h5 class="mb-2 title-4"> <div style="color:orange" class="stars">★★★★★</div>${room.title}</h5></strong> 
                                                    </c:when>
                                                    <c:when test="${room.rank == 3}">
                                                        <strong><h5 class="mb-2 title-3"> <div style="color: orange" class="stars">★★★★</div>${room.title}</h5></strong> 
                                                    </c:when>
                                                    <c:when test="${room.rank == 2}">
                                                        <strong><h5 class="mb-2 title-2"> <div style="color: orange" class="stars">★★★</div>${room.title}</h5></strong> 
                                                    </c:when>
                                                    <c:when test="${room.rank == 1}">
                                                        <strong><h5 class="mb-2 title-1"> <div style="color: orange" class="stars">★★</div>${room.title}</h5></strong> 
                                                    </c:when>
                                                </c:choose>
                                                <ul class="list-unstyled">
                                                    <li><strong>Giá:</strong> ${room.price} VND</li>
                                                    <li><strong>Diện Tích:</strong> ${room.area} m²</li>
                                                    <li><strong>Địa Chỉ:</strong> ${room.ward}</li>
                                                    <li><strong>Số Phòng:</strong> ${room.roomNumber}</li>
                                                    <li><strong>Ngày Đăng:</strong> ${room.postdate}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p>Không có phòng nào.</p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Filter Sidebar -->
                <div class="col-md-3">
                    <h5>Xem theo giá</h5>
                    <ul class="list-group mb-4">
                        <li class="list-group-item" onclick="setPriceFilter('under1m', this)">Dưới 1 triệu</li>
                        <li class="list-group-item" onclick="setPriceFilter('between1mand2m', this)">Từ 1 - 2 triệu</li>
                        <li class="list-group-item" onclick="setPriceFilter('between2mand3m', this)">Từ 2 - 3 triệu</li>
                    </ul>

                    <h5>Xem theo diện tích</h5>
                    <ul class="list-group">
                        <li class="list-group-item" onclick="setAreaFilter('under20m2', this)">Dưới 20 m²</li>
                        <li class="list-group-item" onclick="setAreaFilter('between20and30', this)">Từ 20 - 30 m²</li>
                        <li class="list-group-item" onclick="setAreaFilter('between30and50', this)">Từ 30 - 50 m²</li>
                    </ul>
                </div>
                <style>
                    .filter-item.selected {
                        background-color: #007bff;
                        color: white;
                        font-weight: bold;
                    }
                </style>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const selectedDistrict = "${district}";
                                const selectedWard = "${ward}";

                                // Xóa các option cũ của ward và thêm lại các option mới theo district
                                const wardSelect = document.getElementById('ward');
                                const wardsByDistrict = {
                                    "lien_chieu": ["Phường Hòa Hiệp Bắc", "Phường Hòa Hiệp Nam", "Phường Hòa Khánh Bắc", "Phường Hòa Khánh Nam", "Phường Hòa Minh"],
                                    "hai_chau": ["Phường Bình Hiên", "Phường Bình Thuận", "Phường Hải Châu 1", "Phường Hải Châu 2", "Phường Hòa Cường Bắc", "Phường Hòa Cường Nam", "Phường Hòa Thuận Đông", "Phường Hòa Thuận Tây", "Phường Nam Dương", "Phường Phước Ninh", "Thạch Thang", "Thanh Bình", "Thuận Phước"],
                                    "ngu_hanh_son": ["Phường Hòa Quý", "Phường Khuê Mỹ", "Phường Mỹ An", "Phường Hòa Hải"],
                                    "son_tra": ["Phường An Hải Bắc", "Phường An Hải Đông", "Phường An Hải Tây", "Phường Mân Thái", "Phường Nại Hiên Đông", "Phường Phước Mỹ", "Phường Thọ Quang"],
                                    "cam_le": ["Phường Hòa An", "Phường Hòa Phát", "Phường Hòa Thọ Đông", "Phường Hòa Thọ Tây", "Phường Khuê Trung", "Phường Hòa Xuân"],
                                    "thanh_khe": ["Phường An Khê", "Phường Chính Gián", "Phường Hòa Khê", "Phường Tam Thuận", "Phường Tân Chính", "Phường Thạc Gián", "Phường Thanh Khê Đông", "Phường Thanh Khê Tây", "Phường Vĩnh Trung", "Phường Xuân Hà"],
                                    "hoa_vang": ["Xã Hòa Bắc", "Xã Hòa Châu", "Xã Hòa Khương", "Xã Hòa Liên", "Xã Hòa Nhơn", "Xã Hòa Ninh", "Xã Hòa Phong", "Xã Hòa Phú", "Xã Hòa Phước", "Xã Hòa Sơn", "Xã Hòa Tiến"],
                                    "hoang_sa": ["Huyện Đảo Hoàng Sa"]
                                };

                                if (selectedDistrict && wardsByDistrict[selectedDistrict]) {
                                    wardsByDistrict[selectedDistrict].forEach(function (ward) {
                                        const option = document.createElement('option');
                                        option.value = ward;
                                        option.textContent = ward;
                                        if (ward === selectedWard) {
                                            option.selected = true;
                                        }
                                        wardSelect.appendChild(option);
                                    });
                                }

                                document.getElementById('district').value = selectedDistrict;
                            });
        </script>

        <script>
            function setPriceFilter(value) {
                document.getElementById('price-select').value = value;
                document.getElementById('search-form').submit();
            }

            function setAreaFilter(value) {
                document.getElementById('area-select').value = value;
                document.getElementById('search-form').submit();
            }
        </script>

    </body>
</html>
