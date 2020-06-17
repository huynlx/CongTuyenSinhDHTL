<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/reset.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/owlcarousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/trelyco-login-vertical-horizontal.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/trelyco-login-vertical-horizontal1.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/Responsive.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/comon.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/js/jquery.min.js">
    <title>Document</title>
</head>

<body>
    <div id="wrapper">
        <div id="nav">
            <div class="container">
                <div class="nav__wrapp">
                    <div class="nav__left">
                        <ul class="nav__left--list">
                            <li class="nav__left--item">
                                <a href="<?php echo base_url(); ?>">
                                    <i class="fas fa-home"></i>
                                    Trang chủ
                                </a>
                            </li>
                            <?php
                            //Nếu đăng nhập là Admin (hoặc NV)
                            if ($this->session->userdata("CheckLogin")) { ?>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" href="<?php echo base_url(); ?>index.php/admin">Home Admin</a>
                                </li>
                            <?php } ?>
                            <li class="nav__left--item">
                                <a href="<?php echo base_url(); ?>home/lienhe">
                                    <i class="fas fa-phone-alt"></i>
                                    Liên hệ
                                </a>
                            </li>
                            <li class="nav__left--item">
                                <a href="<?php echo base_url(); ?>home/tvts">
                                    <i class="fas fa-users"></i>
                                    Tư vấn
                                </a>
                            </li>
                            <!-- <li class="nav__left--item">
                            <div class="search__menu-mb">
                                <i class="fas fa-search"></i>
                            </div>
                        </li> -->
                        </ul>
                    </div>
                    <div class="nav__mid">
                        <div class="nav__mid--search">
                            <form class="form-inline" id="search_form" action="/action_page.php">
                                <div class="search">
                                    <input type="text" name="" id="search" placeholder="Tìm kiếm...">
                                    <button type="button">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <p class="ml-auto navbar-text actions">
                        <?php
                        //Nếu đã đăng nhập
                        if ($this->session->userdata("CheckLogin")) { ?>
                            <div class="dropdown">
                                <a class="btn btn-light" style="color: black;"><i class="fa fa-user"></i><?php echo $this->session->userdata("ho_ten"); ?></a>
                                <div class="dropdown-content">
                                    <a href="<?php echo base_url() . "index.php/home/ttcn/" . $this->session->userdata("id_tk"); ?>"><i class="fa fa-cogs"></i>Cài đặt</a>
                                    <a href="<?php echo base_url(); ?>index.php/home/logout"><i class="fa fa-power-off"></i>Đăng xuất</a>
                                </div>
                            </div>
                        <?php }
                        //Nếu chưa đăng nhập
                        else { ?>
                            <div class="dropdown">
                                <a class="btn btn-light btnDangNhap" style="color: black;"><i class="fa fa-user"></i>Đăng Nhập</a>
                            </div>
                        <?php } ?>
                    </p>
                    <!-- Show menu moblie-->
                    <div class="nav__menu">
                        <i class="fas fa-bars menu-x"></i>
                    </div>
                    <!-- Show icon search moblie-->
                    <div class="search__menu-mb">
                        <i class="fas fa-search"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Decive Moblie -->
        <div class="search-mb">
            <div class="top_nav-mb">
                <input type="text" placeholder="Tìm kiếm">
                <span>
                    <i class="fas fa-search"></i>
                </span>
            </div>
        </div>

        <!-- Search Decive Moblie__END -->
        <div id="header">
            <div class="container">
                <div class="header__wrapp">
                    <div class="header__left">
                        <div id="logo">
                            <a href="<?php echo base_url(); ?>">
                                <img src="<?php echo base_url(); ?>assets/img/logo/Logo-Thuy_Loi.png" alt="">
                            </a>
                        </div>
                        <div class="name-school">
                            <p class="name">TRƯỜNG ĐẠI HỌC<br>
                                <span style="color:#D51C29;"> THỦY LỢI</span></p>
                            <p class="name">THỦY LỢI UNIVERSITY</p>
                        </div>
                    </div>
                    <div class="header__right">
                        <div class="name-school">
                            <p class="name">CỔNG THÔNG TIN TUYỂN SINH</p>

                            <p class="name">ĐH CHÍNH QUY 2020</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>