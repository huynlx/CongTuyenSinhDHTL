<?php
class Mndt extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function countAll(){
        $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt on ndt.ma_csdt = csdt.ma_csdt;");
        return $query->num_rows();
    }

    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt on ndt.ma_csdt = csdt.ma_csdt limit $start , $size");
        return $query->result_array();
    }

    public function deleteById($id){
        $this->db->query("delete from nganh_dao_tao where ma_ndt = '$id';");
    }

    public function add($manganh,$tennganh, $chuongtrinhdaotao, $ghichu, $gioithieu, $coso){
        $this->db->query("insert into nganh_dao_tao(ma_ndt,ten_ndt, chuong_trinh_dao_tao_ndt, ghi_chu_ndt, gioi_thieu_ndt,ma_csdt) values('$manganh','$tennganh','$chuongtrinhdaotao','$ghichu','$gioithieu','$coso');");
        // $data=$this->db->query("select id_dd from dia_diem dd where id_dd >= all (select id_dd from dia_diem);")->row_array();
        // $id=$data['id_dd'];
        // $this->db->query("insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd, loai) values($id,'$td','$nd','$loai');");
    }
    public function edit($id,$manganh, $tennganh, $chuongtrinhdaotao, $ghichu, $gioithieu, $coso){
        $this->db->query("update nganh_dao_tao set ma_ndt='$manganh' , ten_ndt = '$tennganh', chuong_trinh_dao_tao_ndt = '$chuongtrinhdaotao', ghi_chu_ndt= '$ghichu' , gioi_thieu_ndt='$gioithieu',ma_csdt= '$coso' where ma_ndt = '$id';");
        
    }
    public function getById($id){
        $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt on ndt.ma_csdt = csdt.ma_csdt where ndt.ma_ndt = '$id';");
        return $query->row_array();
    }

    public function getListS($start, $size, $s){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt 
        on ndt.ma_csdt = csdt.ma_csdt where ndt.ten_ndt like '%$s%' OR ndt.ma_ndt 
        like '%$s%' limit $start , $size");
        return $query->result_array();
    }

    public function countAllS($s){
        $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt 
        on ndt.ma_csdt = csdt.ma_csdt where ndt.ten_ndt like '%$s%' OR ndt.ma_ndt like '%$s%';");
        return $query->num_rows();
    }
    
    public function getListAll(){
        $query=$this->db->query("select * from nganh_dao_tao;");
        return $query->result_array();
    }
}
?>