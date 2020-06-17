<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Sửa tổ hợp môn xét tuyển : <?php echo $thmxt['ma_thm'];?></b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_edit_thmxt/' . $thmxt['ma_thm']); ?>
        <div class="form">
            <table class="table">
            <tr><td><P>Mã ngành</p></td>
                    <td>
                    
                    <!-- <textarea name="manganh" class="form-control" id="" cols="30" rows="1"><?php echo $thmxt['ma_ndt'];?></textarea> -->
                    <select name="mathm" class="form-control">
                        <?php foreach ($listNdt as $row){?>                            
                            <option value="<?php echo $row["ma_ndt"]; ?>"><?php echo $row["ma_ndt"];?></option>
                            <?php
                        }
                        ?>
                        </select>
                    
                    
                    </td>
                </tr>
               
                    <td><p>Lựa chọn tổ hợp môn</p></td>

                    <td>

                    <select name="mathm" class="form-control">
                        <?php foreach ($listThm as $row){?>                            
                            <option value="<?php echo $row["ma_thm"]; ?>"><?php echo $row["ma_thm"] . ": " . $row["ten_mon_1"]. " ". $row["ten_mon_2"]. " ".$row["ten_mon_3"];?></option>
                            <?php
                        }
                        ?>
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