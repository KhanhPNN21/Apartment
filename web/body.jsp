<%-- 
    Document   : body
    Created on : Oct 31, 2024, 9:11:27 AM
    Author     : acer
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="body-web">
        <div class=" text-center" style="margin-top: 30px;">
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
                                                    <img style="height: 200px; width: 450px;"src="${room.imgUrl}"alt="Image" class="img-fluid rounded">
                                                </div>


                                                <!-- Cột hiển thị thông tin chi tiết -->
                                                <div class="col-md-8">
                                                    <c:choose>
                                                        <c:when test="${room.rank == 4}">
                                                            <strong><h5 class="mb-2" style="color:red"> <div style="color:orange" class="stars">★★★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${room.rank == 3}">
                                                            <strong><h5 class="mb-2" style="color:#FF1493"> <div style="color: orange" class="stars">★★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${room.rank == 2}">
                                                            <strong><h5 class="mb-2" style="color:#CD6600"> <div style="color: orange" class="stars">★★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                        <c:when test="${room.rank == 1}">
                                                            <strong><h5 class="mb-2" style="color:#0000FF"> <div style="color: orange" class="stars">★★</div>${room.title}</h5></strong> 
                                                        </c:when>
                                                    </c:choose>
                                                    <ul class="list-unstyled">
                                                        <li><strong>Tên căn hộ:</strong> ${room.apartmentName}</li>
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

                    <div class="col-md-4" style="margin-left: 3% ">
                        <h3>NEWS</h3>
                        <p>Latest updates and news related to real estate</p>

                        <!-- Card Bài báo 1 -->
                        <div class="card mb-4" style="background: transparent; border: 1px solid #BCDEEE;">
                            <div>
                                <div>
                                    <div class="card-body">
                                        <h5 class="card-title">An toàn phòng cháy, chữa cháy ở các khu trọ: Những vấn đề đặt ra</h5>
                                        <p class="card-text">Thời gian qua, tại một số tỉnh, thành trong nước liên tiếp xảy ra các vụ cháy chung cư mini, nhà cho thuê trọ</p>
                                        <a target="blank" href="http://laocaitv.vn/chinh-tri-xa-hoi/an-toan-phong-chay-chua-chay-o-cac-khu-tro-nhung-van-de-dat-ra" class="btn btn-primary">Đọc thêm</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Card Bài báo 2 -->
                        <div class="card mb-4" style="background: transparent; border: 1px solid #BCDEEE;">
                            <div class="row g-0">
                                <div>
                                    <div class="card-body">
                                        <h5 class="card-title">Người trẻ ở nhà thuê</h5>
                                        <p class="card-text">Điều gì đang xảy ra trong thị trường cho thuê? Hãy xem xét những xu hướng và thay đổi.</p>
                                        <a target="blank" href="https://vnexpress.net/nguoi-tre-o-nha-thue-tron-doi-la-xu-the-tat-yeu-4587728.html" class="btn btn-primary">Đọc thêm</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Card Bài báo 3 -->
                        <div class="card mb-4" style="background: transparent; border: 1px solid #BCDEEE;">
                            <div>
                                <div>
                                    <div class="card-body">
                                        <h5 class="card-title">Những lưu ý khi thuê nhà</h5>
                                        <p class="card-text">Các lưu ý hữu ích dành cho người thuê nhà để có được một trải nghiệm tốt nhất trong việc tìm kiếm nhà cho thuê.</p>
                                        <a target="blank" href="https://dantri.com.vn/bat-dong-san/kinh-nghiem-thue-nha-nhanh-va-hieu-qua-cho-nguoi-it-kinh-nghiem-20240515130148020.htm" class="btn btn-primary">Đọc thêm</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="footer.jsp" />

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
    </div>
</html>
