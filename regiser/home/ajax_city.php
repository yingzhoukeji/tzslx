<?php
include 'conn.php';
header('Content-type:text/json;charset=utf-8'); 
$pid=(int)$_GET['pid'];
$citys= $conn->query('SELECT id,city FROM pa_city where parentid='.$pid.' ORDER BY sort ASC');
$arr=array();
while($row=$citys->fetch_array())
{
	$city=array(
		"id"=>$row[0],
		"city"=>$row[1]
	);
	array_push($arr,$city);
}
$citys->close();
echo json_encode($arr);
?>
