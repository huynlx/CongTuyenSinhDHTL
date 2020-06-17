<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Thêm Cơ sở đào tạo</b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_add_csdt'); ?>
        <div class="form">
            <table class="table">
               
               
               
                
                <table class="table">
                <tr>
                    <td><P>Tên cơ sở đào tạo:</p></td>
                    <td><textarea name="tencsdt" class="form-control" id="" cols="30" rows="1"></textarea></td>
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
                    <td><textarea name="phuongthixacsdt" class="form-control" id="" cols="30" rows="1"></textarea></td>
                </tr>
                <tr>
                    <td><P>Thôn/bản/đường phố:</p></td>
                    <td><textarea name="thonbanduongphocsdt" class="form-control" id="" cols="30" rows="1"></textarea></td>
                </tr>
            </table>
                
            </table>
        </div>
        <div class="col-md-3 form-group pull-right">
            <input type="submit" name="ok" value="Thêm" class="btn btn-primary btn-block">
        </div>
    </form>
    <?php echo validation_errors();?>
</div>