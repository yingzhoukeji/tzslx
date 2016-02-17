
 function getInternetExplorerVersion() {
  var rv = -1;
  if (navigator.appName == 'Microsoft Internet Explorer') {
   var ua = navigator.userAgent;
   var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
   if (re.exec(ua) != null)
   rv = parseFloat(RegExp.$1);
  }
  return rv;
 } 

 function checkVersion() {
  ver = getInternetExplorerVersion();
  if (ver > -1)
   b_chk = 1;
  else
   b_chk = 2;
 }

checkVersion();
	

$(function(){

	/* skip navigation */
	$("#skipToContents a").focus(function(){
		$("#skipToContents").removeClass("skip");
	});
	$("#header h1 a").focus(function(){
		$("#skipToContents").addClass("skip");
	});

	/*gnb control*/
	$("#header .gnbWrap > ul > li").mouseover(function(){
		if(b_chk==1 && ver < 8){
			$(this).find("ul").css("display","block");
		}else{
			$(this).find("ul").slideDown("fast");
		}
		if($(this).attr("class")!="on"){
			$(this).find("span a").css("color","#ED1C24");
		}
		$(this).find("span").css("background-position","center bottom");
		$("#header .allview").css("display","none");
	}).mouseleave(function(){
		$(this).find("ul").slideUp("fast");
		$(this).find("span").css("background-position","-100% bottom");
		if($(this).attr("class")!="on"){
			$(this).find("span a").css("color","#000");
		}
	});
	$("#header .gnbWrap > ul > li > span a").focus(function(){
		$(this).parent().mouseenter();
		$(this).parent().parent().siblings().find("ul").slideUp("fast");
		$(this).parent().parent().siblings().find("span").css("background-position","-100% bottom");
		$(this).parent().parent().siblings().find("span a").css("color","#000");
	});

	/*all view*/
	$("#header .btn-allview a").click(function(){
		if($("#header .allview").css("display")=="none"){
			$("#header .allview").css("display","block");
		}else{
			$("#header .allview").css("display","none");
		}
		if($("#header .allview").css("top")=="60px"){
			$("#contents #lnb").css("display","none");
			$(".subContents h3 span.btn-lnb").removeClass("on");
		}		
	}).focus(function(){
		$("#header .gnbWrap ul ul").css("display","none");
		$("#header .gnbWrap > ul > li span").css("background-position","-100% bottom");
		$("#header .gnbWrap > ul > li:not(.on) span a").css("color","#000");
	});
	/*all view - 640이하 2뎁스메뉴오픈*/
	$("#header .allview > ul > li > a").click(function(){
		if($("#header .allview").css("top")=="60px"){//모바일화면일때만.
			if($(this).next().css("display")=="none"){
				$(this).addClass("on");
				$(this).next().slideDown("fast");
				$(this).parent().siblings().find(">a").removeClass("on");
				$(this).parent().siblings().find(">ul").slideUp("fast");
			}else{
				$(this).removeClass("on");
				$(this).next().slideUp("fast");
			}
		}
	});

	/*메인페이지 visual 세로사이즈*/
	$(".main .mainVisual").css("height",($(window).height() - 70) + "px");//현재 브라우저 - 헤더영역
	$(".main .mainVisual .flash_area object").attr("height",($(window).height() - 70) + "px");
	$(window).resize(function(){
		$(".main .mainVisual").css("height",($(window).height() - 70) + "px");
		$(".main .mainVisual .flash_area object").attr("height",($(window).height() - 70) + "px");
	});
	
	/*메인페이지 컨텐츠보기 클릭*/
	//var main_scroll = 1;
	$(".mainVisual .fixArea a.up-btn").click(function(){
		//$conTop = $("#body #contents").offset();
		$conTop = $("#body .mainVisual").height() + 70;
		$docTop = $(window).scrollTop();
		//alert($docTop); 
		if($docTop > 0) {
			$("body,html").animate({scrollTop:0},300);
			$(".mainVisual .fixArea .up-btn img").attr("src","img_btn_up.gif");
		}else if($docTop < $("#wrapper").height()/3){
			$("body,html").animate({scrollTop:$conTop-35},300);
			$(".mainVisual .fixArea .up-btn img").attr("src","/img/img_btn_down.gif");	
		}		
		return false;
	});

	/*메인페이지 상품리스트 마우스오버*/
	$("#contents .pList li").mouseover(function(){
		if($("#contents .pList .container").css("width")!="168px"){
			$(this).find("a span").css("display","block");
		}
	}).mouseleave(function(){
		if($("#contents .pList .container").css("width")!="168px"){
			$(this).find("a span").css("display","none");
		}
	});

	/*서브페이지-모바일환경에서 lnb 보기 클릭*/
	$(".subContents h3").click(function(){
		if($(this).css("cursor")=="pointer"){//모바일화면일때만.
			if($("#contents #lnb").css("display")=="none"){
				$("#contents #lnb").css("display","block");
				$(this).find(".btn-lnb").addClass("on skip_txt");
			}else{
				$("#contents #lnb").css("display","none");
				$(this).find(".btn-lnb").removeClass("on skip_txt");
			}
		}
		/*if($("#contents #lnb").css("display")=="none"){
			$("#contents #lnb").css("display","block");
			$(this).find(".btn-lnb").addClass("on");
		}else{
			$("#contents #lnb").css("display","none");
			$(this).find(".btn-lnb").removeClass("on");
		}*/
	});
	
	

	/*제품소개-lnb-하위메뉴 마우스오버*/
	//$(".product #lnb > ul > li > a").mouseover(function(){
		//$lnb_idx = $(this).parent().index();
		//if($(".container").css("width")=="1200px"){//pc화면 디자인에서만 보이게
			//if($lnb_idx < 4){
				//$(this).parent().siblings().find("> a").removeClass("over");
				//$(this).parent().siblings().find("> .sub_product").css("display","none"); /* 140725 수정 ul -> .sub_product (트랙터 lnb 때문에 수정함) */
				//$(this).addClass("over");
				//$(this).next(".sub_product").css("display","block");
			//}			
		//}
		//if($lnb_idx > 3){//제품전체보기,가격정보에 over시
			//$(".product #lnb > ul > li > a").removeClass("over");
			//$(".product #lnb > ul > li .sub_product").css("display","none");
		//}		
	//});
	//$(".product #lnb").mouseleave(function(){
		//$(".product #lnb > ul > li > a").removeClass("over");
		//$(".product #lnb > ul > li .sub_product").css("display","none");
	//});
	
	/*$(".sub_product").mouseleave(function(){
		$(this).css("display","none");
		$(this).siblings().removeClass("over");
	});*/

	/*제품소개 view 클릭이미지*/
	$(".pd_info .left #pd_img li a").click(function(){
		pd_img_idx = $(this).parent().index() + 1;
		$(this).parent().siblings().removeClass("on");
		$(this).parent().addClass("on");
		$(".big_img li").css("display","none");
		$(".big_img li:nth-child("+pd_img_idx+")").css("display","block");
	});

	/*제품소개 퀵메뉴*/
	$(".quick_menu .goList a").click(function(){
		if($(this).next().css("display")=="none"){
			$(this).next().slideDown("fast");
		}else if($(this).next().css("display")=="block"){
			$(this).next().slideUp("fast");
		}
	});
	
	/*제품소개 탭*/
	$(".tab-type01.half li a").click(function(){
		$(this).parent().siblings().removeClass("on");
		$(this).parent().addClass("on");
		if($(this).parent().index()==0){
			$(this).parent().parent().nextAll(".tab1").css("display","block");
			$(this).parent().parent().nextAll(".tab2").css("display","none");
		}else{
			$(this).parent().parent().nextAll(".tab1").css("display","none");
			$(this).parent().parent().nextAll(".tab2").css("display","block");
		}
	});
	
	$(".tab-type01.three li a").click(function(){
		$(this).parent().siblings().removeClass("on");
		$(this).parent().addClass("on");
		if($(this).parent().index()==0){
			$(this).parent().parent().nextAll(".tab1").css("display","block");
			$(this).parent().parent().nextAll(".tab2").css("display","none");
			$(this).parent().parent().nextAll(".tab3").css("display","none");
		}else if($(this).parent().index()==1){
			$(this).parent().parent().nextAll(".tab1").css("display","none");
			$(this).parent().parent().nextAll(".tab2").css("display","block");
			$(this).parent().parent().nextAll(".tab3").css("display","none");
		}else{
			$(this).parent().parent().nextAll(".tab1").css("display","none");
			$(this).parent().parent().nextAll(".tab2").css("display","none");
			$(this).parent().parent().nextAll(".tab3").css("display","block");
		}
	});

	/*제품소개 종합가격정보 탭 */
	$(".tab-type01 li a").click(function(){
		$(this).parent().siblings().removeClass("on");
		$(this).parent().addClass("on");
		if($(this).parent().index()==0){
			$(this).parent().parent().nextAll(".tab01").css("display","block");
			$(this).parent().parent().nextAll(".tab02, .tab03").css("display","none");
		}else if($(this).parent().index()==1){
			$(this).parent().parent().nextAll(".tab01, .tab03").css("display","none");
			$(this).parent().parent().nextAll(".tab02").css("display","block");
		}else{
			$(this).parent().parent().nextAll(".tab01, .tab02").css("display","none");
			$(this).parent().parent().nextAll(".tab03").css("display","block");
		}
	});
	
	/*제품소개 다른제품보기 좌우이동*/
	$(".liquid1 .prne li.last a").click(function(){
		view_val = $(".section02");
		view_val.find(".another_pd_list li:first-child").animate({"margin-right":"-245px"},"100",function(){
			$(this).appendTo(view_val.find(".another_pd_list")).css("margin-right","0");
		});
	});
	$(".liquid1 .prne li.left a").click(function(){
		view_val = $(".section02");
		view_val.find(".another_pd_list li:last-child").css("margin-left","-300px").prependTo(view_val.find(".another_pd_list"));
		view_val.find(".another_pd_list li:first-child").animate({"margin-left":"0"},"100");
	});
	
	/* 회사소개 연혁 open/close */
	$(".history_list li dl a").click(function(){
		if($(this).parent().parent().parent().attr("class")=="on"){
			$(this).parent().parent().parent().removeClass("on");
		}else{
			$(this).parent().parent().parent().siblings().removeClass("on");
			$(this).parent().parent().parent().addClass("on");
		}
	});
	
	/* 자가정비요령 open/close */
	$(".dNum-0402 li .q a").click(function(){
		if($(this).parent().parent().attr("class")=="on"){
			$(this).parent().parent().removeClass("on");
		}else{
			$(this).parent().parent().siblings().removeClass("on");
			$(this).parent().parent().addClass("on");
		}
		return false;
	});


	/*familysite drop down*/
	$("#footer .linkWrap p a").click(function(){
		if($(this).parent().next().css("display")=="none"){
			$(this).parent().next().slideDown("fast");
			$(this).find("img").attr("src","img_fbtn_list2.gif");
		}else if($(this).parent().next().css("display")=="block"){
			$(this).parent().next().slideUp("fast");
			$(this).find("img").attr("src","img_fbtn_list.gif");
		}
		return false;
	});
	$("#footer .linkWrap").mouseleave(function(){
		if($("#footer .linkWrap ul").css("display")=="block") $("#footer .linkWrap p a").click();
	});

	
	/*pc환경에서 리사이징 시 레이아웃 리셋*/
	$(window).resize(function(){
		browser_w = $(window).width();
		if(browser_w > 1024){
			$("#contents #lnb").css("display","block");
		}else if(browser_w > 640){
			$("#header .allview").css("display","none");
			$("#header .allview li ul").css("display","block");
			$("#header .allview > ul > li > a").removeClass("on");
			$("#contents #lnb").css("display","none");
			$(".subContents h3 span.btn-lnb").removeClass("on");
		}else if(browser_w < 640){
			$("#header .allview li ul").css("display","none");
			$("#header .allview > ul > li > a").removeClass("on");
			//$("#contents #lnb").css("display","none");
			//$(".subContents h3 span.btn-lnb").removeClass("on");
		}
	});
	
});
