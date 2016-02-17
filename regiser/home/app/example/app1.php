<?php
error_reporting(E_ERROR);
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
require_once "../lib/WxPay.Api.php";
require_once "WxPay.AppPay.php";
$notify = new AppPay();
/*首先生成prepayid*/
$input = new WxPayUnifiedOrder();
$input->SetBody("test1");//商品或支付单简要描述(必须填写)
//$input->SetAttach("test2");//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据(不必填)
//$input->SetDetail("Ipad mini  16G  白色,黑色");//商品名称明细列表(不必填)
$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));//订单号(必须填写)
$input->SetTotal_fee("1");//订单金额(必须填写)
//$input->SetTime_start(date("YmdHis"));//交易起始时间(不必填)
//$input->SetTime_expire(date("YmdHis",time()+600));//交易结束时间10分钟之内不必填)
$input->SetGoods_tag("test");//商品标记(不必填)
$input->SetNotify_url("http://tc.weixinxa.com/app/weixin/example/notify.php");//回调URL(必须填写)
$input->SetTrade_type("APP");//交易类型(必须填写)
//$input->SetProduct_id("123456789");//rade_type=NATIVE，此参数必传。此id为二维码中包含的商品ID，商户自行定义。
$order = WxPayApi::unifiedOrder($input);//获得订单的基本信息，包括prepayid
$appApiParameters = $notify->GetAppApiParameters($order);//生成提交给app的一些参数
die($appApiParameters);
?>