<div class="col-md-12 col-md-offset-1 me-list-admin">
    <div class="panel panel-default panel-table">
        <div class="panel panel-default panel-table">
            <div class="panel-heading">
                <div class="row">
                    <div class="col col-xs-6">
                        <h3 class="panel-title">Bảng thông tin tổ hợp môn xét tuyển</h3>
                        <!-- <form action="<?php echo base_url();?>index.php/admin/get_list_thmxt_s" method="post" class="form-inline mr-auto">
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
                    <th>Mã ngành</th>
                    <th>Mã tổ hợp môn</th>
                    <th>Tên môn 1</th>
                    <th>Tên môn 2</th>
                    <th>Tên môn 3</th>

                </tr>
                </thead>
                <tbody>
                <?php 
                foreach ($listThmxt as $row){?>
                
                    <tr class="w3-animate-left">
                        <td align="center">
                            <a class="btn btn-default" href="<?php echo base_url();?>index.php/admin/edit_thmxt/<?php echo $row['ma_thm'];?>"><em class="fa fa-pencil"></em></a>
                            <br>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa không');" href="<?php echo base_url();?>index.php/admin/delete_thmxt/<?php echo $row['ma_thm'];?>"><em class="fa fa-trash"></em></a>
                        </td>
                        <td><?php echo $row['ma_ndt'];?></td>
                        <td><?php echo $row['ma_thm'];?></td>
                        <td><?php echo $row['ten_mon_1'];?></td>
                        <td><?php echo $row['ten_mon_2'];?></td>
                        <td><?php echo $row['ten_mon_3'];?></td>
                        
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