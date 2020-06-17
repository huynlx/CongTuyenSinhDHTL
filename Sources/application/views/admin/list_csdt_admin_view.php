<div class="col-md-12 col-md-offset-1 me-list-admin">
    <div class="panel panel-default panel-table">
        <div class="panel panel-default panel-table">
            <div class="panel-heading">
                <div class="row">
                    <div class="col col-xs-6">
                        <h3 class="panel-title">Bảng cơ sở đào tạo đào tạo</h3>
                        <!-- <form action="<?php //echo base_url();?>index.php/admin/get_list_csdt_s" method="post" class="form-inline mr-auto">
                            <div class="form-control">
                                <label for="search-field"></label>
                                <input class="form-control search-field" type="text" placeholder="Tìm kiếm.." name="search">
                                <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form> -->
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-body">
            <table class="table table-striped table-bordered table-list">
                <thead>
                <tr>
                    <th><em class="fa fa-cog"></em></th>
                    <th>Mã cơ sở</th>
                    <th>Tên cơ sở</th>
                    <th>Tỉnh/TP </th>
                    <th>Quận/huyện</th>
                    <th>Xã/phường </th>
                    <th>Thôn/bản/đường phố</th>
                    
                </tr>
                </thead>
                <tbody>
                <?php 
                foreach ($listCsdt as $row){?>
                
                    <tr class="w3-animate-left">
                        <td align="center">
                            <a class="btn btn-default" href="<?php echo base_url();?>index.php/admin/edit_csdt/<?php echo $row['ma_csdt'];?>"><em class="fa fa-pencil"></em></a>
                            <br>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không');" href="<?php echo base_url();?>index.php/admin/delete_csdt/<?php echo $row['ma_csdt'];?>"><em class="fa fa-trash"></em></a>
                        </td>
                        <td><?php echo $row['ma_csdt'];?></td>
                        <td><?php echo $row['ten_csdt'];?></td>
                        <td><?php echo $row['dia_chi_tinh_thanh_pho'];?></td>
                        <td><?php echo $row['dia_chi_quan_huyen'];?></td>
                        <td><?php echo $row['dia_chi_xa_phuong'];?></td>
                        <td><?php echo $row['dia_chi_thon_ban_duong_pho'];?></td>
                        
                    </tr>
                <?php
                }
                ?>
                </tbody>
            </table>
        </div>
        <div class="list123">
            <?php echo $this->pagination->create_links();?>
        </div>
    </div>
</div>