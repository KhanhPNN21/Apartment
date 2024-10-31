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
        <jsp:include page="post/style.jsp" />
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="post/headerPost.jsp" />
        <jsp:include page="post/leftPost.jsp" />
                <!-- Main Content -->
                <div class="col-md-9">
                    <div class="card my-3">
                        <div class="card-body">
                            <h4>Đăng tin mới</h4>
                            <div class="alert alert-danger" style="background-color: #FFCC99; color: black ">
                                Nếu bạn đã từng đăng tin trên ApartmentProVjp.com, hãy sử dụng chức năng GIA HẠN / NÂNG CẤP để làm mới.
                            </div>
                            <form action="PostServlet?userId=${param.userId}" method="POST" >
                                <jsp:include page="post/postDetail.jsp" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="post/selectward.jsp" /> 
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
