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
        <style>
            /* Custom CSS to only show vertical borders inside the table */
            .table-bordered {
                border-collapse: collapse;
                border-left: 2px solid black;
                border-right: 2px solid black;
            }
            .table-bordered th, .table-bordered td {
                border-right: 2px solid black;
                border-left: 2px solid black;
                border-top: 1px solid white;
                border-bottom: none;
            }
            .table-bordered thead th {
                border-bottom: 2px solid black;
            }
            #border{
                border-top: 2px solid black;
            }
            #borderBotColor{
                border-bottom: 2px solid black;
            }
        </style>

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
            <h2 class="text-center mb-4 text-primary">Bảng giá dịch vụ</h2>
            <p class="text-center">Áp dụng từ ngày 31/05/2024</p>

            <div class="container my-5">
                <table class="table table-bordered text-center">
                    <thead class="table">
                        <tr>
                            <th class="align-middle text-center" style="background-color: #B5B5B5" id="border">Dịch vụ</th>
                            <th style="background-color: red;" id="border"> 
                                <h4 style="background-color: red; color: white">Tin VIP nổi bật</h4>
                                <span style="background-color: red; color: white">⭐⭐⭐⭐⭐</span>
                            </th>
                            <th style="background-color: #FF1493" id="border">
                                <h4 style="color: white; background-color: #FF1493">Tin VIP 1</h4>
                                <span style="background-color: #FF1493">⭐⭐⭐⭐</span>
                            </th>
                            <th style="background-color: #CD6600" id="border">
                                <h4 style="background-color: #CD6600; color: white">Tin VIP 2</h4>
                                <span style="background-color: #CD6600">⭐⭐⭐</span>
                            </th>
                            <th style="background-color: #0000FF" id="border">
                                <h4 style="background-color: #0000FF; color: white">Tin VIP 3</h4>
                                <span style="background-color: #0000FF">⭐⭐</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Giá ngày</th>
                            <td>50,000₫ <small>(Giới hạn 3 ngày)</small></td>
                            <td>30,000₫ <small>(Giới hạn 3 ngày)</small></td>
                            <td>20,000₫ <small>(Giới hạn 3 ngày)</small></td>
                            <td>10,000₫ <small>(Giới hạn 3 ngày)</small></td>
                        </tr>
                        <tr>
                            <th>Giá tuần</th>
                            <td>100,000₫</td>
                            <td>60,000₫</td>
                            <td>40,000₫</td>
                            <td>20,000₫</td>
                        </tr>
                        <tr>
                            <th class="align-middle text-center">Giá tháng</th>
                            <td>450,000₫ <del>500,000₫</del><br><span class="text-success">Giảm 10%</span></td>
                            <td>270,000₫ <del>300,000₫</del><br><span class="text-success">Giảm 10%</span></td>
                            <td>180,000₫ <del>200,000₫</del><br><span class="text-success">Giảm 10%</span></td>
                            <td>90,000₫ <del>100,000₫</del><br><span class="text-success">Giảm 10%</span></td>
                        </tr>
                        <tr>
                            <th>Màu sắc tiêu đề</th>
                            <td>Tiêu đề màu đỏ, in hoa</td>
                            <td>Tiêu đề màu hồng, in hoa</td>
                            <td>Tiêu đề màu cam, in hoa</td>
                            <td>Tiêu đề màu xanh, in hoa</td>
                        </tr>
                        <tr>
                            <th>Tự động duyệt</th>
                            <td>✔️</td>
                            <td>✔️</td>
                            <td>✔️</td>
                            <td>✔️</td>
                        </tr>
                        <tr>
                            <th>Hiển thị số điện thoại</th>
                            <td>✔️</td>
                            <td>✔️</td>
                            <td>❌</td>
                            <td>❌</td>
                        </tr>
                        <tr id="borderBotColor">
                            <th>Huy hiệu nổi bật</th>
                            <td>✔️</td>
                            <td>❌</td>
                            <td>❌</td>
                            <td>❌</td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </body>
</html>
