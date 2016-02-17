<?php
include 'conn.php';
include 'common.php';
header("Content-Type:text/html;charset=utf-8");
$data=$_POST;

if(empty($data["name"])){
	$result["status"]=0;
	$result["msg"]="请填写你的名称！";
	echo buildErrMsg('请填写你的名称！');
	return;
}
if(empty($data["telephone"])){
	$result["status"]=0;
	$result["msg"]="请填写你的手机号码！";
	echo '请填写你的手机号码！';
	return;
}
if(empty($data["mileage"])){
	$data["mileage"]=0;
}
$checksql="SELECT id FROM pa_marathon WHERE telephone='".$data['telephone']."'"; 
$marathons= $conn->query($checksql);
$arr=array();
while($row=$marathons->fetch_array())
{
	$city=array(
		"id"=>$row[0]
	);
	array_push($arr,$city);
}
if(count($arr)>0){
	echo buildErrPage('对不起该号码已经注册');
	return;
}
/**检查上限人数**/
$type=(int)$data['type']+1;
$maxsql="SELECT id FROM pa_marathon where type=".$data['type']; 
$allmarathon= $conn->query($maxsql);
$allarr=array();
while($row=$allmarathon->fetch_array())
{
	$city=array(
		"id"=>$row[0]
	);
	array_push($allarr,$city);
}
$setting=$conn->query('SELECT max FROM pa_setting where id='.$type);
$settingrow=$setting->fetch_array();
$max=(int)$settingrow['max'];
$marathoncount=count($allarr);
if($marathoncount>$max){
	echo buildErrPage('对不起报名人数已达到上限');
	return;
}
$sql="INSERT INTO pa_marathon(type,name,sex,telephone,email,weixin,bloodtype,birthday,schooling,occupation,"
."cardid,nationalityid,cityid,adress,postcode,clothessize,joinin,istest,trainrate,mileage,besttype1score,besttype2score,"
."emergencycontactname,emergencycontactphone,guardian,guardianphone,guardiancid,guardianrelationship,ip,createtime)"
."VALUE(".$data['type'].", '".$data['name']."', ".$data['sex'].",'".$data['telephone']."','".$data['email']."','".$data['weixin']
."',".$data['bloodtype'].",'".$data['birthday']."',".$data['schooling'].",'".$data['occupation']."','".$data['cardid']."',".$data['nationalityid']
.",".$data['cityid'].",'".$data['adress']."','".$data['postcode']."',".$data['clothessize'].",'".$data['joinin']."',".$data['istest'].",'".$data['trainrate']
."',".$data['mileage'].",'".$data['besttype1score']."','".$data['besttype2score']."','".$data['emergencycontactname']."','".$data['emergencycontactphone']
."','".$data['guardian']."','".$data['guardianphone']."','".$data['guardiancid']."','".$data['guardianrelationship']."','".$_SERVER["REMOTE_ADDR"]."','".date('Y-m-d H:m:s', time())."')";
if ($conn->query($sql) == TRUE) {
	//echo "user entry saved successfully.id=".mysqli_insert_id($conn);
	session_start();
	//注册session变量，赋值为一个用户的名称
	$_SESSION["type"]=$data['type'];
	//注册session变量，赋值为一个用户的ID
	$_SESSION["id"]=mysqli_insert_id($conn);
	//header("location: pay.php");
	echo '<script>window.location.href="pay.php"</script>';
} else {
	echo "报名失败！" ;
}
$conn->close();
?>
