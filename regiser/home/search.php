<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>跨世体育-报名查询</title>
		<link href="css/mui.min.css" rel="stylesheet"/>
		<link href="css/sweet-alert.css" rel="stylesheet"/>

		<link rel="stylesheet" type="text/css" href="css/cate.css"/>
		<link rel="stylesheet" type="text/css" href="css/swiper.min.css"/>
		<link rel="stylesheet" href="css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="css/path_menu.css"/>
        
		<script src="js/zepto.min.js"></script>
		<script src="js/sweet-alert.min.js"></script>
		<style>
			.mui-input-row label{
				width:auto;
			}
			.mui-input-row label{
				padding: 10px 5px;
			}
			label{font-size:14px;}
			input::-webkit-input-placeholder{
				font-size:12px;
			}
			.expbtn{text-align:center;padding:10px 10px;border-bottom:1px solid #ddd;}
			
.mui-radio{ font-size:12px !important;}
.mui-radio input{float:left !important; left:0px}.tubiao{
	background: url(/wx/images/2-2.png) ; 
	height:40px; 
	width:40px;
	-moz-background-size:contain;
    -webkit-background-size:contain;
    -o-background-size:contain;
    background-size:contain;
	}
		</style>
	<body> 
		<div class="mui-content" style="padding-top: 20px;padding-left: 10px; padding-right: 10px;">
		<div class="mui-input-row">
				<label style="color:red;">报名查询：</label>
			</div>	
			<div class="mui-input-row">
				<label>查询方式：</label>
				<label class="mui-radio"><input name="type" type="radio" value="0" checked onclick="swithsearchTxt(0);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话号码 </label> 
				<label class="mui-radio"><input name="type" type="radio" value="1" onclick="swithsearchTxt(1);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单号 </label> 
			</div>
			<div class="mui-input-row">
				
				<input type="text" id="searchparam" name="searchparam" placeholder="输入你的电话号码">
			</div>
			<div class="mui-button-row">
				<button class="mui-btn mui-btn-primary" id="btnsubmit" onclick="return false;">提交查询</button>&nbsp;&nbsp;	
			</div>
			<div class="spinner">
			  <div class="double-bounce1"></div>
			  <div class="double-bounce2"></div>
			</div>
			<div class="mui-card" style="margin-top:10px;">
				<ul class="mui-table-view" id="detail">
				</ul>
			</div>
		</div><nav class="mui-bar mui-bar-tab" style="height:55px;">
    <a class="mui-tab-item" href="/wx/">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <a class="mui-tab-item" href="myindex.php">
        <span class="mui-icon mui-icon-compose"></span>
        <span class="mui-tab-label">跨世报名</span>
    </a>
    <a class="mui-tab-item mui-active" href="search.php">
        <span class="mui-icon mui-icon-search"></span>
        <span class="mui-tab-label">报名查询</span>
    </a>
    <a class="mui-tab-item" id="tel" href="searchscore.php">
        <span class="mui-icon mui-icon-bars"></span>
        <span class="mui-tab-label">成绩查询</span>
    </a>
	
	<a class="mui-tab-item" href="/wx/lxwm.html">
        <span class="mui-icon mui-icon-phone"></span>
        <span class="mui-tab-label">联系我们</span>
    </a>
</nav>
	</body>
	<script>
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
				$.post("ajax_search.php",data,function(json){
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
									var payurl='querytopay.php?id='+marathon.id+"&type="+marathon.type;
									html+=buildlist("是否支付报名费：<span style='color:red;font-size:14px;'> 未支付！即报名失败！</span><br/><a href='"+payurl+"' style='color:blue;text-align:center;margin-top:10px;'>去支付完成报名！</a>");
								}
								$("#detail").html(html);
						}else{
							
							var html=buildlist("姓名；"+marathon.name);
							html+=buildlist("<a href='{:U('Register/zhengshu')}?id="+marathon.id+"'>获取比赛证书<a>");
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
									var payurl='querytopay.php?id='+marathon.id+"&type="+marathon.type;
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
			
			$.post("ajax_search.php",data,function(json){
				var name=json[0].name;
				$("#nationalityid").text("国籍："+name);
			},'json');
		}
	</script>
</html>
