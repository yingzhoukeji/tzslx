var jsApiList=[
		'checkJsApi',
		'onMenuShareTimeline',
		'onMenuShareAppMessage',
		'onMenuShareQQ',
		'onMenuShareWeibo',
		'hideMenuItems',
		'showMenuItems',
		'hideAllNonBaseMenuItem',
		'showAllNonBaseMenuItem',
		'translateVoice',
		'startRecord',
		'stopRecord',
		'onRecordEnd',
		'playVoice',
		'pauseVoice',
		'stopVoice',
		'uploadVoice',
		'downloadVoice',
		'chooseImage',
		'previewImage',
		'uploadImage',
		'downloadImage',
		'getNetworkType',
		'openLocation',
		'getLocation',
		'hideOptionMenu',
		'showOptionMenu',
		'closeWindow',
		'scanQRCode',
		'chooseWXPay',
		'openProductSpecificView',
		'addCard',
		'chooseCard',
		'openCard'
];

function initWeixin(){
	var url=document.URL;
	$.post("http://www.tzslx.com/wx/api.php",{url:url},function(json){
		wx.config({
			debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId: json.appId, // 必填，公众号的唯一标识
			timestamp: json.timestamp, // 必填，生成签名的时间戳
			nonceStr: json.nonceStr, // 必填，生成签名的随机串
			signature: json.signature,// 必填，签名，见附录1
			jsApiList: jsApiList // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
			
		});
		wx.error(function (res) {
		  //alert(res.errMsg);
		});
		
	});			
}

function openMap(){
	wx.openLocation({
		latitude: 28.607621543695, // 纬度，浮点数，范围为90 ~ -90
		longitude: 121.52780381617, // 经度，浮点数，范围为180 ~ -180。
		name: '2015台州蓝协邀请赛', // 位置名
		address: '中国·浙江滨海工业园区B区海丰路2229号', // 地址详情说明
		scale: 20
	});
}
		