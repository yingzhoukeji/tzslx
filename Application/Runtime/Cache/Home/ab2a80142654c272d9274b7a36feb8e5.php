<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
<title>证件查询</title>
<meta name="description" content="<?php echo ($site["description"]); ?>,<?php echo ($info['description']); ?>" />
<meta name="keywords" content="<?php echo ($site["keyword"]); ?>,<?php echo ($info['keywords']); ?>" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link href='/img/cssa.css' rel='stylesheet' type='text/css'>
<link href='/img/cssb.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/img/nanumgothic.css" />
<link type="text/css" rel="stylesheet" href="/img/@default.css" />
<link href="/img/swiper.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" media="all and (max-width:1099px)" href="/img/@default_m.css" />
<script type="text/javascript" src="/img/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/img/jquery.bxslider.js"></script>
<script type="text/javascript" src="/img/common.js"></script>

<link href="/img/sweet-alert.css" rel="stylesheet"/>
<script src="/img/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/img/cs.css" />

<link rel="shotcut icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<style>
table{border-collapse: collapse;}
td{width:auto;padding:5px;}
.spinner {
  display:none;
  width: 60px;
  height: 60px;
 
  position: relative;
  margin: 100px auto;
}
 
.double-bounce1, .double-bounce2 {
  width: 100%;
  height: 100%;
  border-radius: 50%;

  opacity: 0.6;
  position: absolute;
  top: 0;
  left: 0;
   
  -webkit-animation: bounce 2.0s infinite ease-in-out;
  animation: bounce 2.0s infinite ease-in-out;
}
 
.double-bounce2 {
  -webkit-animation-delay: -1.0s;
  animation-delay: -1.0s;
}
 
@-webkit-keyframes bounce {
  0%, 100% { -webkit-transform: scale(0.0) }
  50% { -webkit-transform: scale(1.0) }
}
 
