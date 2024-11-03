<%-- 
    Document   : postDetail
    Created on : Oct 31, 2024, 9:52:37 PM
    Author     : Tai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <!-- Location Section -->
        <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="district" class="form-label">Quận/Huyện</label>
                                        <select id="district" class="form-select" name="district" >
                                            <option value="">Chọn quận huyện</option>
                                            <option value="Quận Liên Chiểu">Quận Liên Chiểu</option>
                                            <option value="Quận Hải Châu">Quận Hải Châu</option>
                                            <option value="Quận Ngũ Hành Sơn">Quận Ngũ Hành Sơn</option>
                                            <option value="Quận Sơn Trà">Quận Sơn Trà</option>
                                            <option value="Quận Cẩm Lệ">Quận Cẩm Lệ</option>
                                            <option value="Quận Thanh Khê">Quận Thanh Khê</option>
                                            <option value="Huyện Hòa Vang">Huyện Hòa Vang</option>
                                            <option value="Huyện Hoàng Sa">Huyện Hoàng Sa</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ward" class="form-label">Phường/Xã</label>
                                        <select id="ward" class="form-select" name="ward">
                                            <option value="">Chọn phường xã</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- House Information -->
                                <div class="mb-3">
                                    <label for="houseNumber" class="form-label">Số nhà</label>
                                    <input type="text" class="form-control" required="" placeholder="Nhập số nhà và đường" id="houseNumber" name="houseNumber">
                                </div>

                                <div class="mb-3">
                                    <label for="apartmentName" class="form-label">Tên chung cư/căn hộ</label>
                                    <input type="text" class="form-control" required="" placeholder="Nhập tên chung cư/căn hộ" id="apartmentName" name="apartmentName">
                                </div>    

                                <!-- Description Section -->
                                <br><div class="mb-3">
                                    <h4>Thông tin mô tả</h4>
                                </div>

                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input type="text" class="form-control" placeholder="Nhập tiêu đề bài đăng" id="title" name="title" required>
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Mô tả</label>
                                    <textarea type="text" class="form-control" placeholder="Nhập mô tả" id="description" name="description"></textarea>
                                </div>    

                                <div class="mb-3">
                                    <label for="ownerName" class="form-label">Tên người cho thuê</label>
                                    <input type="text" class="form-control" id="ownerName" value="${sessionScope.user.fullName}"
                                           name="ownerName"  readonly>
                                </div>
                                <div class="mb-3 row">   
                                    <div class="col-md-6">
                                        <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                        <input type="tel" class="form-control" id="phoneNumber"  
                                               name="phoneNumber"  value="${sessionScope.user.phone}" readonly>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="rentPrice" class="form-label">Giá cho thuê triệu/tháng (VND)</label>
                                        <input type="number" class="form-control" id="rentPrice" name="rentPrice" required
                                               placeholder="Nhập giá cho thuê">
                                    </div>
                                </div>       

                                <div class="mb-3 row">
                                    <div class="col-md-4">
                                        <label for="area" class="form-label">Diện tích (m²)</label>
                                        <input type="number" class="form-control" id="area" name="area" required
                                               oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Nhập diện tích">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="roomNumber" class="form-label">Số phòng</label>
                                        <input type="number" required class="form-control" id="roomNumber" name="roomNumber" placeholder="Nhập số phòng">
                                    </div>

                                    <div class="col-md-4">
                                        <label for="roomAvailable" class="form-label">Số lượng phòng</label>
                                        <input type="number" required class="form-control" id="roomAvailable" name="roomAvailable" placeholder="Nhập số lượng phòng còn trống">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="image" class="form-label">Hình ảnh</label>
                                    <input type="file" class="form-control" id="image" name="image" multiple accept=".jpg, .jpeg, .png, .img">
                                    <small class="form-text text-muted">Chọn nhiều hình ảnh (JPG, PNG, IMG).</small>
                                </div>

                                <br><div class="mb-3">
                                    <h4>Tiền đăng</h4>
                                </div>

                                <div class="mb-3">
                                    <label for="level" class="form-label">Cấp độ bài đăng</label>
                                    <select id="level" class="form-select" name="level" onchange="updatePrice()">
                                        <option value="">Chọn cấp độ</option>
                                        <option value="1">Cấp độ 1</option>
                                        <option value="2">Cấp độ 2</option>
                                        <option value="3">Cấp độ 3</option>
                                        <option value="4">Cấp độ 4</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="duration" class="form-label">Số ngày tồn tại bài đăng</label>
                                    <select id="duration" class="form-select" name="duration" onchange="updatePrice()">
                                        <option value="">Chọn số ngày</option>
                                        <option value="3">3 ngày</option>
                                        <option value="7">7 ngày</option>
                                        <option value="30">30 ngày</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="price" class="form-label">Giá bài đăng (VNĐ)</label>
                                    <input type="text" class="form-control" id="price" placeholder="Số tiền" name="price" readonly>
                                </div>

                                <button type="submit" id="submitBtn" class="btn btn-primary">Đăng tin</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</html>
