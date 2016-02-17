<!DOCTYPE html>
<html style="background:#fff !important">

	<head>
		<meta charset="utf-8">
		<title>参加类型</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="/wx/css/mui.min.css">
		<link rel="stylesheet" type="text/css" href="/wx/css/cate.css"/>
		<link rel="stylesheet" href="/wx/css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="/wx/css/path_menu.css"/>
		<script src="/wx/js/weixin.js"></script>
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<style>
				.ui-notice{top: 0;z-index: -1;}
				.ui-dialog{margin: 0!important;padding: 0!important;  background: rgba(0,0,0,.65);opacity: 0.8;}
		</style>
	</head>
	<body style="background:#fff !important">
		<!-- header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-left-nav mui-pull-left" href="index.html"></a>
			<h1 class="mui-title">产品分类</h1>
			<a class="mui-icon mui-icon-search mui-pull-right" href="search.html"></a>
		</header -->
        <div style="height:50px; clear:bothl; overflow:hidden;background:#33276f !important">
			<div style="line-height:30px; padding:10px 10px 0 0;  float:right;"><a href="http://www.tzslx.com/regiser/home/search.php" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="/wx/index.html"><img src="/wx/images/logo.png" height="40"/></a>

		</div>
		<div class="mui-content" style="margin:0 0 70px 0; padding:20px 0 0 0">
			
<a href="http://www.tzslx.com/wx/fzsm.html"><img src="http://c.tzslx.com/tp/tdcj2.jpg" style="width:90%; height:auto; margin:0 5%" /></a>
<p style="width:90%; height:auto; margin:0 5%" ><a href="http://www.tzslx.com/wx/fzsm.html"><button class="mui-btn mui-btn-negative mui-btn-block">个人报名</button></a></p>
<a href="http://www.tzslx.com/wx/tdsm.html"><img src="http://c.tzslx.com/tp/tdcj.jpg" style="width:90%; height:auto;  margin:0 5%" /></a>
<p style="width:90%; height:auto; margin:0 5%" ><a href="http://www.tzslx.com/wx/tdsm.html"><button class="mui-btn mui-btn-negative mui-btn-block">团队报名</button></a></p>
			
		</div>
		<!--path菜单-->
	    <div id="pathmenu" class="menu_button fixed display_none" style="z-index: 21; line-height: 2.5em; display: block;"><span>菜单</span></div>
	    <div class="menu_button fixed display_none" id="home"><i class="mui-icon mui-icon-home"></i>
	
	        <div class="menu_text"><span>主页</span></div>
	    </div>
	    <div id="tel" class="menu_button fixed display_none"><i class="mui-icon mui-icon-phone"></i>
	        <div class="menu_text"><span>联系</span></div>
	    </div>
	    <div class="menu_button fixed display_none" id="map"><i class="mui-icon mui-icon-location"></i>
	
	        <div class="menu_text"><span>导航</span></div>
	    </div>
        
<footer id="footer"> 
  <ul>
    <li style="border-right:#3c2d80 1px solid;"><a href="/regiser/test/index.php">报名</a></li>
    <li style="border-right:#3c2d80 1px solid;"><a href="/regiser/home/search.php">搜索</a></li>
    <li style="border-right:#3c2d80 1px solid;"><a href="/regiser/home/searchscore.php">排名</a></li>
    <li><a href="/wx/html/news/categary.html">新闻</a></li>
  </ul>
</footer>
	    <div class="pathModel" ></div>
		<div id="mcover" onclick="document.getElementById('mcover').style.display='';">
            <img src="/wx/images/guide.png">
        </div>
        <div class="ui-dialog ui-dialog-notice show"><div class="ui-dialog-cnt"><i class="ui-loading-bright"></i><p>加载中...</p></div></div>
	</body>
	<script src="/wx/js/common.js"></script>
	<script src="/wx/js/mui.min.js"></script>
	<script src="/wx/js/zepto.min.js"></script>
	<script src="/wx/js/mui.lazyload.js"></script>
	<script src="/wx/js/mui.lazyload.img.js"></script>
	<script src="/wx/js/path.js"></script>
	<script>
		
		mui.init({
			swipeBack:false
		});
		
		$(function(){
			initWeixin();
			$("#home").on("tap",function(){
				window.location.href=indexUrl;
			});	
			$("#tel").on("tap",function(){
				window.location.href="tel:4009260070";
			});	
			$("#map").on("tap",function(){
				openMap();
			});
		});
		getCategary();
		function getCategary(){
			
			var url=serverUrl+"/categary?lang="+lang+"&type=p&callback=?";
			$.getJSON(url,function(json1){
				$(".ui-dialog.show").hide();
				console.log(json1);
				var html='';
				for(var i=0;i<json1.length;i++){
					html+='<li class="mui-table-view-cell mui-media">';
					html+='<a href="list.html?id='+json1[i].cid+'&title='+json1[i].name+'" class="mui-navigate-right"><img class="mui-media-object mui-pull-left" data-lazyload="/wx/images/'+json1[i].cid+'.jpg"><div class="mui-media-body">'+json1[i].name+'<p class="mui-ellipsis">Taizhou Marathon</p></div></a>';
					
				}
				$("#list").html(html);
				mui(document).imageLazyload({
					placeholder: 'images/60x60.gif'
				});
			});
		}
	</script><div style="display:none;"><script src="http://s4.cnzz.com/stat.php?id=1257502840&web_id=1257502840" language="JavaScript"></script></div>
</html>