<?php
include 'conn.php';
header('Content-type:text/json;charset=utf-8'); 

$action=$_POST['action'];
$sql="";
if($action=="bm"){
	$type=(int)$_POST['type'];
	$param=$_POST['param'];
	if($type==0){
		$sql='SELECT * FROM pa_marathon where telephone="'.$param.'"';
	}else if($type==1){
		$sql='SELECT * FROM pa_marathon where ordercode="'.$param.'"';
	}
	
	$marathon= $conn->query($sql);
	$arr=array();
	while($row=$marathon->fetch_array())
	{
		array_push($arr,$row);
	}
	$marathon->close();
	echo json_encode($arr);
}else if($action=="getnation"){
	$nationalityid=(int)$_POST["nationalityid"];
	$sql1='SELECT * FROM pa_nationality where id='.$nationalityid;
	$nationality= $conn->query($sql1);
	$arr1=array();
	while($row1=$nationality->fetch_array())
	{
		array_push($arr1,$row1);
	}
	$nationality->close();
	echo json_encode($arr1);
}else if($action=="checkpay"){
	$sql2='SELECT ispay FROM pa_marathon where id='.$_POST['id'];
	$marathon2= $conn->query($sql2);
	$arr2=array();
	while($row2=$marathon->fetch_array())
	{
		array_push($arr2,$row2);
	}
	$marathon2->close();
	echo json_encode($arr2);
}

?>
