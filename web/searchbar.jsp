<%-- 
    Document   : searchbar
    Created on : Oct 31, 2024, 9:50:08 AM
    Author     : acer
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Rooms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
