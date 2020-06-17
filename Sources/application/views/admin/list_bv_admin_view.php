<div class="col-md-12 col-md-offset-1 me-list-admin">
    <div class="panel panel-default panel-table">
        <div class="panel panel-default panel-table">
            <div class="panel-heading">
                <div class="row">
                    <div class="col col-xs-6">
                        <h3 class="panel-title">Bảng Bài Viết</h3>
                        <form action="<?php echo base_url();?>index.php/admin/get_list_bv_s" method="post" class="form-inline mr-auto">
                            <div class="form-control">
                                <label for="search-field"></label>
                                <input class="form-control search-field" type="text" placeholder="Search.." name="search">
                                <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-bordered table-list">
                <thead>
                <tr>
                    <th><em class="fa fa-cog"></em></th>
                    <th>Mã</th>
                    <th>Tiêu Đề</th>
                    <th>Nội Dung Tóm Tắt</th>
                    <th>Link Ảnh Bìa</th>   
                    <th>Danh Mục</th>                 
                </tr>
                </thead>
                <tbody>
                <?php foreach ($listBV as $row){?>
                    <tr class="w3-animate-left">
                        <td align="center">
                            <a class="btn btn-default" href="<?php echo base_url() . 'index.php/admin/edit_bv/' . $row['ma_bv'];?>"><em class="fa fa-pencil"></em></a>
                            <br>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không');" href="<?php echo base_url() . "index.php/admin/delete_bv/" . $row['ma_bv'];?>"><em class="fa fa-trash"></em></a>
                        </td>
                        <td><?php echo $row['ma_bv'];?></td>
                        <td><?php echo $row['tieu_de_bv'];?></td>
                        <td><?php
                            echo substr($row['noi_dung_tom_tat_bv'],0,70) . "  ...";
                            ?></td>
                        <td><?php echo $row['link_anh_bia_bv'];?></td>
                        <td><?php echo $row['ten_dm'];?></td>
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