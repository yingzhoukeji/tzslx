<?php
namespace Admin\Model;
use Think\Model;
class MarathonModel extends Model {
    
	public function listMarathon1($name='',$firstRow = 0, $listRows = 100){
		if($_GET['isteam']=='all'){
			$mydata=array();
			if(!empty($_GET['name'])){
				$mydata['name']=$_GET['name'];
			}
			if(!empty($_GET['teamname'])){
				$mydata['teamname']=$_GET['teamname'];
			}
			$M = M("Marathon");
			$list = $M->order("id DESC")->where($mydata)->limit("$firstRow , $listRows")->select();
			
			return $list;
		}else if(!isset($_GET['isteam'])){
			$M = M("Marathon");
			$list = $M->order("id DESC")->limit("$firstRow , $listRows")->select();
			return $list;
		}
		else{
			$mydata=array();
			$mydata['isteam']=$_GET['isteam'];
			if(!empty($_GET['name'])){
				$mydata['name']=$_GET['name'];
			}
			if(!empty($_GET['teamname'])){
				$mydata['teamname']=$_GET['teamname'];
			}
			$M = M("Marathon");
			$list = $M->order("id DESC")->where($mydata)->limit("$firstRow , $listRows")->select();
			
			return $list;
		}
		
		
	}
	public function editMarathon(){
		$M = M("Marathon");
		$data=$_POST;
		$arr='';
		//$arr=$data;
		if($M->save($data)){
			$arr=array('status' => 1, 'info' => '更新成功！','url' =>'');
		}else{
			$arr=array('status' => 0, 'info' => "更新失败！","sql"=>$M->getLastSql());
		}
		return $arr;
	}
	
	public function paylist($firstRow = 0, $listRows = 100){
		$M = M("Marathon");
		$mydata['type']=$_GET['type'];
		$mydata['ispay']=1;
		$list = $M->order("id DESC")->where($mydata)->limit("$firstRow , $listRows")->select();
		return $list;
	}
	public function excel(){
		
	}
}

?>
