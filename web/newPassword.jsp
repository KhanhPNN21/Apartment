<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>New Password</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            body {
                background-color: #f0f4f7; /* Light background color */
            }

            .placeicon {
                font-family: fontawesome;
            }

            .custom-control-label::before {
                background-color: #e3e3e3;
                border: #e3e3e3;
            }

            .bg-custom-white {
                background-color: #ffffff; /* White for card background */
            }

            .border-accent {
                border-color: #5a9ad6; /* Accent border color */
            }

            .btn-custom {
                background-color: #5a9ad6; /* Button color */
                color: #fff;
            }

            .btn-custom:hover {
                background-color: #4a8ac7; /* Hover color */
            }

            .text-custom {
                color: #5a9ad6; /* Accent text color */
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <div class="container bg-custom-white rounded mt-2 mb-2 px-0">
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1 class="text-custom">
                                    <strong>Đặt lại mật khẩu</strong>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="newPassword" method="POST">
                                    <!-- New Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="text" name="password" placeholder="&#xf084; &nbsp; Mật khẩu mới"
                                                   class="form-control border-accent placeicon">
                                        </div>
                                    </div>
                                    <!-- Confirm Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="confPassword"
                                                   placeholder="&#xf084; &nbsp; Nhập lại mật khẩu"
                                                   class="form-control border-accent placeicon">
                                        </div>
                                    </div>
                                    <!-- Submit Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Đặt lại"
                                                   class="btn btn-block btn-custom">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="mx-0 px-0 bg-light">
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                <div class="pt-2">
                                    <div class="row justify-content-center">
                                        <h5>
                                            Bạn không có Tài khoản?<span><a href="Signup.jsp"
                                                                           class="text-custom"> Đăng kí ngay!</a></span>
                                        </h5>
                                    </div>
                                    <div class="row justify-content-center align-items-center pt-4 pb-5">
                                        <div class="col-4"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
    </body>
</html>
