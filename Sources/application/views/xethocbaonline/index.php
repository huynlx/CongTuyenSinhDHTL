<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?php echo base_url();?>asset/vendor/reset.css">
    <link rel="stylesheet" href="<?php echo base_url();?>asset/css/header.css">
    <link rel="stylesheet" href="<?php echo base_url();?>asset/vendor/comon.css">
    <link rel="stylesheet" href="<?php echo base_url();?>asset/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>asset/vendor/materialize.min.css">
    <title>Document</title>
</head>
<body>
    
    <div id="wrapper">
        <div id="header" class="header-nguyenvong" style="box-shadow: 1px 4px 7px #ccc;">
            <div class="container">
                <div class="header__wrapp">
                    <div class="header__left">
                        <div id="logo">
                            <img src="<?php echo base_url();?>asset/image/logo/Logo-Thuy_Loi.png" alt="">
                        </div>
                    </div>
                    <div class="header__right">
                        <div class="name-school">
                            <p>PHIẾU ĐĂNG KÝ XÉT TUYỂN ĐẠI HỌC CHÍNH QUY <br>
                                (Dành cho thí sinh xét tuyển bằng học bạ)
                            </p>
                        </div>
                    </div>
                </div>
            </div>   
        </div>
        <div id="main">
            <div class="container">
                <h3 class="title-heading">
                    <i class="fas fa-exclamation-circle"></i>
                    <p>THÔNG TIN THÍ SINH</p>
                </h3>
                
                <div class="form-xettuyen">
                    <form action="" method="POST" role="form" id="form">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="">Họ, chữ đệm và tên của thí sinh</label>
                                    <input type="text" class="form-control" id="" placeholder="Họ, chữ đệm và tên của thí sinh">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Giới tính</option>
                                        <option value="">Nam</option>
                                        <option value="">Nữ</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control datepicker" placeholder="Ngày/tháng/năm sinh">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group" id="datetimepicker1">
                                    <input type="text" class="form-control"  placeholder="Nơi sinh">  
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control"  value="Kinh" placeholder="Dân tộc">  
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control"  placeholder="CMND hoặc căn cước Công dân">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control datepicker"  placeholder="Ngày cấp">  
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control"  placeholder="Nơi cấp">  
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <b>Hộ khẩu thường trú</b>
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="datepicker" placeholder="Hộ khẩu thường trú">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p>Hộ khẩu thường trú không được để trống</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Mã tỉnh (tp)</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Mã huyện (quận)</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Mã phường (xã) (nếu có)</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <p><b>Nơi học THPT</b>(Ghi tên trường và nơi trường đóng: huyện (quận), tỉnh (thành phố) và ghi mã tỉnh, mã trường)</p>
                                </div>
                                <hr>
                            </div>
                        </div>
                        <!-- Lớp 10 -->
                        <div class="row">
                            <div class="col-md-12">
                                <span>Lớp 10</span>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option>Tên trường</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Địa chỉ</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã tỉnh(tp)">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã trường">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END 10 -->

                        <!-- Lớp 11 -->
                        <div class="row">
                            <div class="col-md-12">
                                <span>Lớp 11</span>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option>Tên trường</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Địa chỉ</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã tỉnh(tp)">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã trường">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END 11 -->

                        <!-- Lớp 12 -->
                        <div class="row">
                            <div class="col-md-12">
                                <span>Lớp 12</span>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option>Tên trường</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Địa chỉ</option>
                                    </select>
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã tỉnh(tp)">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mã trường">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p></p>
                                    </div>
                                    <div class="text-count">
                                        2 / 2
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END 12 -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="" placeholder="Điện thoại liên lạc">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p>Điện thoại liên lạc không được để trống</p>
                                    </div>
                                    <div class="text-count">
                                       0 / 11
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="" placeholder="Email">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p>Email không được để trống</p>
                                    </div>
                                    <div class="text-count">
                                       0 / 255
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="" placeholder="Địa chỉ liên hệ">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p>Địa chỉ liên hệ không được để trống</p>
                                    </div>
                                    <div class="text-count">
                                       0 / 500
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="" placeholder="Năm tốt nghiệp">
                                </div>
                                <div class="text-details">
                                    <div class="text-messages">
                                        <p>Năm tốt nghiệp không được để trống</p>
                                    </div>
                                    <div class="text-count">
                                       0 / 4
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Khu vực ưu tiên</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select name="" id="input" class="form-control" required="required">
                                        <option value="">Đối tượng ưu tiên (nếu có)</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h3 class="title-heading">
                                    <i class="fas fa-exclamation-circle" aria-hidden="true"></i>
                                    <p>THÔNG TIN ĐĂNG KÝ XÉT TUYỂN</p>
                                </h3>
                                <p > Sau khi đã đọc và hiểu rõ các quy định về tiêu chí và điều kiện xét tuyển của Nhà trường, tôi đăng ký xét tuyển vào trình độ Đại học các Ngành/ Nhóm ngành/ Chuyên ngành/ Nhóm chuyên ngành theo thứ tự ưu tiên như bảng sau: </p>
                            </div>
                        </div>
                        <div class="row" id="nguyenvong">   
                            <div class="col-md-12" id="block__nguyenvong">
                                <div id="panel_nguyenvong">
                                    <div class="col-sm-3 col-lg-3">
                                        <div class="v-text-field__slot">
                                            <div class="v-text-field__prefix">Nguyện vọng</div>
                                            <input type="number" id="quantity" name="quantity" min="1" max="19">
                                        </div>
                                    </div>
                                    <div class="col-sm-9 col-lg-9" id="show_form_nv">
                                        <div class="row"">
                                            <div class="col-md-6">Mã xét tuyển: chưa chọn</div>
                                            <div class="col-md-6">Tổ hợp xét tuyển: chưa chọn</div>
                                        </div>
                                        <span class="icon-toggle" style="width:20px;height:20px;float:right;text-align:center;">
                                            <i class="fas fa-angle-down"></i>
                                        </span>
                                      
                                    </div>
                                  
                                </div>
                                <div id="form_nguyenvong">

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <select name="" id="input" class="form-control" required="required">
                                                    <option value="">Các nhóm ngành tuyển sinh</option>
                                                </select>
                                            </div>
                                            <div class="text-details">
                                                <div class="text-messages">
                                                    <p>Ngành/ Nhóm ngành/ Chuyên ngành/ Nhóm chuyên ngành xét tuyển không được để trống</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="" placeholder="Mã xét tuyển">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="" placeholder="Tổ hợp xét tuyển">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div>
                                                <b>Điểm trung bình 3 năm THPT</b>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span>Lớp 10</span>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 1">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 2">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 3">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span>Lớp 11</span>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 1">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 2">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 3">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span>Lớp 12</span>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 1">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 2">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control" id="" placeholder="Điểm trung bình cả năm môn 3">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col">
                                            <button type="button" class="btn btn-success thugon">THU GỌN</button>
                                            
                                            <button type="button" class="btn btn-warning delete">Xóa</button>
                                            
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div title="Thêm nguyện vọng" style="display:flex;align-items:center;position:relative;">
                                    <button type="button" class="btn-nguyenvong">
                                        <i class="fas fa-plus" onclick="myFunction(this)"></i>
                                    </button>
                                    <div class="v-speed-dial__list">
                                        <div class="a" style="transition-delay: 0.1s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 1 nguyện vọng"><span class="v-btn__content">1</span></button>
                                            
                                        </div>
                                        <div class="a" style=transition-delay: 0.1s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 2 nguyện vọng"><span class="v-btn__content">2</span></button></div>
                                        <div class="a" style=transition-delay: 0.15s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 3 nguyện vọng"><span class="v-btn__content">3</span></button></div>
                                        <div class="a" style=transition-delay: 0.2s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 4 nguyện vọng"><span class="v-btn__content">4</span></button></div>
                                        <div class="a" style=transition-delay: 0.25s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 5 nguyện vọng"><span class="v-btn__content">5</span></button></div>
                                        <div class="a" style=transition-delay: 0.3s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 6 nguyện vọng"><span class="v-btn__content">6</span></button></div>
                                        <div class="a" style=transition-delay: 0.35s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 7 nguyện vọng"><span class="v-btn__content">7</span></button></div>
                                        <div class="a" style=transition-delay: 0.4s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 8 nguyện vọng"><span class="v-btn__content">8</span></button></div>
                                        <div class="a" style=transition-delay: 0.45s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 9 nguyện vọng"><span class="v-btn__content">9</span></button></div>
                                        <div class="a" style=transition-delay: 0.5s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 10 nguyện vọng"><span class="v-btn__content">10</span></button></div>
                                        <div class="a" style=transition-delay: 0.55s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 11 nguyện vọng"><span class="v-btn__content">11</span></button></div>
                                        <div class="a" style=transition-delay: 0.6s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 12 nguyện vọng"><span class="v-btn__content">12</span></button></div>
                                        <div class="a" style=transition-delay: 0.65s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 13 nguyện vọng"><span class="v-btn__content">13</span></button></div>
                                        <div class="a" style=transition-delay: 0.7s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 14 nguyện vọng"><span class="v-btn__content">14</span></button></div>
                                        <div class="a" style=transition-delay: 0.75s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 15 nguyện vọng"><span class="v-btn__content">15</span></button></div>
                                        <div class="a" style=transition-delay: 0.8s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 16 nguyện vọng"><span class="v-btn__content">16</span></button></div>
                                        <div class="a" style=transition-delay: 0.85s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 17 nguyện vọng"><span class="v-btn__content">17</span></button></div>
                                        <div class="a" style=transition-delay: 0.9s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 18 nguyện vọng"><span class="v-btn__content">18</span></button></div>
                                        <div class="a" style=transition-delay: 0.95s;"><button data-v-07ce646b="" type="button" class="btn-green" title="Thêm 19 nguyện vọng"><span class="v-btn__content">19</span></button></div>
                                   </div>
                                    <span class="ml-4" style="padding-left:20px;position: absolute;left: 60px;z-index:1;">Thêm nguyện vọng</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                
                            </div>
                            <div class="col-md-3">
                                
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-12 luu_y">
                                <p class="text-hd"></p>
                                    <span> <b>Nộp kèm file minh chứng (ảnh chụp/scan: Phiếu ĐKXT, Học bạ hoặc Đơn xác nhận KQ học tập, Giấy xác nhận hưởng chế độ ưu tiên nếu có).</b> </span>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url();?>asset/vendor/jquery.min.js"></script>
    <script src="<?php echo base_url();?>asset/vendor/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>asset/font/a076d05399.js"></script>
    <script src="<?php echo base_url();?>asset/vendor/materialize.min.js"></script>
    <script src="<?php echo base_url();?>asset/js/script.js"></script>
    <script src="<?php echo base_url();?>asset/vendor/comon.js"></script>
</body>
</html>