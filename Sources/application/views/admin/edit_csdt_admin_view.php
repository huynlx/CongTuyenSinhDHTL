<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Sửa cơ sở đào tạo : <?php echo $csdt['ma_csdt'];?></b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_edit_csdt/' . $csdt['ma_csdt']); ?>
        <div class="form">
            <table class="table">
            <tr>
                    <td><P>Tên cơ sở đào tạo:</p></td>
                    <td><textarea name="tencsdt" class="form-control" id="" cols="30" rows="1"><?php echo $csdt['ten_csdt'];?></textarea></td>
                </tr>
                <tr>
                    <td><p>Tỉnh/TP:</p></td>
                    <td>
                    
                    <select id="seltinhthanhphocsdt" name="tinhthanhphocsdt" class="form-control">
                    <option value="">Chọn tỉnh thành phố</option>
                            
                        </select>
                        <!-- <select id="sel">
        <option value="">Chọn tỉnh thành phố</option> -->
                        <!-- </select> -->
                    </td>
                </tr>
                <tr>
                    <td><p>Quận/huyện:</p></td>
                    <td><select id="selquanhuyencsdt" name="quanhuyencsdt" class="form-control">
                    <option value="">Chọn quận huyện</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><P>Xã/phường:</p></td>
                    <td><textarea name="phuongthixacsdt" class="form-control" id="" cols="30" rows="1"><?php echo $csdt['dia_chi_xa_phuong'];?></textarea></td>
                </tr>
                <tr>
                    <td><P>Thôn/bản/đường phố:</p></td>
                    <td><textarea name="thonbanduongphocsdt" class="form-control" id="" cols="30" rows="1"><?php echo $csdt['dia_chi_thon_ban_duong_pho'];?></textarea></td>
                </tr>
                <!-- <tr>
                    <td><p>Lựa chọn cơ sở</p></td>

                    <td><select name="coso" class="form-control">
                            <option value="1" selected>Cơ sở 1</option>
                            <option value="2" 
                            
                            <?php if ($csdt['ma_csdt'] === "2") echo "selected"?>
                            >Cơ sở 2</option>
                            <option value="3" 
                            
                            
                            <?php if ($csdt['ma_csdt'] === "3") echo "selected"?>>Cơ sở 3</option>
                        </select>
                    </td>
                   
                </tr> -->
            </table>
        </div>
        <div class="col-md-3 form-group pull-right">
            <input type="submit" name="ok" value="Lưu" class="btn btn-primary btn-block">
        </div>
    </form>
</div>