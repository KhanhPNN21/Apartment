<%-- 
    Document   : style
    Created on : Oct 31, 2024, 10:01:40 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
            @font-face {
                font-family: 'Baloo-Regular';
                src: url('font/Baloo-Regular.ttf') format('truetype');
                font-weight: normal;
                font-style: normal;
            }

            .header {
                position: relative;
                z-index: 1;
                margin: 20px;
                border-radius: 15px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
                background-color: white;
            }

            body {
                background: linear-gradient(135deg, #E3F2FD, #BBDEFB);
                font-family: 'Baloo-Regular', sans-serif;
            }

            body {
                height: 100%;
                margin: 0;
            }

            body {
                background-image: url("image/3.png");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin: 0;
                height: 100vh;
            }

            /* Navbar Styling */

            .navbar {
                background: none;
                box-shadow: none;
                padding: 1rem 2rem;
            }

            .navbar-brand, .nav-link{
                color: #1976D2;
                font-weight: bold;
            }

            .sidebar .nav-link {
                color: whitesmoke;
                font-weight: bold;
            }

            .navbar-brand {
                font-size: 1.5rem;
            }

            .nav-link {
                margin-right: 20px;
                font-size: 1.1rem;
            }

            .sidebar {
                background-color: #1976D2;
                border-radius: 15px 0 0 15px;
                margin-left: 0px;
               
            }

            .sidebar .btn {
                color: black;
                font-weight: bold;
                border-radius: 30px;
                width: 80%;
                margin: 10px auto;
                display: block;
                padding: 10px;
                font-size: 1.1rem;
                border: none;
                transition: all 0.3s ease;
            }

            .sidebar {
                background-color: #000022; /* Màu nền của sidebar */
                background-image: url(image/4.png);
                background-size: 160% ;
                background-position: calc(100% - 100%) calc(0% + 100%);
                background-repeat: no-repeat;
                color: #ecf0f1;
                border-radius: 8px;
                height: 95vh; /* Hoặc sử dụng max-height */
                display: flex;
                flex-direction: column;
                justify-content: flex-start; /* Đẩy nội dung lên trên cùng */
                position: sticky; /* Hoặc sử dụng fixed */
                top: 20px; /* Khoảng cách từ đỉnh viewport khi dùng sticky */
                padding: 20px; /* Khoảng cách bên trong */
                width: 24%;
            }

            .main-content {
                background-color: #FFFFFF;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-left: 1rem;

            }

            .form-label {
                font-weight: bold;
                color: #1976D2;
                font-size: 1rem;
            }

            .form-control, .form-select {
                border-radius: 10px;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #BBDEFB;
            }

            .alert {
                background-color: #FFCC99;
                color: black;
                font-weight: bold;
                text-align: center;
            }

            #submitBtn {
                background-color: #1976D2; /* Blue background */
                color: white; /* White text */
                font-weight: bold;
                border-radius: 20px;
                padding: 10px 20px;
                border: none;
                transition: all 0.3s ease;
            }

            #submitBtn:hover {
                background-color: #1565C0; /* Darker blue on hover */
            }

            .navbar {
                display: contents;
                justify-content: flex-end;
                max-width: 100%;
                margin-right: auto;
            }

            .main-content{
                background-color: #f5f5f5;
                background-image: url('image/5.png');
                background-size: cover;
                background-position: calc(100% + 79px) calc(0% + 80px);
                /*                calc(100% + 45px) calc(0% - 600px)*/
                background-repeat: no-repeat;
                padding: 20px;
            }

            .card {
                background-color: transparent;
                border: 1px solid white;
                border-radius: 8px;
                box-shadow: none;
            }

            .row {
                margin-left: 0;
                margin-right: 0;
            }

            .sidebar, .main-content {
                padding: 0px; /* Giảm padding tùy chỉnh nếu cần */
                margin: 0;
            }
            
            .main-content{
                padding: 30px; /* Giảm padding tùy chỉnh nếu cần */
                width: 75%;
                margin-left: 1%;
            }

            .navbar-nav .nav-item {
                margin-right: 240px; /* Điều chỉnh giá trị này để tăng/giảm khoảng cách */
            }

        </style>
</html>
