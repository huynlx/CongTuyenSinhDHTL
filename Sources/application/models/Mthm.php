<?php
class Mthm extends CI_Model{
    public function __construct(){
        parent::__construct();
    }
    public function getListAll(){
        $query=$this->db->query("select * from to_hop_mon;");
        return $query->result_array();
    }
}
?>