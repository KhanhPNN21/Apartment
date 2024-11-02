<%-- 
    Document   : payment.jsp
    Created on : Oct 12, 2024, 12:38:16 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        body{
            background-image: url('https://i0.wp.com/www.medianama.com/wp-content/uploads/2022/07/fintech-payment-aggregators.jpeg?fit=2048%2C1209&ssl=1');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height: 100vh
        }
    </style>
    
    <!-- Include Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- Include Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Room Rental</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="booking.jsp">Bookings</a>
                    </li>/  
                    <li class="nav-item">
                        <a class="nav-link" href="#">Payment</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- Payment Form Card -->
                <div class="card shadow">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>Make a Payment</h4>
                    </div>
                    <div class="card-body">
                        <form action="payment" method="post">
                            <div class="mb-3">
                                <label for="bookingId" class="form-label">Booking ID</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-card-list"></i></span>
                                    <input type="text" id="bookingId" name="bookingId" class="form-control" placeholder="Enter Booking ID" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="amount" class="form-label">Amount</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                                    <input type="number" id="amount" name="amount" class="form-control" placeholder="Enter Amount" step="0.01" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="paymentMethod" class="form-label">Payment Method</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-credit-card"></i></span>
                                    <select id="paymentMethod" name="paymentMethod" class="form-select" required>
                                        <option value="credit_card">Credit Card</option>
                                        <option value="bank_transfer">Bank Transfer</option>
                                        <option value="cash">Cash</option>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Submit Payment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap 5.3.3 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

