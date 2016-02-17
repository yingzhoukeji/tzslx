<?php
error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE );
header('Content-Type: application/json; charset=utf8');
header('Access-Control-Allow-Origin: *');
$url=$_POST['url'];
require_once "jssdk.php";
$jssdk = new JSSDK("wx507bf1c8350ffe11", "69f19ce4f3cbdbdcbd25675adf832466");
$signPackage = $jssdk->GetSignPackage($url);
$json=array('appId'=>$signPackage['appId'],'timestamp'=>$signPackage['timestamp'],'nonceStr'=>$signPackage['nonceStr'],'jsapi_ticket'=>'no','signature'=>$signPackage['signature'],"URL"=>$signPackage['url']);
echo json_encode($json);

?>
