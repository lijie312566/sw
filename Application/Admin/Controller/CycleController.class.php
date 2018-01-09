<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
/**
 * 后台首页控制器
 */
class CycleController extends AdminBaseController{


//	public function __construct(){
//
//	}
	/**
	 * 设备API
	 */
	
	// 找出数组中小于某个数的最大的元素
	protected function getMaxTime($arr, $time){
	    rsort($arr, SORT_NUMERIC );
	    $end = end($arr);
	    foreach($arr as $v){
	       if($v > $time){
	           if($v != $end){
                   continue;
               }else{
	               return 0;// 没有符合条件数据
               }
           }else{
	           return $v;
           }
        }
    }


	public function index(){
	    $start = I('param.starting_point', 0 , 'strtotime');// 查询开始时间
	    $end = I('param.end', 0, 'strtotime');// 查询结束时间
	    $step = I('param.interval', 0, 'intval');// 间隔
	    $type = I('param.time', 2, 'intval');// 间隔单位，1 时，2 分，3 秒
        $unit = [1=>3600, 2=>60, 3=>1];
        $stepSeconds  = $step * $unit[$type];
        $data = M('cycle')->where(['addtime'=>['between', [$start, $end]]])->order('time')->field('device_sn,time,concentration,electricity,temperature,humidity')->select();
		$device = [];
        foreach($data as $v ){
            $device[$v['device_sn']][$v['time']] = $v;
        }
        $default = ['concentration'=>0,'electricity'=>0,'temperature'=>0,'humidity'=>0];
        for($i = $start;$i<=$end;$i = $i + $stepSeconds){
            foreach($device as $deviceSn => $dev){
                $allTime = array_keys($dev);// 每个设备的所有采集时间节点
                $time = $this->getMaxTime($allTime, $i);
				$date =date('Y-m-d H:i:s', $i);
                $list[$date][$deviceSn] = $time == 0 ? $default : $dev[$time];
            }
        }
		$arrayshift = array_shift($list);
		$this->assign('arrayshift',$arrayshift);
		$this->assign('data',$list);
		$this->display();




	}


	public function add(){

		$this->display();
	}

	public function updateDevice(){
		$map=I('post.');
		$map['time']=time();
		$where['device_sn']=$map['device_sn'];//设备编码
		$data = $this -> find_admin_where_data('equipment',$where);

		if(empty($data)){
			$map['company_id']=500001;
			$this -> add_data('equipment',$map);
		}{
			$this ->save_where_data('equipment',$where,$map);
		}

		$this -> add_data('cycle',$map);
	}






}
