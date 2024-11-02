<%-- 
    Document   : Service_price
    Created on : Oct 24, 2024, 10:21:39 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bảng Giá Dịch Vụ</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

    </head>
    <body>
        <% 
    // Kiểm tra thuộc tính 'user' trong session
    if (session.getAttribute("user") != null) {
        // Người dùng đã đăng nhập, include trang a.jsp
        %>
        <jsp:include page="headeruser.jsp" />
        <% 
            } else {
                // Người dùng chưa đăng nhập, include trang b.jsp
        %>
        <jsp:include page="headerhome.jsp" />
        <% 
            } 
        %>
        <div class="container my-5">
            <div class="title text-center">
                <h2>Giới thiệu ApartmentProVjp.com</h2>
            </div>

            <div class="card shadow-lg p-4" style="background-color: #FEF3E4;">
                <h5 class="mb-4 text-primary">Đừng để phòng trống thêm bất cứ ngày nào, đăng tin ngay tại ApartmentProVjp.com và tất cả các vấn đề sẽ được giải quyết một cách nhanh nhất.</h5>
                <h6 class="mb-3">Ưu điểm của ApartmentProVjp.com:</h6>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" style="background-color: #FEF3E4;"> 
                        <i class="bi bi-check2"></i> <strong>Top đầu Google</strong> về từ khóa: cho thuê phòng trọ, phòng trọ hồ chí minh, phòng trọ hà nội,...
                    </li>

                    <li class="list-group-item" style="background-color: #FEF3E4;">
                        <i class="bi bi-check2"></i> ApartmentProVjp.com tự hào có lượng dữ liệu bài đăng lớn nhất trong lĩnh vực cho thuê phòng trọ với hơn <strong>103.348 tin</strong>...
                    </li>
                    <li class="list-group-item" style="background-color: #FEF3E4;">
                        <i class="bi bi-check2"></i> ApartmentProVjp.com tự hào có số lượng người dùng đăng tin và hơn <strong>2.500.000 lượt pageview</strong> mỗi tháng.
                    </li>
                    <li class="list-group-item" style="background-color: #FEF3E4;">
                        <i class="bi bi-check2"></i> ApartmentProVjp.com tự hào được sự tin tưởng của hơn <strong>116.998 khách hàng</strong> là chủ nhà, đại lý, môi giới...
                    </li>
                    <li class="list-group-item" style="background-color: #FEF3E4;">
                        <i class="bi bi-check2"></i> ApartmentProVjp.com tự hào ghi nhận <strong>88.879 giao dịch thành công</strong> với hiệu quả đạt tới <strong>85%</strong> tổng tin đăng.
                    </li>

                </ul>
            </div>

        </div>
        <div class="container my-5">
            <h2 class="text-center mb-4">Bảng giá dịch vụ</h2>
            <p class="text-center">Áp dụng từ ngày 31/05/2024</p>

            <div class="row row-cols-1 row-cols-md-4 g-4 pricing-table">
                <!-- Column 1 -->
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-white" style="background-color:#ff3030">
                            Tin VIP nổi bật
                            <!-- Thêm các ngôi sao dưới đây -->
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                        </div>


                        <div class="card-body">
                            <h5>50.000đ</h5>
                            <p>(Giới hạn 3 ngày)</p>
                            <h5>100.000đ</h5>
                            <h6><del>500.000đ</del></h6>
                            <p>Giảm 10% chỉ còn</p>
                            <h5>450.000đ</h5>
                            <p>Giá đẩy tin: 10.000đ</p>
                            <p>Tiêu đề màu đỏ, in hoa</p>
                            <i class="bi bi-check2 check-icon"></i> Tự động duyệt <br>
                            <i class="bi bi-check2 check-icon"></i> Hiển thị số điện thoại <br>
                            <i class="bi bi-check2 check-icon"></i> Huy hiệu nổi bật
                        </div>
                        <div class="card-footer text-center">
                            <a href="#" class="btn btn-primary">Xem demo</a>
                        </div>
                    </div>
                </div>

                <!-- Column 2 -->
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-white" style="background-color: #ff1493">Tin VIP 1
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>

                            </div></div>

                        <div class="card-body">
                            <h5>30.000đ</h5>
                            <p>(Giới hạn 3 ngày)</p>
                            <h5>60.000đ</h5>
                            <h6><del>300.000đ</del></h6>
                            <p>Giảm 10% chỉ còn</p>
                            <h5>270.000đ</h5>
                            <p>Giá đẩy tin: 5.000đ</p>
                            <p>Tiêu đề màu hồng, in hoa</p>
                            <i class="bi bi-check2 check-icon"></i> Tự động duyệt <br>
                            <i class="bi bi-x cross-icon"></i> Hiển thị số điện thoại <br>
                            <i class="bi bi-x cross-icon"></i> Huy hiệu nổi bật
                        </div>
                        <div class="card-footer text-center">
                            <a href="#" class="btn btn-primary">Xem demo</a>
                        </div>
                    </div>
                </div>

                <!-- Column 3 -->
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-white" style="background-color:#ff8c00 ">Tin VIP 2
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>


                            </div></div>
                        <div class="card-body">
                            <h5>20.000đ</h5>
                            <p>(Giới hạn 3 ngày)</p>
                            <h5>40.000đ</h5>
                            <h6><del>200.000đ</del></h6>
                            <p>Giảm 10% chỉ còn</p>
                            <h5>180.000đ</h5>
                            <p>Giá đẩy tin: 3.000đ</p>
                            <p>Tiêu đề màu cam, in hoa</p>
                            <i class="bi bi-check2 check-icon"></i> Tự động duyệt <br>
                            <i class="bi bi-x cross-icon"></i> Hiển thị số điện thoại <br>
                            <i class="bi bi-x cross-icon"></i> Huy hiệu nổi bật
                        </div>
                        <div class="card-footer text-center">
                            <a href="#" class="btn btn-primary">Xem demo</a>
                        </div>
                    </div>
                </div>

                <!-- Column 4 -->
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-white" style="background-color: #1e90ff">Tin VIP 3
                            <div>
                                <i class="bi bi-star-fill"></i>

                            </div></div>
                        <div class="card-body">
                            <h5>10.000đ</h5>
                            <p>(Giới hạn 3 ngày)</p>
                            <h5>20.000đ</h5>
                            <h6><del>100.000đ</del></h6>
                            <p>Giảm 10% chỉ còn</p>
                            <h5>90.000đ</h5>
                            <p>Giá đẩy tin: 2.000đ</p>
                            <p>Tiêu đề màu xanh, in hoa</p>
                            <i class="bi bi-check2 check-icon"></i> Tự động duyệt <br>
                            <i class="bi bi-x cross-icon"></i> Hiển thị số điện thoại <br>
                            <i class="bi bi-x cross-icon"></i> Huy hiệu nổi bật
                        </div>
                        <div class="card-footer text-center">
                            <a href="#" class="btn btn-primary">Xem demo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
