<?php
	require_once("../include/config.db.php");
	require_once("../include/db.class.php");
	require_once("../include/common.php");
	require_once("../include/log.php");
	error_reporting(E_ERROR);
	header('Content-type:text/json;charset=utf-8'); 
	$db=new db();
	//初始化日志
	$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'notify.log');
	$log = Log::Init($logHandler, 15);
	
	if(isset($_POST['data'])){
		$data=$_POST['data'];
		$postdata="";
		foreach($data as $key => $value){
			$postdata->$value['name']=$value['value'];
		}
		$postdata=object_array($postdata);
		Log::DEBUG("postdata:" . json_encode($postdata));
		Log::DEBUG("tel:" . $postdata['telephone']);
		$checktel=$db->table('marathon')->where(array('telephone'=>$postdata['telephone']))->find();
		if(!$checktel){
			Log::DEBUG("step0:");
			$postdata['ip']=$_SERVER["REMOTE_ADDR"];
			$postdata['createtime']=date('Y-m-d H:m:s', time());
			Log::DEBUG("step1:");
			if(empty($postdata["mileage"])){
				$postdata["mileage"]=0;
			}
			$count=$db->table('marathon')->where(array('type'=>$postdata['type']))->count();
			$setting=$db->table('setting')->where(array('id'=>$postdata['type']))->find();
			//记得改回来<
			if($count>$setting['max']){
				Log::DEBUG("step2:");
				$result=$db->table('marathon')->data($postdata)->insert();
				if($result){
					Log::DEBUG("step3:");
					echo buildJSON(0,'报名成功',$result);
				}else{
					Log::DEBUG("step4:");
					echo buildJSON(1,'系统繁忙，稍后再试');
				}
			}else{
				Log::DEBUG("step5:");
				echo buildJSON(1,'对不起报名人数已达到上限');
			}
		}else{
			Log::DEBUG("step6:");
			Log::DEBUG(buildJSON(1,'该手机号码已经报名！'));
			echo buildJSON(1,'该手机号码已经报名！');
		}
		
	}else{
		echo buildJSON(1,'非法请求！');
	}
?>