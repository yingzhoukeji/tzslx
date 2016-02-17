//팝업열기
var popSwitch = false;
function openFitPop(pop_name, idx, pagenum){
	var pop_class = (typeof pop_name != "undefined") ? ".common_pop." + pop_name : ".common_pop";

	var $pop= $(pop_class);

	if(pop_name == "ss_pop"){
		var url = "/html/goods_view.php";
	}else{
		var url = "/html/gallery_view.php";
	}

		if(!pagenum){ pagenum = 0; }

		$.ajax({
			url: url,
			data: {idx: idx, pagenum: pagenum},
			async: true,
			cache: false,
			error: function(xhr){
			},
			success: function(data){
				$pop.html(data);
				if(data){
					if (!popSwitch)
					{
						$pop.fadeIn('fast');
						setTimeout(function(){
							fitPopHeight();
						},50);
					} else {
						fitPopHeight();
					}
					$("html").addClass("no-scroll");
				}
				
				popSwitch = true;
			}
		});

}
//팝업닫기
function closeFitPop(){
	var $pop= $(".common_pop");
	$pop.fadeOut('fast', function(){
		$("html").removeClass("no-scroll");
		setTimeout(function(){$("*", $pop).attr("style", "");},200);

		popSwitch = false;
	});
}

//팝업 사이즈 조절 메소드
function fitPopHeight(){
	var $pop = $(".common_pop .pop_wrap").not(":hidden");
	var $pop_txt = $(".pop_txt", $pop);
	var $pop_photo = $(".pop_photo", $pop);

	//스타일 초기화
//	$pop.attr("style","");
//	$pop_txt.attr("style", "");
	
	//창높이와 컨텐츠 높이계산
	var pop_h = $pop.height();
	var photo_h = $pop_photo.height();
	var sum_pd = parseInt($("> div",$pop).css("paddingTop")) + parseInt($("> div",$pop).css("paddingBottom")) + parseInt($pop_txt.css("marginTop"));

	var win_w = window.innerWidth;
	var landscape = ((win_w/window.innerHeight) < 1.8) ? false : true;	//가로세로비율

	var win_h = landscape ? window.innerHeight : window.innerHeight - 30;

	var txt_h = (pop_h > win_h) ? win_h - sum_pd - photo_h : $pop_txt.height();
	$pop_txt.height(txt_h);
	

	if (!landscape)
	{
		if (win_w < 1100)
		{
			setTimeout(function(){
				pop_h = $pop.height();

				$pop.css({
					marginTop:"-"+(pop_h/2-15)+"px"
				});
			},5);
		}
		
	} else {
		$pop.css({"marginTop":0});
	}

	if (win_w > 1099)
	{
		$pop.attr("style","");
//		$pop_txt.attr("style","");
	}
	
}

var popResizingTimer;
$(window).resize(function(){
	clearTimeout(popResizingTimer);
	if (isMobile())
	{
		if ($(window).width()!=window_w)
		{
			window_w = $(window).width();
			popResizingTimer = setTimeout(function(){fitPopHeight();},100);
		}
	} else {
		popResizingTimer = setTimeout(function(){fitPopHeight();},100);
	}
	
});

