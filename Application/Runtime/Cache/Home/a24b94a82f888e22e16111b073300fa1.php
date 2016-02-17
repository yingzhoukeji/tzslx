<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
<title><?php echo ($webtitle); ?>-<?php echo ($site["name"]); ?></title>
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

  <div id="container" class="sub_wrap"> 

    <div class="sv K04"><b class="busjk"><?php echo (L("T_NEWS")); ?></b><span class="sv_line"></span>
      <p>KUASHI SPORTS</p>
    </div>

    <div class="snb_wrap ">
      <ul class="snb snb_col04">
    <li class="on"><a href="/index.php/news/index">新闻中心</a></li>
    <li><a href="/index.php/product/index">精彩视频</a></li>
    <li><a href="/index.php/page/index/name/gsryt">服务介绍</a></li>
    <li><a href="/index.php/Register/index">在线报名</a></li>
      </ul>
    </div>

    <div class="inner sub_ct"> 

      <div class="sub_l">
        <h1><?php echo (L("T_NEWS")); ?></h1>
        <div class="xiaolanmu">
           <h2>台州蓝协</h2>
           <p>KUASHI SPORTS DEVELOPMENT COMPANY LIMITED</p>
        </div>
        
        <div class="xiaodaoh">
           <ul>
           <?php $__m_cat=M("category");$__cat_list=$__m_cat->where("lang='zh-cn'  AND type='n' AND pid=0")->limit()->select();foreach($__cat_list as $_ck=>$_cv):$cid=$_cv['cid'];$child=$__m_cat->where('pid='.$cid)->order('cid DESC')->select();extract($_cv);?><li><a href='<?php echo U("news/index",array("cid"=>$cid));?>'><?php echo ($name); ?></a></li><?php endforeach; ?>
            </ul>
        </div>
        <div class="xiaodaoh">
           <img src="/img/1-1.jpg">
           <ul>
             <?php $__m_cat=M("category");$__cat_list=$__m_cat->where("lang='zh-cn'  AND type='n' AND pid=$_GET[cid]")->limit()->select();foreach($__cat_list as $_ck=>$_cv):$cid=$_cv['cid'];$child=$__m_cat->where('pid='.$cid)->order('cid DESC')->select();extract($_cv);?><li><a href='<?php echo U("news/index",array("cid"=>$cid));?>'><?php echo ($name); ?></a></li><?php endforeach; ?>
            </ul>
        </div>

      </div>

      <div class="sub_r lectr_wrap">

<div class="danyewg">
<h4><?php echo ($info["title"]); ?></h4>
<div class="jiedan"><samp><?php echo date('Y-m-d',$info['published']);?></samp> 栏目：<?php echo (L("T_NEWS")); ?>  发布人：<?php echo ($auther); ?></div>
<div class="nerrong">
<!-- if condition="$info['image_id'] neq 0">
<img src="<?php echo get_default_img($info['image_id']);?>" alt="" border="0" />
</if -->
<?php echo ($info['content']); ?>


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