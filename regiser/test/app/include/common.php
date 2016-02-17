<?php
function buildErrPage($msg){
	$html='<html><head>';
	$html.='<meta http-equiv="content-type" content="text/html;charset=utf-8"/>';
	$html.='<meta name="viewport" content="width=device-width, initial-scale=1"/> ';
	$html.='<title>错误提示</title>';
	$html.='</head>';
	$html.='<body>';
	$html.='<div style="position: fixed;top: 50%;width:100%;text-align:center;">';
	$html.='<div style="color:red;font-size:14px;">'.$msg.'</div><div style="margin-top:10px;"><a href="javascript:history.back();">返回</a></div></div>';
	$html.='</body>';
	$html.='</html>';
	return $html;
}
function buildSuccessPage($msg,$location){
	$html='<html><head>';
	$html.='<meta http-equiv="content-type" content="text/html;charset=utf-8"/>';
	$html.='<meta name="viewport" content="width=device-width, initial-scale=1"/> ';
	$html.='<title>成功提示</title>';
	$html.='</head>';
	$html.='<body>';
	$html.='<div style="position: fixed;top: 50%;width:100%;text-align:center;">';
	$html.='<div style="color:red;font-size:15px;">'.$msg.'</div><div style="margin-top:10px;"></div></div>';
	$html.='</body>';
	$html.='<script>setTimeout(function(){window.location.href="'.$location.'"},5000);</script>';
	$html.='</html>';
	return $html;
}
function buildJSON($r,$msg,$data=null){
	$json=array(
		'r'=>$r,
		'msg'=>$msg,
		'data'=>$data
	);
	return json_encode($json);
}
function guid(){
	if (function_exists('com_create_guid')){
		return com_create_guid();
	}else{
		mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
		$charid = strtoupper(md5(uniqid(rand(), true)));
		$hyphen = chr(45);// "-"
		$uuid = chr(123)// "{"
		.substr($charid, 0, 8).$hyphen
		.substr($charid, 8, 4).$hyphen
		.substr($charid,12, 4).$hyphen
		.substr($charid,16, 4).$hyphen
		.substr($charid,20,12)
		.chr(125);// "}"
		return $uuid;
	}
}
function uuid($prefix = '')
{
	$chars = md5(uniqid(mt_rand(), true));
	$uuid  = substr($chars,0,8) . '-';
	$uuid .= substr($chars,8,4) . '-';
	$uuid .= substr($chars,12,4) . '-';
	$uuid .= substr($chars,16,4) . '-';
	$uuid .= substr($chars,20,12);
	return $prefix . $uuid;
}
//给定一个日期，获取其本月的第一天和最后一天
function getCurMonthFirstDay($date) {
	return date('Y-m-01', strtotime($date));
}
function getCurMonthLastDay($date) {
	return date('Y-m-d', strtotime(date('Y-m-01', strtotime($date)) . ' +1 month -1 day'));
}
//给定一个日前获取本周第一天和最后一个天
function getCurWeekFirstDay(){
	$date=date('Y-m-d');  //当前日期
	$first=1; //$first =1 表示每周星期一为开始日期 0表示每周日为开始日期
	$w=date('w',strtotime($date));  //获取当前周的第几天 周日是 0 周一到周六是 1 - 6 
	$now_start=date('Y-m-d',strtotime("$date -".($w ? $w - $first : 6).' days')); //获取本周开始日期，如果$w是0，则表示周日，减去 6 天
	return $now_start;
	/*$now_end=date('Y-m-d',strtotime("$now_start +6 days"));  //本周结束日期
	
	$last_start=date('Y-m-d',strtotime("$now_start - 7 days"));  //上周开始日期
	
	$last_end=date('Y-m-d',strtotime("$now_start - 1 days"));  //上周结束日期
	
	echo '本周开始日期：',$now_start,'<br />';
	echo '本周结束日期：',$now_end,'<br />';
	echo '上周开始日期：',$last_start,'<br />';
	echo '上周结束日期：',$last_end,'<br />';*/
}
function getCurWeekLastDay(){
	$date=date('Y-m-d');  //当前日期
	$first=1; //$first =1 表示每周星期一为开始日期 0表示每周日为开始日期
	$w=date('w',strtotime($date));  //获取当前周的第几天 周日是 0 周一到周六是 1 - 6
	$now_start=date('Y-m-d',strtotime("$date -".($w ? $w - $first : 6).' days'));
	$now_end=date('Y-m-d',strtotime("$now_start +6 days"));  //本周结束日期
	return $now_end;
}
function mkdirs($dir){
	if(!is_dir($dir))
	{
		if(!mkdirs(dirname($dir))){
			return false;
		}
		if(!mkdir($dir,0777)){
			return false;
		}
		chmod($dir, 0777);
	}
	return true;
}
function object_array($array) {  
    if(is_object($array)) {  
        $array = (array)$array;  
     } if(is_array($array)) {  
         foreach($array as $key=>$value) {  
             $array[$key] = object_array($value);  
             }  
     }  
     return $array;  
}
?>