@keyframes bounce {
  0%, 100% {
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 50% {
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  }
  
  
  
}	
.mui-table-view-cell{
	font-size:16px;
	line-height:50px;
	border-bottom:#E1E1E1 1px solid;
  }
</style>
</head>

<body  oncontextmenu="return false" onselectstart="return false" ondragstart="return false" >
<div id="wrap"> 
  <script type="text/javascript">
	jQuery(document).ready(function($){
		setGnb();
	});

	$(window).resize(function(){
		if (winSize > 767) closeMobileGnb(1);
	});
	</script> 

  <div id="header">
    <div class="inner">
      <p class="logo"><a href="/"><img src="/img/logo.png" ></a></p>
      <span class="gnb_btn img_block"><img src="/img/gnb_btn.png"></span>
      <div class="gnb_wrap">
        <ul class="tnb">
          <li><a href=/index.php/Register/index>在线报名</a>|</li>
          <li><a href=/index.php/Register/query>证件查询</a>|</li>
          <li class="last"><a href=/index.php/Register/queryscore>名次查询</a></li>
        </ul>
        <ul class="gnb">
<li class="gnb_01 m_no_sub"><a href="/" class="gnb_link">首页</a></li>
<li class="gnb_02"><a href="/index.php/page/index/name/zjds" class="gnb_link">公司简介</a>
  <ul class="gnb_sub">
    <li><a href="/index.php/page/index/name/gsjj">跨世简介</a></li>
    <li><a href="/index.php/page/index/name/dszzc">服务理念</a></li>
    <li><a href="/index.php/page/index/name/dsys">企业文化</a></li>
    <li><a href="/index.php/page/index/name/qywh">发展历程</a></li>
  </ul>
</li>
<li class="gnb_02"><a href="/index.php/page/index/name/gsryt" class="gnb_link">服务介绍</a>
  <ul class="gnb_sub">
    <li><a href="/index.php/page/index/name/zzjig">射箭</a></li>
    <li><a href="/index.php/page/index/name/dszjg">游泳</a></li>
    <li><a href="/index.php/page/index/name/qyyjd">篮球</a></li>
    <li><a href="/index.php/page/index/name/lnzhg">马拉松</a></li>
    <li><a href="/index.php/page/index/name/fsdfg">瑜伽</a></li>
    <li><a href="/index.php/page/index/name/dsship">真人cs</a></li>
    <li><a href="/index.php/page/index/name/rlzy">羽毛球</a></li>
    <li><a href="/index.php/page/index/name/rczpp">体操</a></li>
  </ul>
</li>
<li class="gnb_03"><a href="/index.php/page/index/name/yggh" class="gnb_link">会员服务</a>
  <ul class="gnb_sub">
    <li><a href="/index.php/page/index/name/rczl">VIP服务</a></li>
    <li><a href="/index.php/page/index/name/jltd">VIP等级</a></li>
    <li><a href="/index.php/page/index/name/qqyxwl">健身常识</a></li>
    <li><a href="/index.php/page/index/name/gnxswl">BMI测试</a></li>
  </ul>
</li>
<li class="gnb_04"><a href="/index.php/page/index/name/qyvixx" class="gnb_link">加盟中心</a>
  <ul class="gnb_sub">
    <li><a href="/index.php/page/index/name/shfw">合作方式</a></li>
    <li><a href="/index.php/page/index/name/dszlxz">加盟联系</a></li>
    <li><a href="/index.php/message/index">在线留言</a></li>
  </ul>
</li>
<li class="gnb_05"><a href="/index.php/page/index/name/spzx" class="gnb_link">联系我们</a> </li>
        </ul>
        <ul class="m_tnb">
          <li><a href=/index.php/Register/index>在线报名</a></li>
          <li><a href=/index.php/Register/query>证件查询</a></li>
          <li><a href=/index.php/Register/queryscore>名次查询</a></li>
          
        </ul>
      </div>
    </div>
  </div>

  <div id="container" class="sub_wrap"> 

    <div class="sv K01"><b class="busjk">在线报名</b><span class="sv_line"></span>
      <p>KUASHI SPORTS</p>
    </div>

    <div class="snb_wrap ">
      <ul class="snb snb_col04">
<li><a href='/index.php/Register/index'>提交报名</a></li>
          <li class="on"><a href='/index.php/Register/query'>证件查询</a></li>
          <li><a href='/index.php/Register/queryscore'>名次查询</a></li>
          <li><a href="/index.php/page/index/name/spzx">联系我们</a> </li>
      </ul>
    </div>

    <div class="inner sub_ct"> 

      <div class="sub_l">
        <h1>名次查询</h1>
        <div class="xiaolanmu">
           <h2>台州蓝协</h2>
           <p>KUASHI SPORTS DEVELOPMENT COMPANY LIMITED</p>
        </div>
        
        <div class="xiaodaoh">
           <img src="/img/1-1.jpg">
           <ul>
    <li><a href="/index.php/page/index/name/zzjig">射箭</a></li>
    <li><a href="/index.php/page/index/name/dszjg">游泳</a></li>
    <li><a href="/index.php/page/index/name/qyyjd">篮球</a></li>
    <li><a href="/index.php/page/index/name/lnzhg">马拉松</a></li>
    <li><a href="/index.php/page/index/name/fsdfg">瑜伽</a></li>
    <li><a href="/index.php/page/index/name/dsship">真人cs</a></li>
    <li><a href="/index.php/page/index/name/rlzy">羽毛球</a></li>
    <li><a href="/index.php/page/index/name/rczpp">体操</a></li>
            </ul>
        </div>

      </div>

      <div class="sub_r lectr_wrap">
      
      
<table summary="支付说明" class="tb2">
							<caption class="skip">支付说明</caption>
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tbody>
				<tr><td>查询方式：</td>
				<td>
					<label class="mui-radio"><input name="type" type="radio" value="0" checked onclick="swithsearchTxt(0);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话号码 </label> 
					<label class="mui-radio"><input name="type" type="radio" value="1" onclick="swithsearchTxt(1);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单号 </label> 
				</td>
			</tr>
			<tr><td>查询内容：</td>
				<td>
                
					<input type="text" id="searchparam" name="searchparam" placeholder="输入你的电话号码">
				</td>
			</tr></tbody>
			</table>
			<div class="spinner">
			  <div class="double-bounce1"></div>
			  <div class="double-bounce2"></div>
			</div>
            <br /><br />
            <button type="button"  id="btnsubmit" onclick="return false;" style="border:#D9D9D9 1px solid; padding:10px 20px; background:#F3F3F3">提交报名</button>
            <br /><br />
            <ul id="detail">
			</ul>
			

      </div>

    </div>

    
  </div>
  <script type="text/javascript">
	function goTop(){
		$("html, body").animate({scrollTop:0},600);
	}

</script> 
  


  <div id="footer"> 

    <div id="quick">
      <div class="inner">
        <div class="q_right">
          <ul class="q_sitemap">
          
         
          
          
          
<li><a href="/index.php/page/index/name/zjds">公司简介</a>
  <ul class="q_sitemap_sub">
    <li><a href="/index.php/page/index/name/gsjj">跨世简介</a></li>
    <li><a href="/index.php/page/index/name/dszzc">服务理念</a></li>
    <li><a href="/index.php/page/index/name/dsys">企业文化</a></li>
    <li><a href="/index.php/page/index/name/qywh">发展历程</a></li>
  </ul>
</li>
<li><a href="/index.php/page/index/name/gsryt">服务介绍</a>
  <ul class="q_sitemap_sub">
    <li><a href="/index.php/page/index/name/zzjig">射箭</a></li>
    <li><a href="/index.php/page/index/name/dszjg">游泳</a></li>
    <li><a href="/index.php/page/index/name/qyyjd">篮球</a></li>
    <li><a href="/index.php/page/index/name/lnzhg">马拉松</a></li>
    <li><a href="/index.php/page/index/name/fsdfg">瑜伽</a></li>
    <li><a href="/index.php/page/index/name/dsship">真人cs</a></li>
    <li><a href="/index.php/page/index/name/rlzy">羽毛球</a></li>
    <li><a href="/index.php/page/index/name/rczpp">体操</a></li>
  </ul>
</li>
<li><a href="/index.php/page/index/name/yggh">会员服务</a>
  <ul class="q_sitemap_sub">
    <li><a href="/index.php/page/index/name/rczl">VIP服务</a></li>
    <li><a href="/index.php/page/index/name/jltd">VIP等级</a></li>
    <li><a href="/index.php/page/index/name/qqyxwl">健身常识</a></li>
    <li><a href="/index.php/page/index/name/gnxswl">BMI测试</a></li>
  </ul>
</li>


<li><a href="/index.php/news/index">新闻中心</a>
  <ul class="q_sitemap_sub">
    <li><a href="/index.php/news/index/cid/1">赛事新闻</a></li>
    <li><a href="/index.php/news/index/cid/2">跨世公告</a></li>
    <li><a href="/index.php/news/index/cid/3">媒体中心</a></li>
    <li><a href="/index.php/news/index/cid/4">精彩瞬间</a></li>
    <li><a href="/index.php/news/index/cid/5">健康知识</a></li>
    <li><a href="/index.php/news/index/cid/6">体育知识</a></li>
  </ul>
</li>
<li><a href="/index.php/product/index">精彩视频</a>
  <ul class="q_sitemap_sub">
    <li><a href="/index.php/product/index/cid/7">国际比赛片段</a></li>
    <li><a href="/index.php/product/index/cid/8">中国比赛片段</a></li>
    <li><a href="/index.php/product/index/cid/9">台州比赛片段</a></li>
    <li><a href="/index.php/product/index/cid/10">媒体报道</a></li>
  </ul>
</li>
          </ul>
        </div>
        <div class="q_left">
          <div class="q_op_time">
            <p class="t-hide">跨世体育联系方式</p>
            <p class="mt15">工作时间<br>
              <strong>白天 08:00~17:00<br>
              晚上 18:00~23:00</strong><br>
              <small><b>跨世地址</b><br>
              浙江省台州市体育中心</small></p>
          </div>
          <div class="q_weather">
            <div class="wth_type t01">
              <p class="temp">电话</p>
              <h6>0576<br>
                <span class="date">88803456</span></h6>
            </div>
          </div>
        </div>
        <div class="q_contact">
          <p class="q_mail"><span></span><a href="mailto:625499077@qq.com">邮件联系</a></p>
          <p class="q_site ml10 t-ml0 t-mt10"> <span></span>
            <select name="family_site" id="family_site" onchange="if(this.value) window.open(this.value);">
              <option value="加盟中心">加盟中心</option>
              <option value="/index.php/page/index/name/shfw">合作方式</option>
              <option value="/index.php/page/index/name/dszlxz">加盟联系</option>
              <option value="/index.php/message/index">在线留言</option>
              <option value="/index.php/page/index/name/spz">联系我们</option>
            </select>
          </p>
        </div>
      </div>
    </div>


    
    <div class="copyright">
      <p class="inner pt15 pb15"> Copyright  2016, KUASHI SPORTS, Co,. Ltd. All Rights Reserved. <span class="show-state" data-break-point="768" data-after-state="show"><br>
        </span><span class="go_top"><a href="javascript:goTop();"><img src="/img/top.jpg" alt="TOP"></a></span> </p>
    </div>
  </div>

  
</div>
<script type="text/javascript">
	
	/* 弹出 */
	function popCwin( url, name, w, h, scroll) {
		var wl = (window.screen.width/2) - ((w/2) + 10);
		var wt = (window.screen.height/2) - ((h/2) + 50);
		var option = "height="+h+",width="+w+",left="+wl+",top="+wt+",screenX="+wl+",screenY="+wt+",scrollbars="+scroll + ", status=yes";
		commonPopWin = window.open( url, name, option );
		commonPopWin.focus();
	}

</script>
<script>
		var mainurl="<?php echo U('Register/wxpaycode');?>";
		function swithsearchTxt(n){
			if(n==0){
				$("#searchparam").attr("placeholder","输入你的电话号码");
			}else{
				$("#searchparam").attr("placeholder","输入你的订单号");
			}
		}
		$(function(){
			$("#btnsubmit").click(function(){
				if($("#searchparam").val()==""){
					swal("请输入你要查询的内容!")
					return;
				}
				$(".spinner").show();
				var data={};
				data.action="bm";
				data.type=$("input[name='type']:checked").val();
				data.param=$("#searchparam").val();
				$.post("/regiser/home/ajax_search.php",data,function(json){
					$(".spinner").hide();
					console.log(json);
					if(json.length>0){
						var marathon=json[0];
						var type=marathon.type;
						if(type==0){
							var html=buildlist("姓名；"+marathon.name);
								html+=buildlist("报名类型：跨世体育迷你");
								html+=buildlist("<span style='color:red;'>参赛号："+marathon.hbh+"</span>");
								html+=buildlist("手机号码："+marathon.telephone);
								
								if(marathon.ispay==1){
									html+=buildlist("订单号："+marathon.ordercode);
									html+=buildlist("是否支付报名费：已支付！即报名成功！");
								}else{
									var payurl=mainurl+'?id='+marathon.id+"&type="+marathon.type;
									html+=buildlist("是否支付报名费：<span style='color:red;font-size:14px;'> 未支付！即报名失败！</span><br/><a href='"+payurl+"' style='color:blue;text-align:center;margin-top:10px;'>去支付完成报名！</a>");
								}
								$("#detail").html(html);
						}else{
							var html=buildlist("姓名；"+marathon.name);
							html+=buildlist("<a style='color:blue;' href='<?php echo U('Register/zhengshu');?>?id="+marathon.id+"'>点击获取报名确认函<a>");
								if(type==1){
									html+=buildlist("报名类型：跨世体育半马");
								}else if(type==2){
									html+=buildlist("报名类型：跨世体育全马");
								}
								html+=buildlist("<span style='color:red;'>参赛号："+marathon.hbh+"</span>");
								html+=buildlist("手机号码："+marathon.telephone);
								
								if(marathon.sex==0){
									html+=buildlist("性别：男");
								}else{
									html+=buildlist("性别：女");
								}
								html+=buildlist("证件号码："+marathon.cardid);
								html+=buildlist("<sapn id='nationalityid'>国籍："+marathon.nationalityid+"</span>");
								getnationality(marathon.nationalityid);
								html+=buildlist("衣服尺寸："+clothessize(marathon.clothessize));
								html+=buildlist("参与过的赛事："+marathon.joinin);
								if(marathon.istest==1){
									html+=buildlist("是否体检：已体检");
								}else{
									html+=buildlist("是否体检：未体检");
								}
								html+=buildlist("最好半马成绩："+marathon.besttype1score);
								html+=buildlist("最好全马成绩："+marathon.besttype2score);
								html+=buildlist("紧急联系人姓名："+marathon.emergencycontactname);
								html+=buildlist("紧急联系人电话："+marathon.emergencycontactphone);
								if(marathon.istz==1){
									html+=buildlist("是否台州户籍：是");
								}else{
									html+=buildlist("是否台州户籍：否");
								}
								if(marathon.ispay==1){
									html+=buildlist("订单号："+marathon.ordercode);
									html+=buildlist("是否支付报名费：已支付！即报名成功！");
								}else{
									var payurl=mainurl+'?id='+marathon.id+"&type="+marathon.type;
									html+=buildlist("是否支付报名费：<span style='color:red;font-size:14px;'> 未支付！即报名失败！</span><br/><a href='"+payurl+"' style='color:blue;text-align:center;margin-top:10px;'>去支付完成报名！</a>");
								}
								$("#detail").html(html);
						}
					}else{
						swal("未查询到你想要的内容!");
					}
				},'json');
			});
		});
		function buildlist(str){
			var html='<li class="mui-table-view-cell">'+str+'</li>';
			return html;
		}
		function clothessize(n){
			n=parseInt(n);
			var str='XXL';
			switch(n){
				case 0:
				str="XXL";
				break;
				case 1:
				str="XL";
				break;
				case 2:
				str="L";
				break;
				case 3:
				str="M";
				break;
				case 4:
				str="S";
				break;
			}
			return str;
		}
		function getnationality(id){
			var data={};
			data.action="getnation";
			data.nationalityid=id;
			
			$.post("/regiser/home/ajax_search.php",data,function(json){
				var name=json[0].name;
				$("#nationalityid").text("国籍："+name);
			},'json');
		}
	</script>
<div style="display:none;"><?php echo ($site["tongji"]); ?></div>

</body>
</html>