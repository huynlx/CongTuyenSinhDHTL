<div class="me-form-login">
    <div class="login-card">
        <img src="<?php echo base_url();?>assets/img/logo-login.png" class="profile-img-card">
        <form class="form-signin" method="post" action="<?php echo base_url() . "index.php/home/checkLogin"?>">
            <input class="form-control  w3-animate-right" type="text" placeholder="Tài Khoản" autofocus="" id="TaiKhoan" name="tk">
            <input class="form-control  w3-animate-left" type="password" placeholder="Mật Khẩu" id="MatKhau" name="mk">
            <input class="btn btn-primary btn-block btn-lg btn-signin w3-animate-top" type="submit" value="Login" id="Login" name="Login">
        </form>
    </div>
</div>