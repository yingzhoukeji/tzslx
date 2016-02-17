<?php
	require_once("../include/config.db.php");
	require_once("../include/db.class.php");
	require_once("../include/common.php");
	header('Content-type:text/json;charset=utf-8'); 
	error_reporting(E_ERROR);
	$db=new db();
	$action=$_GET['action'];
	if($action=="getcity"){
		$parentid=0;
		if(isset($parentid)){
			$parentid=$_POST['parentid'];
		}
		$result=$db->table('city')->where(array('parentid'=>$parentid))->select();
		if($result){
			echo buildJSON(0,'获取成功',$result);
		}else{
			echo buildJSON(1,'获取失败',$result);
		}
	}else if($action=="getnationality"){
		$result=$db->table('nationality')->select();
		if($result){
			echo buildJSON(0,'获取成功',$result);
		}else{
			echo buildJSON(1,'获取失败',$result);
		}
	}else if($action=="getpayinfo"){
		$mid=$_POST['mid'];
		$marathon=$db->table('marathon')->field('type,name')->where(array('id'=>$mid))->find();
		if($marathon){
			echo buildJSON(0,'获取成功',$marathon);
		}else{
			echo buildJSON(1,'获取失败',$marathon);
		}
	}else if($action=="search"){
		$where=array();
		if(isset($_POST['mid'])){
			$where['id']=$_POST['mid'];
		}else if(isset($_POST['telephone'])){
			$where['telephone']=$_POST['telephone'];
		}
		$marathon=$db->table('marathon')->where($where)->find();
		if($marathon){
			echo buildJSON(0,'获取成功',$marathon);
		}else{
			echo buildJSON(1,'获取失败',$db->getSql());
		}
	}
?>