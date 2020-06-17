<header>
    <nav class="me-nav navbar navbar-light navbar-expand-md navigation-clean-button">
        <a class="navbar-brand" href="<?php echo base_url();?>index.php/admin">
            <span><img src="<?php echo base_url();?>assets/img/logo.png">Home Admin</span>
        </a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav nav-right">
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="<?php echo base_url();?>">Cổng Tuyển Sinh Đại Học Thủy Lợi</a>
                </li>
            </ul>
            <p class="ml-auto navbar-text actions">
                <div class="dropdown">
                    <a class="btn btn-light" style="color: black;"><i class="fa fa-user"></i><?php echo $this->session->userdata("ho_ten_tk"); ?></a>
                    <div class="dropdown-content">
                        <a href="<?php echo base_url() . "index.php/home/ttcn/" . $this->session->userdata("id_tk");?>"><i class="fa fa-cogs"></i>Setting</a>
                        <a href="<?php echo base_url();?>index.php/home/logout"><i class="fa fa-power-off"></i>Logout</a>
                    </div>
                </div>
            </p>
        </div>
    </nav>
</header>