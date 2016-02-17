<?php
error_reporting(E_ERROR);
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once "WxPay.AppPay.php";
require_once("../include/log.php");
require_once("../include/config.db.php");
require_once("../include/db.class.php");
require_once("../include/common.php");
header('Content-type:text/json;charset=utf-8'); 
if(!isset($_POST['mid'])){
	echo buildJSON(1,'非法请求！');
	exit();
}
$db=new db();
$marathon=$db->table('marathon')->where(array('id'=>$_POST['mid']))->find();
$money=0;
if($marathon['type']==0){
	$money=40;
}else if($marathon['type']==1){
	$money=60;
}else if($marathon['type']==2){
	$money=80;
}
if(!empty($marathon['transaction_id'])){
	echo buildJSON(1,'你已经支付了！');
	exit();
}
$notify = new AppPay();
$notify->curl_timeout=30000;
/*首先生成prepayid*/
$input = new WxPayUnifiedOrder();
$input->SetBody("台州蓝协报名");//商品或支付单简要描述(必须填写)
//$input->SetAttach("test2");//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据(不必填)
//$input->SetDetail("Ipad mini  16G  白色,黑色");//商品名称明细列表(不必填)
$out_trade_no=WxPayConfig::MCHID.date("YmdHis");
$input->SetOut_trade_no($out_trade_no);//订单号(必须填写)
$input->SetTotal_fee($money);//订单金额(必须填写)
//$input->SetTime_start(date("YmdHis"));//交易起始时间(不必填)
//$input->SetTime_expire(date("YmdHis",time()+600));//交易结束时间10分钟之内不必填)
$input->SetGoods_tag("台马");//商品标记(不必填)
$input->SetNotify_url("http://www.tzslx.com/regiser/home/app/example/notify.php");//回调URL(必须填写)
$input->SetTrade_type("APP");//交易类型(必须填写)
//$input->SetProduct_id("123456789");//rade_type=NATIVE，此参数必传。此id为二维码中包含的商品ID，商户自行定义。
$order = WxPayApi::unifiedOrder($input);//获得订单的基本信息，包括prepayid
$appApiParameters = $notify->GetAppApiParameters($order);//生成提交给app的一些参数
$update=$db->table('marathon')->data(array('out_trade_no'=>$out_trade_no))->where(array('id'=>$_POST['mid']))->update();
if($update){
	echo buildJSON(0,'你已经支付了！',$appApiParameters);
}else{
	echo buildJSON(1,'系统繁忙稍后再试');
}
//die($appApiParameters);
?>