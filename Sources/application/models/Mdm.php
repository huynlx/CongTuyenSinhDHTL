<?php
class Mdm extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function countAll(){
        $query=$this->db->query("select * from danh_muc;");
        return $query->num_rows();
    }

    public function getListAll(){
        $query=$this->db->query("select * from danh_muc;");
        return $query->result_array();
    }

    public function getListWithout($ma_dm){
        $query=$this->db->query("select * from danh_muc where ma_dm <> '$ma_dm';");
        return $query->result_array();
    }

    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from danh_muc limit $start, $size;");
        return $query->result_array();
    }

    public function add($ma, $ten, $ma_cha){
        $this->db->query("INSERT INTO danh_muc VALUES ('$ma', '$ten', '$ma_cha');");
    }

    public function getByMaDM($ma_dm){
        $query=$this->db->query("select * from danh_muc where ma_dm = '$ma_dm'");
        return $query->row_array();
    }

    public function getByMaDMCha($ma_dm_cha){
        $query=$this->db->query("select * from danh_muc where ma_dm_cha = '$ma_dm_cha'");
        return $query->result_array();
    }

    public function edit($ma_dm, $ten, $ma_cha){
        $this->db->query("update danh_muc set ten_dm = '$ten', ma_dm_cha = '$ma_cha' where ma_dm = '$ma_dm';");
    }

    public function deleteByMaDM($ma_dm){
        $this->db->query("delete from danh_muc where ma_dm = '$ma_dm';");
    }
}
?>