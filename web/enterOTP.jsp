<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
            #resend-btn {
                display: none;
            } /* Ẩn nút gửi lại OTP khi trang tải */
        </style>
    </head>

    <body>
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3><i class="fa fa-lock fa-4x"></i></h3>
                                <h2 class="text-center">Nhập mã OTP</h2>
                                <% if (request.getAttribute("message") != null) {%>
                                <p class="text-danger ml-1"><%= request.getAttribute("message")%></p>
                                <% }%>

                                <div class="panel-body">
                                    <form id="register-form" action="ValidateOtp" role="form" autocomplete="off" class="form" method="post">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-envelope color-blue"></i>
                                                </span>
                                                <input id="otp" name="otp" placeholder="Nhập OTP" class="form-control" type="text" required="required" 
                                                       value="<%= request.getParameter("otp") != null ? request.getParameter("otp") : ""%>"> <!-- Giữ lại giá trị OTP nhập vào -->
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Đặt lại mật khẩu" type="submit">
                                        </div>
                                    </form>
                                    <!-- Add a "Resend OTP" link -->
                                    <form action="ValidateOtp" method="post">
                                        <input type="hidden" name="resend" value="true">
                                        <button id="resend-btn" class="btn btn-link" type="submit">Gửi lại OTP</button>
                                    </form>
                                    <p id="countdown-text" class="text-muted">Bạn có thể gửi lại OTP sau <span id="countdown">60</span> giây.</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            let countdown = 60;
            const countdownText = document.getElementById("countdown");
            const resendButton = document.getElementById("resend-btn");

            const interval = setInterval(() => {
                countdown--;
                countdownText.innerText = countdown;

                if (countdown <= 0) {
                    clearInterval(interval);
                    countdownText.style.display = "none"; // Ẩn văn bản đếm ngược
                    resendButton.style.display = "inline"; // Hiển thị nút gửi lại OTP
                }
            }, 1000);
        </script>
    </body>
</html>
