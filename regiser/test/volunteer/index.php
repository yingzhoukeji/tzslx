<?php
	
?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>跨世体育报名-自愿者</title>
		<link href="../css/mui.min.css" rel="stylesheet"/>
		<link href="../css/sweet-alert.css" rel="stylesheet"/>

		<link rel="stylesheet" type="text/css" href="../css/cate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/swiper.min.css"/>
		<link rel="stylesheet" href="../css/frozen.css" />
		<link rel="stylesheet" type="text/css" href="../css/path_menu.css"/>
        
		<script src="../js/zepto.min.js"></script>
		<script src="../js/sweet-alert.min.js"></script>
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
			.mui-radio input{float:left !important; left:0px}
			.img{
				
			}
			.mui-table-view .mui-media-object{
				    min-width: 160px!important;
					 max-width: 50%!important;
			}
		</style>
	<body>
    <div style="height:50px; clear:bothl; overflow:hidden;background:#33276f !important">
			<div style="line-height:30px; padding:10px 10px 0 0;  float:right;"><a href="search.php" style="color:rgba(255,255,255,1.00);"><samp class="mui-icon mui-icon-search"></samp></a></div>
			<a href="/wx/index.html"><img src="/wx/images/logo.png" height="40"/></a>

		</div>
		<div class="mui-content" style=" margin-bottom: 55px;">
			<div>
				<form class="mui-input-group" action="add.php" method="post" id="form">
					
					<div class="mui-input-row">
						<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<input type="text" id="name" name="name" placeholder="输入姓名">
					</div>
					<div class="mui-input-row">
						<label>联系电话：</label>
						<input type="tel" class="mui-input-speech mui-input-clear" id="telephone" name="telephone" placeholder="输入联系方式">
					</div>
					<div class="mui-input-row">
						<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
						<label class="mui-radio"><input name="sex" type="radio" value="0" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男 </label> 
						<label class="mui-radio"><input name="sex" type="radio" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女 </label> 
					</div>
					<div class="mui-input-row">
						<label>出生日期：</label>
						<input type="date" class="mui-input-speech mui-input-clear" id="birthday" name="telephone" placeholder="输入你的出生日期">
					</div>
					<div class="mui-input-row">
						<label>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
						<input type="text" class="mui-input-speech mui-input-clear" id="company" name="telephone" placeholder="输入你的单位">
					</div>
					 <h5 style="background-color:#efeff4; line-height:35px; padding:0 0 0 15px;">您的头像</h5>
					   <ul class="mui-table-view mui-grid-view">
							<li class="mui-table-view-cell mui-media mui-col-xs-2" style="width:100%;">
								<a>
									<label for="unload" class="file1"><img class="mui-media-object" src="img/add.png" ></label>
									<input style="display: none;" id="unload" type="file" class="photo" onchange="getFile(this)"/>
									<div class="mui-media-body" style="font-size:10px;"></div>
								</a>
							</li>
						</ul>
					
				
                    <p style="width:90%; height:auto; margin:2% 5% 0 5%; padding:0 0 10% 0" ><button class="mui-btn mui-btn-negative mui-btn-block" id="btnsubmit" onclick="return false;">提交报名</button></p>
          
					
				</form>

		</div>
		</div>
		<nav class="mui-bar mui-bar-tab" style="height:55px;">
            <a class="mui-tab-item" href="/wx/">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item mui-active" href="index.php">
				<span class="mui-icon mui-icon-compose"></span>
				<span class="mui-tab-label">报名</span>
			</a>
			<a class="mui-tab-item" href="search.php">
				<span class="mui-icon mui-icon-search"></span>
				<span class="mui-tab-label">报名查询</span>
			</a>
			<a class="mui-tab-item" id="tel" href="searchscore.php">
				<span class="mui-icon mui-icon-bars"></span>
				<span class="mui-tab-label">成绩查询</span>
			</a>
		</nav>
	</body>
	<script>
		var f1=null;
		var path='';
		$(function(){
			$("#btnsubmit").click(function(){
				dosubmit()
			});
		});
		function dosubmit(){
			var name=$("#name").val();
			var telephone=$("#telephone").val();
			var sex=$("input[name='sex']:checked").val();
			var birthday=$("#birthday").val();
			var company=$("#company").val();
			if(name==''){
				swal("请输入姓名!");
				return;
			}
			if(telephone==''){
				swal("请输入联系电话!");
				return;
			}
			if(birthday==''){
				swal("请输入出生日期!");
				return;
			}
			if(company==''){
				swal("请输入工作单位!");
				return;
			}
			if(path==''){
				swal("请上传最近照片!");
				return;
			}
			var data={};
			data.name=name;
			data.phone=telephone;
			data.birthday=birthday;
			data.company=company;
			data.sex=parseInt(sex);
			data.img=path;
			$.post("add.php",data,function(json){
				if(json.status==1){
					swal(json.msg);
					setTimeout(function(){
						window.location.href="../../index.php";
					},1000);
				}else{
					swal(json.msg);
				}
				
			},"json");
		}
		function upload(obj){
			var data={};
			data.files1=f1;
			var url="upload.php";
			$.post(url,data,function(json){
				if(json.status==1){
					$(obj).parent().find(".mui-media-object").attr("src",f1);
					path=json.path;
					swal("图片上传成功!");
				}else{
					swal("图片上传失败!");
				}
				
			},"json");
		}
		function getFile(obj){
			var file = obj.files[0];      
			//判断类型是不是图片  
			if(!/image\/\w+/.test(file.type)){     
					alert("请确保文件为图像类型");   
					return false;   
			}  
			var reader = new FileReader();   
			reader.readAsDataURL(file);
			reader.onload = function(e){   
				__appendFile(this.result,obj);
					
			} 
		}
		// 添加文件

		function __appendFile(path,obj){
		  var img = new Image();
				img.src = path;        // 传过来的图片路径在这里用。
				img.onload = function () {
					var that = this;
					//生成比例 
					var w = that.width,
						h = that.height,
						scale = w / h; 
						w = 300 || w;              //480  你想压缩到多大，改这里
						h = w / scale;

					//生成canvas
					var canvas = document.createElement('canvas');

					var ctx = canvas.getContext('2d');

					$(canvas).attr({width : w, height : h});

					ctx.drawImage(that, 0, 0, w, h);
					var base64 = canvas.toDataURL('image/jpeg', 1 || 0.8 );   //1最清晰，越低越模糊。有一点不清楚这里明明设置的是jpeg。弹出 base64 开头的一段 data：image/png;却是png。哎开心就好，开心就好
				   f1 =base64;   // 把base64数据丢过去，上传要用。
					upload(obj);
					
			}

		}
	</script>
</html>