<%-- 
    Document   : style
    Created on : Oct 31, 2024, 10:01:40 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
        }
        .sidebar {
            background-color: #2c3e50; /* Màu nền của sidebar */
            color: #ecf0f1; /* Màu chữ */
            padding: 20px; /* Padding cho nội dung bên trong */
            border-radius: 8px; /* Bo góc */
            height: auto; /* Cho phép chiều cao tự động mở rộng */
            min-height: 100vh; /* Đảm bảo sidebar chiếm ít nhất chiều cao của viewport */
        }

        .nav-link {
            color: #ecf0f1 !important;
        }
        .nav-link:hover {
            color: #3498db !important;
        }
        .card {
            background-color: #f8f9fa; /* Màu nền trắng */
            border: 1px solid #007bff; /* Viền mỏng */
            border-radius: 8px; /* Bo góc cho card */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
        }
        .form-label {
            font-weight: 600;
        }
        .btn-primary {
            background: linear-gradient(90deg, #3498db, #8e44ad);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #2980b9, #732d91);
        }
        input, select, textarea {
            border-radius: 8px;
            border: 1px solid #bdc3c7;
            transition: all 0.3s;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
            outline: none;
        }
        .alert {
            background-color: #e74c3c;
            color: white;
        }
        .text-danger {
            color: red !important;
        }

    </style>
</html>
