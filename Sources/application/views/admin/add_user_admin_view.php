<div class="row register-form">
    <form action="<?php echo base_url();?>index.php/admin/pro_add_user" method="post" class="custom-form" style="padding: 0; margin: 0; width: 100%">
        <h1>Thêm Thành Viên</h1>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Tên Đăng Nhập</label></div>
            <div class="col-lg-7 col-md-7 input-column"><input class="form-control" type="text" name="tk"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Mật Khẩu</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="text" name="mk"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Họ Tên</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="text" name="ht"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Giới Tính</label></div>
            <div class="col-lg-4 col-md-4 label-column">
                <div class="Sex">
                    <div class="form-check"><input class="form-check-input" type="radio" name="gt" value="Nam"><label class="form-check-label">Nam</label></div>
                    <div class="form-check"><input class="form-check-input" type="radio" name="gt" value="Nữ"><label class="form-check-label">Nữ</label></div>
                </div>
            </div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Email</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="text" name="email"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Ngày Sinh</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="date" name="ns"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Số Điện Thoại</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="text" name="sdt"></div>
        </div>
        <div class="form-row form-group">
            <div class="col-lg-4 col-md-4 label-column"><label class="col-form-label">Địa Chỉ</label></div>
            <div class="col-lg-7 col-md-7 label-column"><input class="form-control" type="text" name="dc"></div>
        </div>
        <input class="btn btn-light submit-button" type="submit" value="Đăng Ký">
    </form>
    <?php echo validation_errors();?>
</div>