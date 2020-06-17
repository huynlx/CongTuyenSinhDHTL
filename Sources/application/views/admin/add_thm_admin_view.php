<div class="content">
    <div class="col-md-6 add-dm">
        <h4 class="text-center"><b>Thêm tổ hợp môn xét tuyển</b></h4>
    </div>
    <?php echo form_open_multipart('/admin/pro_add_thmxt'); ?>
        <div class="form">
            <table class="table">
            <tr>
                    <td><P>Mã ngành</p></td>
                    <td>
                    <select name="mandt" class="form-control">
                        <?php foreach ($listNdt as $row){?>                            
                            <option value="<?php echo $row["ma_ndt"]; ?>"><?php echo $row["ma_ndt"];?></option>
                            <?php
                        }
                        ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><P>Tên ngành</p></td>
                    <td>
                    <select name="tennganh" class="form-control">
                        <?php foreach ($listNdt as $row){?>                            
                            <option value="<?php echo $row["ten_ndt"]; ?>"><?php echo $row["ten_ndt"];?></option>
                            <?php
                        }
                        ?>
                        </select>
                    
                    </td>
                </tr>
                <tr>
                    <td><P>Mã tổ hợp môn</p></td>
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
            <input type="submit" name="ok" value="Thêm" class="btn btn-primary btn-block">
        </div>
    </form>
    <?php echo validation_errors();?>
</div>