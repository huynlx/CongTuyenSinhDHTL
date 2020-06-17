<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Home extends CI_Controller{
    public function __construct() {
        parent::__construct();
    }

    public function index()
	{
        $this->load->view('site/home/index');
    }
    
    public function lienhe(){
        $this->load->view("site/lienhe/index");
    }

    public function tbxt(){
        $this->load->view('site/thongbaoxettuyen/index');
    }

    public function ttnxt(){
        $this->load->view('site/thongtinnganhxettuyen/index');
    }

    public function ttxt(){
        $this->load->view('site/thongtinxettuyen/index');
    }

    public function tvts(){
        $this->load->view('site/tuvantuyensinh/index');
    }

    public function xhb(){
        $this->load->view('site/xethocbaonline/index');
    }
    public function xhb2(){
        $this->load->view('site/xethocbaonline/themnguyenvong');
    }
    public function xhb3(){
        $this->load->view('site/xethocbaonline/noptailieu');
    }
    public function login_mb(){
        $this->load->view('site2/Login_moblie/index');
    }
    
    public function checkLogin(){
        $tk = isset($_POST['tk']) ? $_POST['tk'] : "";
        $mk = isset($_POST['mk']) ? $_POST['mk'] : "";
        $this->load->model("Muser");
        if ($this->Muser->checkLogin($tk, $mk) && $tk != "" && $mk != ""){
            //Đăng Nhập Thành Công
            $this->session->set_userdata("CheckLogin", true);
            $data['infLogin'] = $this->Muser->infLogin($tk, $mk);
            $this->session->set_userdata($data['infLogin']);
            redirect(base_url() . "index.php/admin");
        }
        else{
            //Đăng Nhập Thất Bại
            echo "<script>alert('Tài Khoản Hoặc Mật Khẩu Không Đúng !!!');</script>";
            $this->index();
        }
    }

    public function logout(){
        $this->session->sess_destroy();
        redirect(base_url());
    }

    public function ttcn($id){
        $this->load->model("Muser");
        $data['user'] = $this->Muser->getById($id);
        $this->load->view('admin/s_ttcn_admin_view', $data);
    }

    public function pro_ttcn($id){
        //Kiểm tra bằng form validation
        $this->load->library('form_validation');
        $this->form_validation->set_rules('mk', 'Mật Khẩu', 'required');
        $this->form_validation->set_rules('gt', 'Giới Tính', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('sdt', 'Số Điện Thoại', 'numeric');
        if($this->form_validation->run() == FALSE){
            $this->ttcn($id);
        }
        else{
            $mk = isset($_POST['mk']) ? $_POST['mk'] : "";
            $ht = isset($_POST['ht']) ? $_POST['ht'] : "";
            $gt = isset($_POST['gt']) ? $_POST['gt'] : "Nam";
            $email = isset($_POST['email']) ? $_POST['email'] : "";
            $ns = isset($_POST['ns']) ? $_POST['ns'] : "";
            $dc = isset($_POST['dc']) ? $_POST['dc'] : "";
            $sdt = isset($_POST['sdt']) ? $_POST['sdt'] : "";
            $this->load->model("Muser");
            $this->Muser->edit($id, $mk, $ht, $gt, $email, $ns, $dc, $sdt);
            $data['infLogin'] = $this->Muser->getById($id);
            $this->session->set_userdata($data['infLogin']);
            $this->ttcn($id);
        }
    }

    public function register(){
        $this->load->view('site/s_register_site_view');
    }

    public function pro_register(){
        //Kiểm tra bằng form validation
        $this->load->library('form_validation');
        $this->form_validation->set_rules('tk', 'Tên Đăng Nhập', 'required');
        $this->form_validation->set_rules('mk', 'Mật Khẩu', 'required');
        $this->form_validation->set_rules('gt', 'Giới Tính', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('sdt', 'Số Điện Thoại', 'numeric');
        if($this->form_validation->run() == FALSE){
            echo "<script>alert('Lỗi Nhập !!!');</script>";
            $this->register();
        }
        else{
            try{
                $tk = isset($_POST['tk']) ? $_POST['tk'] : "";
                $mk = isset($_POST['mk']) ? $_POST['mk'] : "";
                $ht = isset($_POST['ht']) ? $_POST['ht'] : "";
                $gt = isset($_POST['gt']) ? $_POST['gt'] : "Nam";
                $email = isset($_POST['email']) ? $_POST['email'] : "";
                $ns = isset($_POST['ns']) ? $_POST['ns'] : "";
                $dc = isset($_POST['dc']) ? $_POST['dc'] : "";
                $sdt = isset($_POST['sdt']) ? $_POST['sdt'] : "";
                $this->load->model("Muser");
                $this->Muser->add($tk, $mk, $ht, $gt, $email, $ns, $dc, $sdt);
                echo "<script>alert('Đăng Ký Thành Công !!!');</script>";
                $this->index();
            }
            catch(Exception $e){
                echo "<script>alert('Lỗi Tài Khoản Đã Tồn Tại !!!');</script>";
                $this->register();
            }
        }
    }

    public function get_list_search(){
        $s = isset($_POST['s_search']) ? $_POST['s_search'] : "";
        $s = trim(htmlspecialchars(addslashes($s)));
        $this->load->view("site/s_search_site_view", $data);
    }

}