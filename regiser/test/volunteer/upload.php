<?php
header('Content-type:text/json');
$s=dirname(__FILE__); //��ķ�����·��
$time =time();        //��õ�ǰʱ���
$files =$_POST['files1'];
$base64_body = substr(strstr($files,','),1);
$tmp  = base64_decode($base64_body);
$fp=$s."/upload/".$time.".jpg";//ȷ��ͼƬ�ļ�λ�ü�����
$path="/upload/".$time.".jpg";
//д�ļ�
file_put_contents($fp, $tmp);  //��ͼƬ�ļ�д������
$json='{"status":1,"path":"'.$path.'"}';  
echo $json;
?>