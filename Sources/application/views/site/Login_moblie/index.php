<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/comon.css">
</head>
<body>
    <main id="login__mb">
        <div class="login__content">
            <div class="modal__header">
                <div class="modal__header-back">
                    <button class="btn_back-home" onclick="goBackHome()">
                        <i class="fas fa-arrow-left"></i>
                    </button>
                </div>
            </div>
            <div class="modal__content">
                <div class="title_login">
                    <span>Đăng nhập</span>
                </div>
                <div class="login_tab">
                    
                    <form action="<?php echo base_url() . "index.php/home/checkLogin"?>" method="POST" role="form">
                        <div class="c10">
                            <input type="text" name="tk" id="email_mb" placeholder="Nhập email hoặc tên tài khoản" require>
                        </div>
                        <div class="c10">
                            <input type="password" name="mk" id="pw_mb" placeholder="Nhập mật khẩu" require>
                        </div>
                         <div class="c10">
                            <button type="submit" class="btn  btn__login-mb" role="button" name="Login">Đăng nhập</button>
                            <span class="c10_1"></span>
                         </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </main>
    <script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/fonts/a076d05399.js"></script>
    <script>
            //button click go back home
        function goBackHome() {
            window.history.back();
        }
    </script>
</body>
</html>