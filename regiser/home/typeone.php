<?php
	include 'conn.php';
	$nationalitys = $conn->query("SELECT * FROM pa_nationality ORDER BY sort ASC");
	$province= $conn->query("SELECT * FROM pa_city where parentid=0 ORDER BY sort ASC");
	$deflautcity= $conn->query("SELECT * FROM pa_city where parentid=12 ORDER BY sort ASC");
	$type=$_GET['type'];
?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>
		跨世体育报名
		-
		<?php
			if($type=="1"){
				?>
				半马
		<?php
			}else{
				?>
				全马 
				<?php
			}
		?>
		</title>
		<link href="css/mui.min.css" rel="stylesheet"/>
		<link href="css/sweet-alert.css" rel="stylesheet"/>
<link rel="stylesheet" href="/wx/css/app.css" />
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
		<div class="mui-content">
			<div>
				<form class="mui-input-group" action="addone.php" method="post" id="form">
					<div class="mui-input-row">
						
						<span>
							<label>比赛类型：</label> 
							<label class="mui-radio"><input name="type" type="radio" value="0" id="type0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;迷你 </label> 
							<?php
								if($type=="1"){
									?>
									<label class="mui-radio"><input name="type" type="radio" value="1" checked id="type1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;半马 </label> 
									<label class="mui-radio"><input name="type" type="radio" value="2" id="type2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全马 </label> 
							<?php
								}else{
									?>
									<label class="mui-radio"><input name="type" type="radio" value="1" id="type1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;半马 </label> 
									<label class="mui-radio"><input name="type" type="radio" value="2" checked id="type2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全马 </label> 
									<?php
								}
							?>
							
						</span>
						
						
					</div>
					<div class="mui-input-row">
						<label>参&nbsp;&nbsp;赛&nbsp;&nbsp;人：</label>
						<input type="text" name="name" id="name" placeholder="输入参赛人姓名">
					</div>
					<div class="mui-input-row">
						<label>手机号码：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="telephone" id="telephone" placeholder="输入参赛入联系方式">
					</div>
					<div class="mui-input-row">
						<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<label class="mui-radio"><input name="sex" type="radio" value="0" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男 </label> 
						<label class="mui-radio"><input name="sex" type="radio" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女 </label> 
					</div>
					<div class="mui-input-row">
						<label>证件号码：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="cardid" id="cardid" placeholder="输入你的身份证号">
					</div>
                    <div class="mui-input-row">
						<label>台州户籍：</label>
						<label class="mui-radio"><input name="istz" type="radio" value="1" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是 </label> 
						<label class="mui-radio"><input name="istz" type="radio" value="0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否 </label> 
					</div>
					<div class="mui-input-row">
						<label>国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍：</label>
						<select name="nationalityid">
							<!--<option>中国</option>-->
							<?php
								foreach($nationalitys as $value){
									echo '<option value="'.$value["id"].'">'.$value["name"].'</option>';
								}
								$nationalitys->close();
							?>
						</select>
					</div>
					<div class="mui-input-row">
						<span>
                            <label>衣服尺寸：</label> 
							<label class="mui-radio"><input name="clothessize" type="radio" checked value="0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXL </label> 
							<label class="mui-radio"><input name="clothessize" type="radio" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XL </label> 
							<label class="mui-radio"><input name="clothessize" type="radio" value="2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;L </label> 
							<label class="mui-radio"><input name="clothessize" type="radio" value="3" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;M </label> 
							<label class="mui-radio"><input name="clothessize" type="radio" value="4" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S </label>  
						</span>
					</div>
                    <div class="mui-input-row">
						
						<span>
							<label>通过体检：</label> 
							<label class="mui-radio"><input name="istest" type="radio" checked value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是 </label> 
							<label class="mui-radio"><input name="istest" type="radio" value="0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否 </label> 
						</span>
					</div>
                    
                    <div class="mui-input-row">
						<label style="color:red">体育比赛经历</label>
						
					</div>
                    
					<div class="mui-input-row">
						<label>过往赛事：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="joinin" id="joinin" placeholder="输入参与过的赛事">
					</div>
					<div class="mui-input-row">
						<label>最好半马成绩：</label>
						
						<select name="besttype1score" id="besttype1score">
							<option value="<1.5H"><1.5H</option>
							<option value="1.5H-2H">1.5H-2H</option>
							<option value="2H-2.5H">2H-2.5H</option>
							<option value="2.5H-3H">2.5H-3H</option>
							<option value=">3H">>3H</option>
							<option value="没跑过">没跑过</option>
						</select>
					</div>
					<div class="mui-input-row">
						<label>最好全马成绩：</label>
						<select name="besttype2score" id="besttype2score">
							<option value="<2.5H"><2.5H</option>
							<option value="2.5H-3H">2.5H-3H</option>
							<option value="3H-3.5H">3H-3.5H</option>
							<option value="3.5H-4H">3.5H-4H</option>
							<option value="4H-4.5H">4H-4.5H</option>
							<option value="4.5H-5H">4.5H-5H</option>
							<option value=">5H">>5H</option>
							<option value="没跑过">没跑过</option>
						</select>
					</div>
                    <div class="mui-input-row">
						<label style="color:red">紧急联系人资料</label>
						
					</div>
					<div class="mui-input-row">
						<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="emergencycontactname" id="emergencycontactname" placeholder="紧急联系人姓名">
					</div>
					<div class="mui-input-row">
						<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="emergencycontactphone" id="emergencycontactphone" placeholder="紧急联系人电话">
					</div>
					
					<div class="expbtn">
						<div class="mui-btn mui-btn-primary mui-btn-outlined" style="width:100%;" id="btnexp">
						更多可选填写
						</div>
					</div>
					
					<div id="exp" style="display:none;">
					<div class="mui-input-row">
						<label style="color:red">参赛人信息</label>
						
					</div>
					
					<div class="mui-input-row">
						<label>电子邮件：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="email" placeholder="输入电子邮件">
					</div>
					<div class="mui-input-row">
						<label>微&nbsp;&nbsp;信&nbsp;&nbsp;号：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="weixin" placeholder="输入参赛人微信号">
					</div>
					<div class="mui-input-row">
						<span>
							<label>血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</label> 
							<label class="mui-radio"><input name="bloodtype" type="radio" checked value="0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A </label> 
							<label class="mui-radio"><input name="bloodtype" type="radio" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B </label> 
							<label class="mui-radio"><input name="bloodtype" type="radio" value="2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AB </label> 
							<label class="mui-radio"><input name="bloodtype" type="radio" value="2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O </label> 
						</span>
					</div>
					<div class="mui-input-row">
						<label>出生日期：</label>
						<input type="date" class="mui-input-speech mui-input-clear" name="birthday" placeholder="输入出生日期">
					</div>
					<div class="mui-input-row">
						<span>
							<label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</label> 
							<label class="mui-radio"><input name="schooling" type="radio" checked value="0"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小</label> 
							<label class="mui-radio"><input name="schooling" type="radio" value="1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初</label> 
							<label class="mui-radio"><input name="schooling" type="radio" value="2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高</label> 
							<label class="mui-radio"><input name="schooling" type="radio" value="3"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大</label>  
						</span>
					</div>
					<div class="mui-input-row">
						<label>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="occupation" placeholder="输入你的职业">
					</div>
					
					
					<div class="mui-input-row">
						<label>城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市：</label>
						<select name="cityid" id="cityid" style="width:30%">
							<?php
								foreach($deflautcity as $value){
									echo '<option value="'.$value["id"].'">'.$value["city"].'</option>';
								}
								$deflautcity->close();
							?>
						</select>
						<select  style="width:30%" id="province">
							
							<?php
								foreach($province as $value){
									echo '<option value="'.$value["id"].'">'.$value["city"].'</option>';
								}
								$province->close();
							?>
						</select>
					</div>
					<div class="mui-input-row">
						<label>详细地址：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="adress" placeholder="输入你的详细地址">
					</div>
					<div class="mui-input-row">
						<label>邮政编码：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="postcode" placeholder="输入你的邮政编码">
					</div>
					
					
					<div class="mui-input-row">
						<label>训练频率：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="trainrate" placeholder="输入训练频率">
					</div>
					<div class="mui-input-row">
						<label>训练里程：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="mileage" placeholder="输入训练里程">
					</div>
					
					<div class="mui-input-row">
						<label style="color:red">监护人资料</label>
						
					</div>
					<div class="mui-input-row">
						<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="guardian" placeholder="监护人姓名">
					</div>
					<div class="mui-input-row">
						<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="guardianphone" placeholder="监护人电话">
					</div>
					<div class="mui-input-row">
						<label>身份证号：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" name="guardiancid" placeholder="监护人身份证号">
					</div>
					<div class="mui-input-row">
						<label>关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系：</label>
						<input type="text" class="mui-input-speech mui-input-clear" name="guardianrelationship" placeholder="与监护人关系">
					</div>
					</div>
					<div class="mui-button-row">
						<button class="mui-btn mui-btn-primary" id="btnsubmit" onclick="return false;">提交报名</button>&nbsp;&nbsp;
					</div>
				</form>
				
		</div>
		</div>
<nav class="mui-bar mui-bar-tab" style="height:55px;">
    <a class="mui-tab-item" href="/wx/">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <a class="mui-tab-item mui-active" href="myindex.php">
        <span class="mui-icon mui-icon-compose"></span>
        <span class="mui-tab-label">跨世报名</span>
    </a>
    <a class="mui-tab-item" href="search.php">
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
			$("#type0").click(function(){
				window.location.href="index.php";
			});
			
		});
		function getcity(pid){
			var url="ajax_city.php?pid="+pid;
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
			if($("#cardid").val()==""){
				swal("请输入证件号码!")
				return;
			}
			if($("#joinin").val()==""){
				swal("请输入参与过的赛事，如果没有请填写’无‘!")
				return;
			}
			if($("#emergencycontactname").val()==""){
				swal("请输入紧急联系人名称!")
				return;
			}
			if($("#emergencycontactphone").val()==""){
				swal("请输入紧急联系人电话!")
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
</html>