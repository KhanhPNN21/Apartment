<%-- 
    Document   : home
    Created on : Oct 12, 2024, 12:32:19 PM
    Author     : acer
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@page import="Model.Rooms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ApartmentProvje</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css"/>
<!--        <link rel="stylesheet" href="css/user.css"/>-->

    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg ">
            <div class="container d-flex justify-content-between">
                <a class="navbar-brand" href="#">ApartmentProvjp.com</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="d-flex align-items-center mx-auto">
                    <img class="logo mx-3" src="img/logo.jpg" alt="Logo">
                </div>

                <div class="d-flex align-items-center flex-column">
                    <div class="d-flex align-items-center mb-2">
                        <div class="dropdown position-relative me-2">
                            <button class="btn btn-outline-primary featured-item">
                                Quản lý tài khoản
                            </button>

                            <div class="dropdownmenu">
                                <a href="postHistory.jsp">Thông tin cá nhân</a>
                                <a href="#" onclick="document.getElementById('logoutForm').submit()">Đăng xuất</a>
                                <form id="logoutForm" action="LoginServlet" method="post" style="display: none;">
                                    <input type="hidden" name="action" value="logout">
                                </form>
                            </div>

                        </div>
                        <a href="post.jsp?userId=${sessionScope.user.userId}" class="btn btn-danger featured-item">Đăng Tin Miễn Phí </a>
                    </div>
                    <input type="text" class="form-control" style="width: 300px;" placeholder="Tìm phòng trọ..." aria-label="Search">
                </div>


            </div>
        </nav>
        <nav class="navbar navbar-expand-lg sticky-navbar" style="background-color: #B39B86;"> <!-- Màu be -->
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarLinks" aria-controls="navbarLinks" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarLinks">
                    <ul class="navbar-nav mx-auto w-100 justify-content-around">
                        <li class="nav-item active">
                            <a class="nav-link featured-item" href="user.jsp" style="color: #ededed;">Trang Chủ</a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link featured-item" href="Service_price.jsp" style="color: #f5f4f4;">Bảng Giá Dịch Vụ</a> <!-- Màu chữ -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="" style="color: #fefbfb;"><h6 class="featured-item">Trợ Giúp</h6></a> <!-- Màu chữ -->
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="hero-section text-center py-5">
            <div class="container">
                <h2 class="mb-4">Tìm Kiếm Phòng Trọ</h2>
                <div class="search-bar row g-3 align-items-end">
                    <div class="col-md-2">
                        <label for="district" class="form-label"></label>
                        <select id="district" class="form-select" name="district">
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

                    <div class="col-md-2">
                        <label for="ward" class="form-label"></label>
                        <select id="ward" class="form-select" name="ward">
                            <option value="">Chọn phường xã</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="price" class="form-label"></label>
                        <select id="price" class="form-select" name="price">
                            <option value="">Chọn mức giá</option>
                            <option value="under1m">Dưới 1 triệu</option>
                            <option value="between1mand2m">1 - 2 triệu</option>
                            <option value="between2mand5m">2 - 5 triệu</option>
                            <option value="upper5m">Trên 5 triệu</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="area" class="form-label"></label>
                        <select id="area" class="form-select" name="area">
                            <option value="">Chọn diện tích</option>
                            <option value="under20">Dưới 20 m²</option>
                            <option value="between20and30">20 - 30 m²</option>
                            <option value="between30and50">30 - 50 m²</option>
                            <option value="upper50">Trên 50 m²</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <button class="btn btn-primary w-100">Tìm kiếm</button>
                    </div>
                </div>
            </div>
        </section>


    </section>


    <div class=" text-center" style="margin-top: 30px">
        <h1>Tìm kiếm chỗ thuê ưng ý</h1>
        <h6>Kênh thông tin Phòng trọ số 1 Đà Nẵng - Website đăng tin, tìm phòng trọ cùng hiệu quả với 1.000.000+ tin đăng và 2.500.000 lượt xem mỗi tháng.</h6>
    </div> <!-- Featured Areas -->
    <section class="featured-section py-5 text-center">
        <div class="row">
            <div class="col-md-4">
                <img src="img/nguhanhson.jpg" class="img-fluid featured-item" alt="Ngũ Hành Sơn" style="width: 100%; height: 300px; object-fit: cover;">
            </div>

            <div class="col-md-4">
                <img src="img/camle.jpg" class="img-fluid featured-item" alt="Cẩm Lệ" style="width: 100%; height: 300px; object-fit: cover;">
            </div>

            <div class="col-md-4">
                <img src="img/haichau.jpg" class="img-fluid featured-item" alt="Hải Châu" style="width: 100%; height: 300px; object-fit: cover;">
            </div>
        </div>

    </section>

    <!-- Listings Section -->
    <section class="listings-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <c:choose>
                        <c:when test="${not empty roomList}">
                            <c:forEach var="room" items="${roomList}">
                                <!-- Phần tử liệt kê phòng trọ -->
                                <div class="listing-item mb-4 p-3 border rounded featured-item">
                                    <a href="DetailServlet?roomId=${room.roomId}" class="text-decoration-none text-dark">
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
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p>Không có phòng nào.</p>
                        </c:otherwise>
                    </c:choose>

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="HomeServlet?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-1"> </div>
                <div class="col-md-4">
                    <h3>NEWS</h3>
                    <p>Latest updates and news related to real estate</p>
                </div>
            </div>
        </div>
    </section>
    
    <div class="container my-5 p-4 rounded shadow" style="background-color: 	#eedfcc">
        <h2 class="text-center mb-4">Tại sao lại chọn ApartmentProVjp.com?</h2>
        <p class="text-center">
            Chúng tôi biết bạn có rất nhiều lựa chọn, nhưng ApartmentProVjp.com tự hào là trang web đứng top google về các từ khóa: 
            <span class="highlight">cho thuê phòng trọ, nhà trọ, thuê nhà nguyên căn, cho thuê căn hộ, tìm người ở ghép, cho thuê mặt bằng...</span> 
            Vì vậy tin của bạn đăng trên website sẽ tiếp cận được với nhiều khách hàng hơn, do đó giao dịch nhanh hơn, tiết kiệm chi phí hơn
        </p>
        <div class="row text-center my-4">
            <div class="col-md-4">
                <strong class="highlight">116.998+</strong><br>Thành viên
            </div>
            <div class="col-md-4">
                <strong class="highlight">103.348+</strong><br>Tin đăng
            </div>
            <div class="col-md-4">
                <strong class="highlight">300.000+</strong><br>Lượt truy cập/tháng
            </div>
        </div>
        <div class="text-center feedback">
            Chi phí thấp, hiệu quả tối đa
            <div class="stars">★★★★★</div>
            "Trước khi biết website ApartmentProvjp, mình phải tốn nhiều công sức và chi phí cho việc đăng tin cho thuê: từ việc phát tờ rơi, dán giấy, và đăng lên các website khác nhưng hiệu quả không cao.
            Từ khi biết website ApartmentProvjp.com, mình đã thử đăng tin lên và đánh giá hiệu quả khá cao trong khi chi phí khá thấp, không còn tình trạng phòng trống kéo dài."
            <br>— Anh Khánh (chủ hệ thống phòng trọ tại Tp.Đà Nẵng)
        </div>
        <div class="text-center cta mt-4">
            <strong>Bạn đang có phòng trọ / căn hộ cho thuê?</strong><br>
            Không phải lo tìm người cho thuê, phòng trống kéo dài
            <br><br>
            <button class="btn">Đăng tin ngay</button>
        </div>
    </div>
    <footer class="text-center py-4" style="background-color: #cdaa7d">
        <p style="font-family: sans-serif ;" >&copy; 2024 ApartmentProvjp. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.min.js"></script>

    <script>
                                    //Phường/Xã theo Quận/Huyện
                                    const wardsByDistrict = {
                                        "lien_chieu": ["Phường Hòa Hiệp Bắc", "Phường Hòa Hiệp Nam", "Phường Hòa Khánh Bắc", "Phường Hòa Khánh Nam", "Phường Hòa Minh"],

                                        "hai_chau": ["Phường Bình Hiên", "Phường Bình Thuận", "Phường Hải Châu 1", "Phường Hải Châu 2", "Phường Hòa Cường Bắc", "Phường Hòa Cường Nam", "Phường Hòa Thuận Đông",
                                            "Phường Hòa Thuận Tây", "Phường Nam Dương", "Phường Phước Ninh", "Phường Thạch Thang", "Phường Thanh Bình", "Phường Thuận Phước"],

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

