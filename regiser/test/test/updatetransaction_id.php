<?php
include '../conn.php';
$data["transaction_id"]="1008400869201509150882249042";
$data["openid"]="ouN6_sxLcoj384sR7eid--a57rrc";
$checksql="SELECT id FROM pa_marathon WHERE transaction_id='".$data['transaction_id']."'"; 
$marathons= $conn->query($checksql);
$arr=array();
while($row=$marathons->fetch_array())
{
	$city=array(
		"id"=>$row[0]
	);
	array_push($arr,$city);
}
echo json_encode($arr);
echo count($arr);
if(count($arr)>0){
	echo "1111";
}else{
	//echo 'UPDATE pa_marathon SET ispay =1,transaction_id="'.$data['transaction_id'].'" WHERE openid ='.$data['openid'];
	$result=$conn->query('UPDATE pa_marathon SET ispay =1,transaction_id="'.$data['transaction_id'].'" WHERE openid ="'.$data['openid'].'"');
	
}
?>
