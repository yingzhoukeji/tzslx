<?php
include 'conn.php';
header('Content-type:text/json;charset=utf-8'); 
$id=(int)$_GET['id'];
$orderid=$_GET['orderid'];
if(empty($id)){
	echo json_encode(array("status"=>0,"msg"=>"更新失败"));
	return;
}
if(empty($orderid)){
	echo json_encode(array("status"=>0,"msg"=>"更新失败"));
	return;
}
$rs= $conn->query('UPDATE pa_marathon SET ispay =1,ordercode="'.$orderid.'" WHERE id ='.$id);
if($rs){
	
	echo json_encode(array("status"=>1,"msg"=>"更新成功"));
}else{
	echo json_encode(array("status"=>0,"msg"=>"更新失败"));
}

?>
