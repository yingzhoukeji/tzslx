var innerSize = 1100;
var winSize = $(window).width();
var window_w;


jQuery(document).ready(function($){
	responsiveStateSet();
	window_w = $(window).width();
});

$(window).resize(function(){
	winSize = $(window).width();
});

//테이블 리스트 정렬(칸수에 맞추기)
function alignTableList($list, col, pc_col){	
	// $list : ul object
	// col : column개수
	// pc_col : inner > 1100 일 때  column 개수

	//칸 채움 용 빈 li 삭제
	$("li",$list).each(function(idx){
		if ($(this).html()=="") $(this).remove();
	});

	var ct_cnt = $("li", $list).size(); //컨텐츠가 있는 list 수
	var line_cnt = (ct_cnt%col == 0) ? ct_cnt/col : parseInt(ct_cnt/col) + 1;
	var item_cnt = col * line_cnt; //총 list 수
	

	if (ct_cnt < item_cnt) {
		//라인수에 맞도록 칸 채우기
		var add_cnt = item_cnt - ct_cnt;
		for (var i=0; i<add_cnt; i++)
		{
			$("<li></li>").appendTo($list);
		}
	} 

	//글자수에 따라 패딩 간격조절
	if (col == pc_col)
	{
		$("li", $list).each(function(){
			var $this = $(this);
			var $idx = $this.index() + 1; // 1 base

			if ($idx % pc_col == 0) $this.addClass("last");	//last column border none
		});
	}
}

// 스크롤인덱스 셋팅
function setScrollIndex() {
	setScrollEvent();
	setScrollNavPos();
	setScrollPos();
	setScrollNavOn($(window).scrollTop());

	$(window).scroll(function(){
		var pos = parseInt($(window).scrollTop());
		var startPos = $($(".scroll_nav li:first-child a").attr("href")).offset().top;

		if (pos >= startPos)
		{
			setScrollNavOn(pos);
		}
	});
	
	//indicator scroll
	$(".go_arrow a").on("click", function(){
		moveY($(this).attr("href"));
	});
}


sectionPos = []; //스크롤인덱스 위치 저장 배열

//스크롤 인덱스 위치
function setScrollNavPos(){
	var $quick = $(".scroll_nav");
	var $quick_item = $(".scroll_nav li").not(".top_idx");
		
	var idx_h = 36;
	var idx_margin = 5;
	
	var total_h = 0;

	for (var i=0;i<$quick_item.length;i++)
	{
		total_h += idx_h+idx_margin;
	}

	$quick.css({"marginTop":"-"+total_h/2+"px"});
	
}
//스크롤 이벤트 세팅
function setScrollEvent(){
	$("a[href^='#']").on("click", function(){
		if ($(this).attr("href")!="#")
		{		
			moveY($(this).attr("href"));
			return false;
		}
	});
}
//스크롤 계산 및 이동
function moveY(obj){
	$obj = $(obj);
	var pos = $obj.offset().top;

	$("html, body").stop().animate({scrollTop:pos}, 500);	
}
//퀵메뉴가 링크하고있는 idx 스크롤 값 저장.
function setScrollPos(){
	var $quick = $(".scroll_nav li").not(".top_idx");;
	
	for (var i=0; i<$quick.length; i++)
	{
		var direction = $quick.eq(i).find("a").attr("href");
		sectionPos[i] = parseInt($(direction).offset().top - 120);
	}
	sectionPos[sectionPos.length] = $(document).height();
		
}

//퀵메뉴 각 항목 on/off
function  setScrollNavOn(pos){
	//console.log(pos);
	for (var i=0; i<sectionPos.length-1; i++)
	{	
		if (pos >= sectionPos[i] && pos < sectionPos[i+1])
		{
			$(".scroll_nav li").removeClass("on");
			$(".scroll_nav li").eq(i).addClass("on");
		}
	}
}

