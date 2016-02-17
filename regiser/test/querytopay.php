<?php
$id=(int)$_GET["id"];
$type=$_GET["type"];
session_start();
//注册session变量，赋值为一个用户的名称
$_SESSION["type"]=$type;
//注册session变量，赋值为一个用户的ID
$_SESSION["id"]=$id;
//header("location: pay.php");
echo '<script>window.location.href="pay.php"</script>';
?>
