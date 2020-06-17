<div class="panel-group me-menu-admin">
    <?php
        if ($this->session->userdata("cap_do") == 0){
            ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#me-admin-tv"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Tài Khoản</a>
                    </h4>
                </div>
                <div id="me-admin-tv" class="panel-collapse collapse">
                    <ul>
                        <li><a href="<?php echo base_url();?>index.php/admin/add_user"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm Tài Khoản</a></li>
                        <li><a href="<?php echo base_url();?>index.php/admin/get_list_user"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem Tài Khoản</a></li>
                    </ul>
                </div>
            </div>
        <?php
        }
    ?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#me-admin-cs"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Cơ Sở Đào Tạo</a>
            </h4>
        </div>
        <div id="me-admin-cs" class="panel-collapse collapse">
            <ul>
                <li><a href="<?php echo base_url();?>index.php/admin/add_csdt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm Cơ Sở</a></li>
                <li><a href="<?php echo base_url();?>index.php/admin/get_list_csdt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem Cơ Sở</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#me-admin-ndt"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Ngành Đào Tạo</a>
            </h4>
        </div>
        <div id="me-admin-ndt" class="panel-collapse collapse">
            <ul>
                <li><a href="<?php echo base_url();?>index.php/admin/add_ndt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm Ngành Đào Tạo</a></li>
                <li><a href="<?php echo base_url();?>index.php/admin/get_list_ndt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem Ngành Đào Tạo</a></li>
            </ul>
        </div>
    </div>
    <!-- <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#me-admin-thm"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý tổ hợp môn xét tuyển</a>
            </h4>
        </div>
        <div id="me-admin-thm" class="panel-collapse collapse">
            <ul>
                <li><a href="<?php echo base_url();?>index.php/admin/add_thmxt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm tổ hợp môn xét tuyển</a></li>
                <li><a href="<?php echo base_url();?>index.php/admin/get_list_thmxt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem tổ hợp môn xét tuyển</a></li>
            </ul>
        </div>
    </div> -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#me-admin-hsxt"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Hồ Sơ Xét Tuyển</a>
            </h4>
        </div>
        <div id="me-admin-hsxt" class="panel-collapse collapse">
            <ul>
                <li><a href="<?php echo base_url();?>index.php/admin/add_hsxt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm Hồ Sơ Xét Tuyển</a></li>
                <li><a href="<?php echo base_url();?>index.php/admin/get_list_hsxt"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem Hồ Sơ Xét Tuyển</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="<?php echo base_url();?>index.php/admin/get_list_dm"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Danh Mục</a>
            </h4>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#me-admin-bv"><i class="fa fa-user" aria-hidden="true"></i>   Quản lý Bài Viết</a>
            </h4>
        </div>
        <div id="me-admin-bv" class="panel-collapse collapse">
            <ul>
                <li><a href="<?php echo base_url();?>index.php/admin/add_bv"><i class="fa fa-angle-right" aria-hidden="true"></i>  Thêm Bài Viết</a></li>
                <li><a href="<?php echo base_url();?>index.php/admin/get_list_bv"><i class="fa fa-angle-right" aria-hidden="true"></i>  Xem Bài Viết</a></li>
            </ul>
        </div>
    </div>
</div>