<?php
class Mcsdt extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function countAll(){
        $query=$this->db->query("select * from co_so_dao_tao csdt ");
        return $query->num_rows();
    }
//inner join phuong_thi_xa ptx on csdt.dia_chi_csdt = ptx.ma_ptx inner join quan_huyen qh on ptx.ma_qh = qh.ma_qh inner join tinh_thanh_pho ttp on qh.ma_ttp = ttp.ma_ttp  
    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from co_so_dao_tao csdt limit $start , $size");
        return $query->result_array();
    }

    public function deleteById($id){
        $this->db->query("delete from co_so_dao_tao where ma_csdt = $id;");
    }

    public function add($tencsdt,  $tinhthanhphocsdt, $quanhuyencsdt, $phuongthixacsdt, $thonbanduongphocsdt){
        $this->db->query("insert into co_so_dao_tao(ten_csdt, dia_chi_tinh_thanh_pho, dia_chi_quan_huyen, dia_chi_xa_phuong, dia_chi_thon_ban_duong_pho)  values('$tencsdt','$tinhthanhphocsdt','$quanhuyencsdt', '$phuongthixacsdt', '$thonbanduongphocsdt ');");
        // $data=$this->db->query("select id_dd from dia_diem dd where id_dd >= all (select id_dd from dia_diem);")->row_array();
        // $id=$data['id_dd'];
        // $this->db->query("insert into ctdd(id_dd,tieu_de_dd, noi_dung_dd, loai) values($id,'$td','$nd','$loai');");
    }
    public function edit($id,$tencsdt, $tinhthanhphocsdt, $quanhuyencsdt, $phuongthixacsdt, $thonbanduongphocsdt){
        $this->db->query("update co_so_dao_tao set ten_csdt = '$tencsdt', dia_chi_tinh_thanh_pho = '$tinhthanhphocsdt', dia_chi_quan_huyen= '$quanhuyencsdt' , dia_chi_xa_phuong='$phuongthixacsdt',dia_chi_thon_ban_duong_pho= '$thonbanduongphocsdt' where ma_csdt = $id;");
        
    }
    public function getById($id){
        $query=$this->db->query("select * from co_so_dao_tao csdt where csdt.ma_csdt = $id;");
        return $query->row_array();
    }

    // public function getListS($start, $size, $s){
    //     $start = isset($start)? $start : 0;
    //     $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt 
    //     on ndt.ma_csdt = csdt.ma_csdt where ndt.ten_ndt like '%$s%' OR ndt.ma_ndt 
    //     like '%$s%' limit $start , $size");
    //     return $query->result_array();
    // }

    // public function countAllS($s){
    //     $query=$this->db->query("select * from nganh_dao_tao ndt inner join co_so_dao_tao csdt 
    //     on ndt.ma_csdt = csdt.ma_csdt where ndt.ten_ndt like '%$s%' OR ndt.ma_ndt like '%$s%';");
    //     return $query->num_rows();
    // }

    public function getListAll(){
        $query=$this->db->query("select * from co_so_dao_tao;");
        return $query->result_array();
    }
    
}
?>