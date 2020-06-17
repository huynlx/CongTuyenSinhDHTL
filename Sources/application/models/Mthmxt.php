<?php
class Mthmxt extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function add($mathm,$mandt){
        $this->db->query("insert into to_hop_mon_xet_tuyen(ma_thm,ma_ndt) values('$mathm','$mandt');");
    }
    
    public function countAll(){
        $query=$this->db->query("select * from to_hop_mon_xet_tuyen");
        return $query->num_rows();
    }

    public function getList($start, $size){
        $start = isset($start)? $start : 0;
        $query=$this->db->query("select * from to_hop_mon_xet_tuyen thmxt inner join to_hop_mon thm on thmxt.ma_thm = thm.ma_thm limit $start , $size");
        return $query->result_array();
    }

    public function getById($id){
        $query=$this->db->query("select * from to_hop_mon_xet_tuyen thmxt inner join to_hop_mon thm on thmxt.ma_thm = thm.ma_thm where thmxt.ma_thm = '$id';");
        return $query->row_array();
    }
    public function getListAll(){
        $query=$this->db->query("select * from to_hop_mon_xet_tuyen;");
        return $query->result_array();
    }
}
?>