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
?>
