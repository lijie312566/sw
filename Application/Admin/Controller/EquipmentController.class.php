<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
/**
 * 后台首页控制器
 */
class EquipmentController extends AdminBaseController{
	/**
	 * 设备列表页
	 */
	public function index(){
		$where['company_id'] = $_SESSION['user']['id'];
		if($_SESSION['user']['identity']==1){
			$equipment = $this -> select_where_data('equipment');
		}else{
			$equipment = $this -> select_where_data('equipment',$where);
		}
		if($_SESSION['user']['identity'] == 3){
			$w['id'] = $_SESSION['user']['id'];
			$getField = $this -> getField_where_data('user',$w,'equipment_id');
			$data['id'] = array('in',$getField);
			$equipment = $this -> select_where_data('equipment',$data);
		}

		$user = $this -> select_where_data('user',$where);
		$this->assign('user',$user);
		$this->assign('data',$equipment);
		$this->display();

	}

	//添加设备
	public function dataadd(){
		$map=I('post.');
		if(!empty($map['user_id'])){
			$map['telephone'] = implode(",", $map['user_id']);
		}
		$map['time'] = time();
		$map['company_id'] = $_SESSION['user']['id'];
		$data = $this -> add_data('equipment',$map);
		if(!empty($map['user_id'])){
			$telephone['id'] = array('in',$map['telephone']);
			$getfield = $this ->select_where_data('user',$telephone);
			foreach($getfield as $k => $v){
				$where['id'] = $v['id'];
				if(!empty($v['equipment_id'])){
					$telep['equipment_id'] = $v['equipment_id'].','.$data;
				}else{
					$telep['equipment_id'] = $data;
				}
				$this -> save_where_data('user',$where,$telep);
			}
		}

		if($data){
			$this->success('添加设备成功','index');
		}else{
			$this->error('新增失败');
		}
	}

}
