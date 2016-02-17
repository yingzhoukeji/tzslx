<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
<title>跨世体育</title>
<meta name="description" content="<?php echo ($site["description"]); ?>,<?php echo ($info['description']); ?>" />
<meta name="keywords" content="<?php echo ($site["keyword"]); ?>,<?php echo ($info['keywords']); ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="/img/nanumgothic.css">
<link type="text/css" rel="stylesheet" href="/img/@default.css">
<link href="/img/swiper.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" media="all and (max-width:1099px)" href="/img/@default_m.css">
<script type="text/javascript" src="/img/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/img/jquery.bxslider.js"></script>
<script type="text/javascript" src="/img/common.js"></script>
<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255,255,255,.38) solid !important;
	border-radius: 4px !important;
}
.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<link rel="shotcut icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
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
  <link rel="stylesheet" href="/img/swiper.css">
  <script type="text/javascript" src="/img/swiper.js"></script> 
  <script type="text/javascript">
	jQuery(document).ready(function($){
		if (ieVer > 9)
		{
			var mvSlider = new Swiper(".mv_img", {
				loop:true,
				autoplay:4000,
				speed:1500,
				pagination:'.mv_pager',
				bulletClass:'mv_bullet',
				bulletActiveClass: 'mv_bullet_on',
				paginationClickable:true
			});
		} else {
			$(".mv").bxSlider({
				auto:true,
				pause:4000
			});
		}
	});
	</script>
  <div id="container" class="m_wrap">
    <div class="mv_wrap">
      <div class="mv_img swiper-container-horizontal">
        <ul class="mv swiper-wrapper" style="transition-duration: 1500ms; transform: translate3d(-5148px, 0px, 0px);">
          <li class="swiper-slide swiper-slide-duplicate" style="width: 1287px; background-image: url(/img/BANNER_1451534914.jpg);" data-swiper-slide-index="3"></li>
          <li class="swiper-slide" style="width: 1287px; background-image: url(/img/BANNER_1451534613.jpg);" data-swiper-slide-index="0"></li>
          <li class="swiper-slide" style="width: 1287px; background-image: url(/img/BANNER_1451536348.jpg);" data-swiper-slide-index="1"></li>
          <li class="swiper-slide swiper-slide-prev" style="width: 1287px; background-image: url(/img/BANNER_1451536360.jpg);" data-swiper-slide-index="2"></li>
          <li class="swiper-slide swiper-slide-active" style="width: 1287px; background-image: url(/img/BANNER_1451534914.jpg);" data-swiper-slide-index="3"></li>
          <li class="swiper-slide swiper-slide-duplicate swiper-slide-next" style="width: 1287px; background-image: url(/img/BANNER_1451534613.jpg);" data-swiper-slide-index="0"></li>
        </ul>
        <div class="mv_pager_wrap">
          <div class="mv_pager swiper-pagination-clickable"><span class="mv_bullet"></span><span class="mv_bullet"></span><span class="mv_bullet"></span><span class="mv_bullet mv_bullet_on"></span></div>
        </div>
      </div>
      <p class="inner mv_txt"> Beautiful gardens - 健康的家园 </p>
    </div>

    <div class="m_content"> 
    
      <div class="m_mb_mid">
        <p class="m_operating"><img src="/img/icon_op.png" alt=""> <strong class="mr5">工作时间</strong><br>
          白天 08:00~17:00<br>
              晚上 18:00~23:00</p>
        <ul class="m_mb_info">
          <li><a href="/index.php/page/index/name/rczl"><img src="/img/m_info01.png" alt=""> VIP服务</a></li>
          <li><a href="/index.php/page/index/name/jltd"><img src="/img/m_info01.png" alt=""> VIP等级</a></li>
        </ul>
      </div>

      <div class="inner float-wrap"> 

        <div class="m_sec">
          <h2 class="img_mid"><a href="/index.php/page/index/name/gsjj" class="s_tit01">公司简介</a><samp>Company profile</samp></h2>
          <p class="m_sec_photo img_fit"><a href="/index.php/page/index/name/gsjj"><span style="background-image:url('/img/BANNER_1453275511.jpg');"></span></a></p>

          <div class="m_sec_txt"> <a href="/index.php/page/index/name/gsjj">
            <h3>运动创造崭新生命</h3>
            <p>台州蓝协成立于2014年9月，是一家专业从事体育文化推广普及、体育产业开发与利用、体育项目组织服务、体育用品生产销售、体育场馆工程建设及商...</p>
            </a> </div>
        </div>


        <div class="m_sec">
          <h2 class="img_mid"><a href="/index.php/page/index/name/gsryt" class="s_tit01">服务介绍</a><samp>Service Introduction</samp></h2>
          <p class="m_sec_photo img_fit"><a href="/index.php/page/index/name/gsryt"><span style="background-image:url('/img/BANNER_1453694312.jpg');"></span></a></p>
  
          <div class="m_sec_txt"> <a href="/index.php/page/index/name/gsryt">
            <h3>搏生命之极限，铸青春之辉煌。</h3>
            <p> 公司现已开发跨世体育健身中心、跨世体育（玖壹）彩弹射击馆、跨世体育健身培训中心等三个项目经营总面积达6000余平方米。同时有跳水游泳馆、网球馆、足球场、篮球..</p>
            </a> </div>
        </div>


        <div class="m_sec m_sec_green m_sec_temp">
          <h2 class="img_mid"><a href="/index.php/page/index/name/yggh" class="s_tit01">会员中心</a><samp>Member Center</samp></h2>
          <p class="m_sec_photo img_fit"><a href="/index.php/page/index/name/yggh"><span style="background-image:url('/img/1452309027.jpg');"></span></a></p>

          
          <div class="m_sec_txt">
            <h3><a href="/index.php/page/index/name/qqyxwl">健康常识</a></h3>

            <ul class="m_notice">
              <li>
                <p><a href="/index.php/page/index/name/rczl">· [会员中心] VIP 服务</a></p>
              </li>
              <li>
                <p><a href="/index.php/page/index/name/jltd">· [会员中心] VIP 等级</a></p>
              </li>
            </ul>
          </div>
        </div>
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
<div style="display:none;"><?php echo ($site["tongji"]); ?></div>
</body>
</html>