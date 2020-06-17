<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Sửa Ngành Đào tạo : <?php echo $ndt['ma_ndt'];?></b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_edit_ndt/' . $ndt['ma_ndt']); ?>
        <div class="form">
            <table class="table">
            <tr><td><P>Mã ngành</p></td>
                    <td><textarea name="manganh" class="form-control" id="" cols="30" rows="1"><?php echo $ndt['ma_ndt'];?></textarea></td>
                </tr>
                <tr><td><P>Tên ngành</p></td>
                    <td><textarea name="tennganh" class="form-control" id="" cols="30" rows="1"><?php echo $ndt['ten_ndt'];?></textarea></td>
                </tr>
                <tr>
                <td><P>Chương trình đào tạo</p></td>
                    <td><textarea name="chuongtrinhdaotao" class="form-control" id="" cols="30" rows="10"><?php echo $ndt['chuong_trinh_dao_tao_ndt'];?></textarea></td>
                </tr>
                <tr>
                <td><P>Ghi chú</p></td>
                    <td><textarea name="ghichu" class="form-control" id="" cols="30" rows="10"><?php echo $ndt['ghi_chu_ndt'];?></textarea></td>
                </tr>
                <tr>
                    <td><P>Giới thiệu</p></td>
                    <td><textarea name="gioithieu" class="form-control" id="" cols="30" rows="1"><?php echo $ndt['gioi_thieu_ndt'];?></textarea></td>
                </tr>
                
                <tr>
                    <td><p>Lựa chọn cơ sở</p></td>

                    <!-- <td><select name="coso" class="form-control">
                            <option value="1" selected>Cơ sở 1</option>
                            <option value="2" <?php if ($ndt['ma_csdt'] === "2") echo "selected"?>>Cơ sở 2</option>
                            <option value="3" <?php if ($ndt['ma_csdt'] === "3") echo "selected"?>>Cơ sở 3</option>
                        </select> -->
                        <td>
                        <select name="coso" class="form-control">
                        <?php foreach ($listCoSoDaoTao as $row){?>                            
                            <option value="<?php echo $row["ma_csdt"]; ?>"><?php echo $row["ma_csdt"] . ": " . $row["ten_csdt"]; ?></option>
                            <?php
                        }
                        ?>
                        <!-- <option value="Cơ sở khác">Cơ sở khác</option> -->
                        </select>
                    </td>
                   
                </tr>
            </table>
        </div>
        <div class="col-md-3 form-group pull-right">
            <input type="submit" name="ok" value="Lưu" class="btn btn-primary btn-block">
        </div>
    </form>
</div>