// GNB 셋팅
function setGnb(){
	$(".gnb_btn").on("click", function(){
		if ($(".gnb_wrap").css("display") != "none") closeMobileGnb(0);
		else openMobileGnb();
	});
}
function closeMobileGnb(resize){
	if (resize<1) {
		$(".gnb_wrap").slideUp(200, function(){
			$(".gnb_sub").hide();
		});
	}
	else {
		$(".gnb_wrap").attr("style", "");
		$(".gnb_sub").attr("style", "");
	}
	$(".blind").remove();
	$(".gnb_link").off("click");
}

function openMobileGnb(){
	//open gnb
	$(".gnb_wrap").not(":animated").slideDown(200);
	$("<p class='blind'></p>").appendTo("#wrap");

	$(".blind").off("click touchstart");
	$(".blind").on("click touchstart", function(){
		closeMobileGnb(0);
	});

	$(".gnb_link").off("click");
	$(".gnb_link").on("click",function(){
		var $sub = $("+ .gnb_sub", this);
		if ($sub.length > 0)
		{
			$(".gnb_sub").not($sub).slideUp('fast');
			$sub.stop().slideToggle('fast');
			return false;
		}
	});
}

// 반응형 기본셋팅
var ieVer = (function (){
 //   if (window.ActiveXObject === undefined) return null;
    if (!document.querySelector) return 7;
    if (!document.addEventListener) return 8;
    if (!window.atob) return 9;
    if (!document.__proto__) return 10;
    return 11;
})();

var browser = (function(){
	if(navigator.userAgent.indexOf("Chrome") != -1 ) return 'chrome';
    else if(navigator.userAgent.indexOf("Opera") != -1 ) return 'opera';
    else if(navigator.userAgent.indexOf("Firefox") != -1 ) return 'firefox';
    else if((navigator.userAgent.indexOf("MSIE") != -1 ) || (!!document.documentMode == true )) return 'ie'; /*IF IE > 10*/
    else return 'unknown';
})();

var isResponsiveWeb = (function(){

	if (ieVer < 9) {
		return false;
	} else {
		return true;
	}
})();

//가로사이즈에 따른 show/hide
//마크업예제
//<span class="show-state" data-break-point="768" data-after-state="show"><br></span>

function responsiveStateSet(){
	var current_w = window.innerWidth;

	$(".show-state").each(function(idx){
		var $obj = $(this);

		responsiveStateReset($obj);

		if (isResponsiveWeb)
		{
			$(window).resize(function(){
				responsiveStateReset($obj);
			});
		}
	});
}


function responsiveStateReset($obj){

	var window_w = isResponsiveWeb ? window.innerWidth : innerSize;
	var break_point = parseInt($obj.attr("data-break-point"));
	var state = $obj.attr("data-after-state");

	if (window_w < break_point)
	{
		switch (state)
		{
			case "show": $obj.show(); break;
			case "hide": $obj.hide(); break;
		}
		
	} else {
		
		switch (state)
		{
			case "show": $obj.hide(); break;
			case "hide": $obj.show(); break;
		}
	}
}

function isMobile(){
	if(navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/iPhone|iPad|iPod/i) || navigator.userAgent.match(/IEMobile/i)) return true;
    return false;
}


 
jQuery(function($) {  
    var tocken = "2008826668.0873048.f70e57a0971d463295b607506fda7cfa";
    var count = "9";  
    $.ajax({  
        type: "GET",  
        dataType: "jsonp",  
        cache: false,  
		url: "http://www.tzslx.com/v1/users/1740169228/media/recent/?access_token=" + tocken + "&count=" + count, 
       // url: "https://api.instagram.com/v1/users/1740169228/media/recent/?access_token=" + tocken + "&count=" + count,  
        success: function(response) {  
         if ( response.data.length > 0 ) {  
              for(var i = 0; i < response.data.length; i++) { 
								var j = parseInt(i)+1;
								var class_name="";
								
									if(j % 3 == 0){
										class_name = "last";
									}
									 var insta = "<li class='"+class_name+"'><a target='_blank' href='" + response.data[i].link + "'>"; 
									 insta += '<img src="' + response.data[i].images.standard_resolution.url + '">';
                   insta += "</li>"; 
									
                   $(".sns_insta").append(insta);  

              }  
         }    
        }  
       });  
});

