<?php
	//换成自己的接口信息
	$appid = 'wx507bf1c8350ffe11';
	$redirect_uri=urlencode("http://www.tzslx.com/wxhd/oauth.php");
	header('location:https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=123&connect_redirect=1#wechat_redirect');
?>