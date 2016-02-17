<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
<title>参赛报名</title>
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
<li class="on"><a href='/index.php/Register/index'>提交报名</a></li>
          <li><a href='/index.php/Register/query'>证件查询</a></li>
          <li><a href='/index.php/Register/queryscore'>名次查询</a></li>
          <li><a href="/index.php/page/index/name/spzx">联系我们</a> </li>
      </ul>
    </div>

    <div class="inner sub_ct"> 

      <div class="sub_l">
        <h1>在线报名</h1>
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
<form action="<?php echo U('Register/add');?>" method="post" id="form">
            <table summary="参赛报名">
              <caption class="skip">
              参赛报名
              </caption>
              <colgroup>
              <col width="25%" />
              <col width="*" />
              </colgroup>
              <thead>
                <tr>
                  <th scope="col" colspan="2" style="text-align:center;">参加活动 <span style="color:red;">( 必填 )</span></th>
                </tr>
                <tr>
                  <th scope="row">比赛类型</th>
                  <td><label>
                      <input name="type" type="radio" checked value="0" id="mini"/>
                      迷你</label>
                    <label>
                      <input name="type" type="radio" value="1" id="type1"/>
                      半马 </label>
                    <label>
                      <input name="type" type="radio" value="2" id="type2"/>
                      全马 </label></td>
                </tr>
                <tr>
                  <th scope="row">参赛人：</th>
                  <td><input type="text" id="name" name="name" placeholder="输入参赛人姓名"></td>
                </tr>
                <tr>
                  <th scope="row">联系方式：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" id="telephone" name="telephone" placeholder="输入参赛入联系方式"></td>
                </tr>
                <tr>
                  <th  scope="col" colspan="2" style="text-align:center;">参赛人信息<span style="color:red;">( 可选填 )</span></th>
                </tr>
                <tr>
                  <th scope="row">性别：</th>
                  <td><label>
                      <input name="sex" type="radio" value="0" checked />
                      男 </label>
                    <label>
                      <input name="sex" type="radio" value="1" />
                      女 </label></td>
                </tr>
                <tr>
                  <th scope="row">电子邮件：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="email" placeholder="输入电子邮件"></td>
                </tr>
                <tr>
                  <th scope="row">微信号：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="weixin" placeholder="输入参赛人微信号"></td>
                </tr>
                <tr>
                  <th scope="row">血型：</th>
                  <td><label>
                      <input name="bloodtype" type="radio" checked value="0" />
                      A </label>
                    <label>
                      <input name="bloodtype" type="radio" value="1" />
                      B </label>
                    <label>
                      <input name="bloodtype" type="radio" value="2" />
                      AB </label>
                    <label>
                      <input name="bloodtype" type="radio" value="2" />
                      O </label></td>
                </tr>
                <tr>
                  <th scope="row">出生日期：</th>
                  <td><input type="date" class="mui-input-speech mui-input-clear" name="birthday" placeholder="输入出生日期"></td>
                </tr>
                <tr>
                  <th scope="row">学历：</th>
                  <td><label>
                      <input name="schooling" type="radio" checked value="0"/>
                      小学</label>
                    <label>
                      <input name="schooling" type="radio" value="1"/>
                      初中</label>
                    <label>
                      <input name="schooling" type="radio" value="2"/>
                      高中</label>
                    <label>
                      <input name="schooling" type="radio" value="3"/>
                      大学</label></td>
                </tr>
                <tr>
                  <th scope="row">职业：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="occupation" placeholder="输入你的职业"></td>
                </tr>
                <tr>
                  <th scope="row">身份证号：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="cardid" placeholder="输入你的身份证号"></td>
                </tr>
                <tr>
                  <th scope="row">国籍：</th>
                  <td><select name="nationalityid">
                      <?php if(is_array($nationalitys)): $i = 0; $__LIST__ = $nationalitys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select></td>
                </tr>
                <tr>
                  <th scope="row">城市：</th>
                  <td><select  style="width:30%" id="province">
                      <?php if(is_array($province)): $i = 0; $__LIST__ = $province;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["city"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                    <select name="cityid" id="cityid" style="width:30%">
                      <?php if(is_array($deflautcity)): $i = 0; $__LIST__ = $deflautcity;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["city"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select></td>
                </tr>
                <tr>
                  <th scope="row">详细地址：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="adress" placeholder="输入你的详细地址"></td>
                </tr>
                <tr>
                  <th scope="row">邮政编码：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="postcode" placeholder="输入你的邮政编码"></td>
                </tr>
                <tr>
                  <th scope="row">衣服尺寸：</th>
                  <td><label>
                      <input name="clothessize" type="radio" checked value="0" />
                      XXL </label>
                    <label>
                      <input name="clothessize" type="radio" value="1" />
                      XL </label>
                    <label>
                      <input name="clothessize" type="radio" value="2" />
                      L </label>
                    <label>
                      <input name="clothessize" type="radio" value="3" />
                      M </label>
                    <label>
                      <input name="clothessize" type="radio" value="4" />
                      S </label></td>
                </tr>
                <tr>
                  <th scope="row">参与过的赛事：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="joinin" placeholder="输入参与过的赛事"></td>
                </tr>
                <tr>
                  <th scope="row">是否通过体检：</th>
                  <td><label>
                      <input name="istest" type="radio" checked value="1" />
                      是 </label>
                    <label>
                      <input name="istest" type="radio" value="0" />
                      否 </label></td>
                </tr>
                <tr>
                  <th scope="row">训练频率：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="trainrate" placeholder="输入训练频率"></td>
                </tr>
                <tr>
                  <th scope="row">训练里程：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="email" placeholder="输入电子邮件"></td>
                </tr>
                <tr>
                  <th scope="row">训练里程：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="mileage" placeholder="输入训练里程"></td>
                </tr>
                <tr>
                  <th scope="row">最好半马成绩：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="besttype1score" placeholder="输入最好半马成绩"></td>
                </tr>
                <tr>
                  <th scope="row">最好全马成绩：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="besttype2score" placeholder="输入最好全马成绩"></td>
                </tr>
                <tr>
                  <th  scope="col" colspan="2" style="text-align:center;">紧急联系人信息<span style="color:red;">( 可选填 )</span></th>
                </tr>
                <tr>
                  <th scope="row">姓名：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="emergencycontactname" placeholder="紧急联系人姓名"></td>
                </tr>
                <tr>
                  <th scope="row">电话：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="emergencycontactphone" placeholder="紧急联系人电话"></td>
                </tr>
                <tr>
                  <th scope="col" colspan="2" style="text-align:center;">监护人信息<span style="color:red;">( 可选填 )</span></th>
                </tr>
                <tr>
                  <th scope="row">姓名：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="guardian" placeholder="监护人姓名"></td>
                </tr>
                <tr>
                  <th scope="row">电话：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="guardianphone" placeholder="监护人电话"></td>
                </tr>
                <tr>
                  <th scope="row">身份证号：</th>
                  <td><input type="tel" class="mui-input-speech mui-input-clear" name="guardiancid" placeholder="监护人身份证号"></td>
                </tr>
                <tr>
                  <th scope="row">关系：</th>
                  <td><input type="text" class="mui-input-speech mui-input-clear" name="guardianrelationship" placeholder="与监护人关系"></td>
                </tr>
                <tr>
                  <td colspan="2" style="text-align:center;"><button type="button"  onclick="dosubmint()" style="border:#D9D9D9 1px solid; padding:10px 20px; background:#F3F3F3">提交报名</button></td>
                </tr>
            </table>
          </form>
         

        



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
		$(function(){
			$("#province").change(function(){
				 var pid=$(this).val();
				 getcity(pid);
			});
			$("#btnsubmit").click(function(){
				dosubmint();
				
			});
			$("#btnexp").click(function(){
				$("#exp").toggle();
				if($("#exp").css("display")=="none"){
					$("#btnexp").text("填写更多");
				}else{
					$("#btnexp").text("收起内容");
				}
			});
			$("#type1").click(function(){
				window.location.href="<?php echo U('Register/typeone');?>?type=1";
			});
			$("#type2").click(function(){
				window.location.href="<?php echo U('Register/typeone');?>?type=2";
			});
		});
		function getcity(pid){
			var url="/regiser/home/ajax_city.php?pid="+pid;
			
			$.getJSON(url,function(json){
				html='';
				for(var i=0;i<json.length;i++){
					html+='<option value="'+json[i].id+'">'+json[i].city+'</option>';
					console.log(json[i].city);
				}
				$("#cityid").html(html);
			});
		}
		function dosubmint(){
			var name=$("#name").val();
			var telephone=$("#telephone").val();
			if(name==""){
				swal("请输入姓名!")
				return;
			}
			if(telephone==""){
				swal("请输入电话号码!")
				return;
			}
			if(!isMobil(telephone)){
				swal("请输入正确电话号码!")
				return;
			}
			$("#form").submit();
			
		}
		function isMobil(s) {
			var patrn = /^(13[0-9]{9})|(14[0-9])|(18[0-9])|(15[0-9][0-9]{8})$/;
			if (!patrn.exec(s)) return false
			return true
		}
</script>
<div style="display:none;"><?php echo ($site["tongji"]); ?></div>

</body>
</html>