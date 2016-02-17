<?php
header('Content-type:text/json');
$s=dirname(__FILE__); //获的服务器路劲
$time =time();        //获得当前时间戳
$files =$_POST['files1'];
$base64_body = substr(strstr($files,','),1);
$tmp  = base64_decode($base64_body);
$fp=$s."/upload/".$time.".jpg";//确定图片文件位置及名称
$path="/upload/".$time.".jpg";
//写文件
file_put_contents($fp, $tmp);  //给图片文件写入数据
$json='{"status":1,"path":"'.$path.'"}';  
echo $json;
?>