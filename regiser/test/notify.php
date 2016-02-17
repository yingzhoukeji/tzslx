<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);

require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';
require_once 'log.php';

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		Log::DEBUG("call back test:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}else{
			//$rs= $conn->query('UPDATE pa_marathon SET ispay =1,ordercode="'.$orderid.'",openid="'.$openid.'" WHERE id ='.$id);
			require_once 'conn.php';
			Log::DEBUG("call back test:订单查询成功");
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
			if(count($arr)>0){
				Log::DEBUG("call back test:已入库");
			}else{
				Log::DEBUG("call back test:未入库");
				$sql='UPDATE pa_marathon SET ispay =1,transaction_id="'.$data['transaction_id'].'",out_trade_no="'.$data['out_trade_no'].'" WHERE openid ="'.$data['openid'].'"';
				Log::DEBUG("call back test sql:".$sql);
				$conn->query('UPDATE pa_marathon SET ispay =1,transaction_id="'.$data['transaction_id'].'",out_trade_no="'.$data['out_trade_no'].'" WHERE openid ="'.$data['openid'].'"');
				Log::DEBUG("call back test:入库成功");
			}
		}
		return true;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
