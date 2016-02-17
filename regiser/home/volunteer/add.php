<?php
header('Content-type:text/json;charset=utf-8'); 
require_once 'lib/config.db.php';
require_once 'lib/db.class.php';
$db=new db();
$data=$_POST;
$data['createtime']=date('Y-m-d H:m:s', time());
$checkphone=$db->table('volunteer')->where('phone="'.$data['phone'].'"')->find();
if(!$checkphone){
	$result=$db->table('volunteer')->data($data)->insert();
	if($result){
		echo json_encode(array(
			'status'=>1,
			'msg'=>'报名成功！请等待通知！'
		));
	}else{
		echo json_encode(array(
			'status'=>1,
			'msg'=>'报名失败！系统故障'
		));
	}
}else{
	echo json_encode(array(
		'status'=>0,
		'msg'=>'你已经使用该电话号码报过名了！'
	));
}

?>
