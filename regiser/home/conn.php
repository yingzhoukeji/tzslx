<?php

$db_name='tzslx'; 
$conn = mysqli_connect( 
 'localhost', /* The host to connect to 连接MySQL地址 */  
 'root',   /* The user to connect as 连接MySQL用户名 */  
 '123456', /* The password to use 连接MySQL密码 */  
 'tzslx');  /* The default database to query 连接数据库名称*/  
if (!$conn) { 
  printf("Can't connect to MySQL Server. Errorcode: %s ", mysqli_connect_error()); 
  exit; 
}
mysqli_query($conn,'set names utf8');
?>
