<?php
class Mbv extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function countAll(){
        $query=$this->db->query("select * from bai_viet;");
        return $query->num_rows();
    }

    public function getListAll(){
        $query=$this->db->query("select * from bai_viet;");
        return $query->result_array();
    }

    public function getListByMaDM($ma_dm){
        $query=$this->db->query("select * from bai_viet where ma_dm = '$ma_dm'");
        return $query->result_array();
    }

    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from bai_viet bv inner join danh_muc dm on bv.ma_dm = dm.ma_dm limit $start, $size;");
        return $query->result_array();
    }

    public function deleteByMaBV($ma_bv){
        $this->db->query("delete from bai_viet where ma_bv = $ma_bv;");
    }

    public function add($dm, $td, $ndtt, $link){
        $this->db->query("INSERT INTO bai_viet (ma_dm, tieu_de_bv, noi_dung_tom_tat_bv, link_anh_bia_bv) VALUES ('$dm', '$td', '$ndtt', '$link');");
    }

    public function getByMaBV($ma_bv){
        $query=$this->db->query("select * from bai_viet where ma_bv = $ma_bv");
        return $query->row_array();
    }

    public function edit($ma_bv, $td, $ndtt, $link, $dm){
        $this->db->query("update bai_viet set tieu_de_bv = '$td', noi_dung_tom_tat_bv = '$ndtt', link_anh_bia_bv = '$link', ma_dm = '$dm' where ma_bv = $ma_bv;");
    }

    public function countAllS($s){
        $query=$this->db->query("select * from bai_viet bv inner join danh_muc dm on bv.ma_dm = dm.ma_dm where bv.tieu_de_bv like '%$s%' OR bv.noi_dung_tom_tat_bv like '%$s%' OR dm.ten_dm like '%$s%';");
        return $query->num_rows();
    }

    public function getListS($start, $size, $s){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from bai_viet bv inner join danh_muc dm on bv.ma_dm = dm.ma_dm where bv.tieu_de_bv like '%$s%' OR bv.noi_dung_tom_tat_bv like '%$s%' OR dm.ten_dm like '%$s%' limit $start , $size");
        return $query->result_array();
    }

    public function getMaxMaBV()
    {
        $query=$this->db->query("select ma_bv from bai_viet order by ma_bv desc limit 1");
        return $query->result_array();
    }
}
?>