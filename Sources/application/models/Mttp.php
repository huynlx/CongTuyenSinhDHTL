<?php
class Mttp extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function countAll(){
        $query=$this->db->query("select * from cam_nang;");
        return $query->num_rows();
    }

    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from quan_huyen limit $start, $size;");
        return $query->result_array();
    }

    public function getListAll(){
        $query=$this->db->query("select * from tinh_thanh_pho;");
        return $query->result_array();
    }

    public function getByID($id){
        $query=$this->db->query("select * from cam_nang where id_cn = $id");
        return $query->row_array();
    }

    public function deleteById($id){
        $this->db->query("delete from cam_nang where id_cn = $id;");
    }

    public function getListRad($start, $size){
        $start = isset($start)? $start : 0;
        $query = $this->db->query("select * from cam_nang order by rand() limit $start, $size;");
        return $query->result_array();
    }

    public function countAllS($s){
        $query=$this->db->query("select * from cam_nang where tieu_de_cn like '%$s%' OR noi_dung_cn like '%$s%';");
        return $query->num_rows();
    }

    public function getListS($start, $size, $s){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from cam_nang where tieu_de_cn like '%$s%' OR noi_dung_cn like '%$s%' limit $start , $size");
        return $query->result_array();
    }

    public function add($td, $nd, $link){
        $this->db->query("insert into cam_nang(id_tk, tieu_de_cn, noi_dung_cn, link_cn) values (1,'$td','$nd','$link');");
    }

    public function edit($id, $td, $nd, $link){
        $this->db->query("update cam_nang set tieu_de_cn = '$td', noi_dung_cn = '$nd', link_cn = '$link' where id_cn = $id;");
    }

}
?>