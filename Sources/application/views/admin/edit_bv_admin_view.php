<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Sửa Bài Viết : <?php echo $bv['ma_bv'];?></b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_edit_bv/' . $bv['ma_bv']); ?>
        <div class="form">
            <table class="table" id = "form_edit_bv">
                <tr><td><p>Lựa chọn danh mục:</p></td>
                    <td><select name="dm" class="form-control">
                        <?php foreach ($listDanhMuc as $row){?>                            
                            <option value="<?php echo $row["ma_dm"]; ?>" <?php if ($bv["ma_dm"] === $row["ma_dm"]) echo "selected"?> ><?php echo $row["ma_dm"] . ": " . $row["ten_dm"]; ?></option>
                            <?php
                        }
                        ?>
                        <!-- <option value="Danh Mục Khác">Danh Mục Khác</option> -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><P>Tiêu đề</p></td>
                    <td><textarea name="td" class="form-control" id="" cols="30" rows="1"><?php echo $bv['tieu_de_bv'];?></textarea></td>
                </tr>
                <tr>
                    <td><P>Nội dung Tóm Tắt</p></td>
                    <td><textarea name="ndtt" class="form-control" id="" cols="30" rows="5"><?php echo $bv['noi_dung_tom_tat_bv'];?></textarea></td>
                </tr>
                <tr>
                    <td><p>Ảnh Bìa: </p></td>
                    <td>
                        <a href="<?php echo base_url() . 'assets/img/bv/'. $bv['link_anh_bia_bv']; ?>" class="btn btn-primary" target="_blank">Xem Ảnh</a>
                        <a class="btn btn-primary" data-toggle="collapse" href="#me-edit-bv" role="button" aria-expanded="false" aria-controls="collapseExample">Chọn ảnh mới</a>                                
                        <input id="me-edit-bv" type="file" name="link" class="form-control collapse">
                    </td>
                </tr> 

                <?php
                    $i = 1;
                    foreach($listCtbv as $row){?>
                        <tr>
                            <td>
                                <input type="button" value="-" class = "delete_ctbv_form_edit_bv"><p>Nội dung chi tiết</p>
                                <textarea name="ndct<?php echo ($i); ?>" class="form-control" id="" cols="30" rows="3"><?php echo $row['noi_dung_chi_tiet_ctbv'];?></textarea>
                            </td>
                            <td>                                
                                <a href="<?php echo base_url() . 'assets/img/bv/'. $row['link_anh_ctbv']; ?>" class="btn btn-primary" target="_blank">Xem Ảnh</a>
                                <a class="btn btn-primary" data-toggle="collapse" href="#me-edit-ctbv<?php echo ($i); ?>" role="button" aria-expanded="false" aria-controls="collapseExample">Chọn ảnh mới</a>                                
                                <input id="me-edit-ctbv<?php echo ($i); ?>" type="file" name="linkct<?php echo ($i); ?>" class="form-control collapse">
                            </td>
                        </tr>
                    <?php
                    $i++;
                    }
                ?>       
                <input id = "count_ctbv_form_edit_bv" type="text" style = "display: none;" value = "<?php echo ($i - 1); ?>" name = "count">                           
            </table>
            <!-- Thêm chi tiết -->
            <input value="Thêm chi tiết" class="btn btn-primary" id = "add_ctbv_form_edit_bv">                  
        </div>
        <div class="col-md-3 form-group pull-right">
            <input type="submit" name="ok" value="Lưu" class="btn btn-primary btn-block" id = "save_form_edit_bv">
        </div>
    </form>
    <?php echo validation_errors();?>
</div>