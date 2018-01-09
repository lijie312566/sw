<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
/**
 * 商城首页Controller
 */
class IndexController extends HomeBaseController{
	/**
	 * 首页
	 */
	public function index(){
        if(IS_POST){
            // 做一个简单的登录 组合where数组条件 
            $map=I('post.');
            $map['password']=md5($map['password']);
            $username['username']=$map['username'];
            $admin =$this->Entrance('admin',$username);
            if(!empty($admin)){
                $this->logina($map,'admin');
            }
            $user =$this->Entrance('user',$username);
            if(!empty($user)){

                $this->logina($map,'user');
            }
            $company =$this->Entrance('company',$username);
            if(!empty($company)){

                $this->logina($map,'company');
            }


        }else{
            $data=check_login() ? $_SESSION['user']['username'].'已登录' : '未登录';
            $assign=array(
                'data'=>$data
                );
            $this->assign($assign);
            $this->display();
        }
	}

    /**
     * 退出
     */
    public function logout(){
        session('user',null);
        $this->success('退出成功、前往登录页面',U('Home/Index/index'));
    }



    public function logina($map,$table){
        $data=M($table)->where($map)->find();
        if (empty($data)) {
            $this->error('账号或密码错误');
        }else{
            $_SESSION['user']=array(
                'id'=>$data['id'],
                'username'=>$data['username'],
                'identity'=>$data['identity'],
                'avatar'=>$data['avatar'],
                'email'=>$data['email'],
                'phone'=>$data['phone'],
                'ip'=>get_client_ip(1)
            );
            $this->success('登录成功、前往管理后台',U('Admin/Index/index'));
        }
    }
    public function Entrance($table,$post){
        $data = M($table)->where($post)->select();
        return $data;
    }

}

