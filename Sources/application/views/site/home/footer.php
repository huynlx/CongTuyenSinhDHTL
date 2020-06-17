    <footer id="footer">  
        <div class="container">
            <div class="footer__wrapp">
                <div id="footer__left">
                    <div class="row">
                            <div class="col-sm-12 col-md-12 address-warpp">
                                <div class="address">
                                        <h1 class="footer-heading txt-16">TRƯỜNG ĐẠI HỌC THỦY LỢI</h1><br>
                                        Địa chỉ : 175 TÂY SƠN, ĐỐNG ĐA, HÀ NỘI.<br>
                                        Điện thoại: (024) 3852 2201 - Fax: (024) 3563 3351<br>
                                        Email: <a href="#">phonghcth@tlu.edu.vn</a>
                                </div>
                                <div class="address">
                                    <h1 class="footer-heading">TRƯỜNG ĐẠI HỌC THỦY LỢI - CƠ SỞ 2</h1><br>
                                    Phường An Thạnh - TX Thuận An - Tỉnh Bình Dương<br>
                                    Điện thoại: (84).650.3748 620<br>
                                    Fax:(84).650.3833 489
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 txt-top address-warpp">
                                <div class="address">
                                    <h1 class="footer-heading txt-16">TRƯỜNG ĐẠI HỌC THỦY LỢI - CƠ SỞ 2</h1><br>
                                    Địa chỉ : Số 2 - Đường Trường Sa - P.17 - Q.Bình Thạnh - Tp.Hồ Chí Minh<br>
                                    Điện thoại: (84)028.38&nbsp;400 532 - Fax: (84)028.38 400542<br>
                                    Email: <a href="#">cs2@tlu.edu.vn</a>
                                </div>
                                <div class="address">
                                    <h1 class="footer-heading txt-16">VIỆN ĐÀO TẠO VÀ KHOA HỌC ỨNG DỤNG MIỀN TRUNG</h1><br>
                                    Địa chỉ: Số 115 Trần Phú, Thành phố&nbsp;Phan Rang, Tỉnh Ninh Thuận<br>
                                    Điện thoại: 02593.823 027, 02593.823 028<br>
                                    Email: <a href="#"> trungtamdh2@tlu.edu.vn</a>
                                </div>
                            </div>
                    </div>
                </div>
                <div id="footer__right">
                        <ul class="social-icons">
                            <li>
                                <a href="https://www.facebook.com/daihocthuyloi1959/?fref=ts" target="_blank">
                                    <i class="fab fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.youtube.com/user/daihocthuyloi" target="_blank">
                                    <i class="fab fa-twitter-square"></i>
                                </a>
                            </li>
                            <li>
                                <a  href="https://www.youtube.com/user/daihocthuyloi" target="_blank">
                                    <i class="fab fa-youtube-square"></i>
                                </a>
                            </li>
                        </ul>
                        <p class="banquyen txt-top">
                            Bản quyền
                            <span style="font-size: small;">
                                <a href="#">
                                    <strong>©</strong>
                                </a>
                            </span>
                            2020
                            <a rel="author" href="https://plus.google.com/u/0/+hutech">
                            <br> THỦY LỢI UNIVERSITY
                            </a>
                        </p>
                </div>
            </div>
        </div>

        <div id="back-to-top">
            <i class="fas fa-chevron-up"></i>
        </div>
    </footer>
    <div class="me-form-login">
        <div class="login-card">
            <img src="<?php echo base_url();?>assets/img/logo-login.png" class="profile-img-card">
            <form class="form-signin" method="post" action="<?php echo base_url() . "index.php/home/checkLogin"?>">
                <input class="form-control  w3-animate-right" type="text" placeholder="Tài Khoản" autofocus="" id="TaiKhoan" name="tk">
                <input class="form-control  w3-animate-left" type="password" placeholder="Mật Khẩu" id="MatKhau" name="mk">
                <input class="btn btn-primary btn-block btn-lg btn-signin w3-animate-top" type="submit" value="Login" id="Login" name="Login">
            </form>
            <div class="btn-close">
                <i class="fas fa-times"></i>
            </div>
        </div>
    </div>
        <!-- Menu-Moblie -->
        <div id="menu-mb">
            <div class="inner-menu">
                <a href="<?php echo base_url();?>home/login_mb" class="avatar">
                    <div class="login-menu">
                        <i class="fas fa-user-circle"></i>
                        <span>Đăng nhập</span>
                        <svg class="arrow-left" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" size="20" height="20" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>
                    </div>
                </a>
                <div class="content-menu">
                    <ul class="nav-list">
                        <li>
                            <a href="<?php echo base_url();?>home/ttxt">
                                <img src="<?php echo base_url();?>assets/img/img_dhtl/nts.png" alt="">
                                <span>
                                    Thông tin xét tuyển
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url();?>home/tbxt">
                                <img src="<?php echo base_url();?>assets/img/img_dhtl/tintuc1.png" alt="">
                                <span>
                                    Thông báo xét tuyển
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url();?>home/ttnxt">
                                <img src="<?php echo base_url();?>assets/img/img_dhtl/nganhts1.png" alt="">
                                <span>
                                    Thông tin ngành tuyển sinh
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url();?>home/xhb">
                                <i class="fas fa-book-open icon-xhb" ></i>
                                <span>
                                    Xét học bạ trực tuyến
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url();?>home/tvts">
                                <img src="<?php echo base_url();?>assets/img/img_dhtl/tuvan1.png" alt="">
                                <span>
                                    Tư vấn tuyển sinh
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo base_url();?>home/lienhe">
                                <img src="<?php echo base_url();?>assets/img/img_dhtl/lienhe1.png" alt="">
                                <span>
                                    Liên hệ
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- <div class="content-hotline">
                
                </div> -->
            </div>
        </div>
    <!-- Menu-Moblie-End -->
  
    
    <!-- Modal -->
        <div class="D_modal">
            
        </div>
    <!-- End -->
</div>
    <script src="<?php echo base_url();?>assets/js/jquery.min.js"></script>
    <script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/fonts/a076d05399.js"></script>
    <script src="<?php echo base_url();?>assets/vendor/owlcarousel/owl.carousel.js"></script>
    <script src="<?php echo base_url();?>assets/vendor/owlcarousel/owl.carousel.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendor/comon.js"></script>
    <script src="<?php echo base_url();?>assets/js/script.js"></script>
</body>
</html>