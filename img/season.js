
//check window's width for iOS safari resize bug
jQuery(document).ready(function($){

	window_w = $(window).width(); 
	
	setTimeout(function(){setScrollIndex();},1000);

	if (winSize <= 767)
	{	
		setSeasonSlider();		//계절별 축제 슬라이드 생성
		destroyGallerySlider();	//갤러리 슬라이드 삭제
		setTimeout(function(){selectSeasons(); }, 100);	//계절 하나만 보기

	} else {
		showAllSeasons();		//모든 계절 보기
		setTimeout(function(){	
			destroySeasonSlider();	//계절별 축제 슬라이드 삭제
			setGallerySlider();		//갤러리 슬라이드 생성
		}, 100);
	}
});


var onceSetSelect = false;
var sliderSettingTimer;

$(window).resize(function(){
	clearTimeout(sliderSettingTimer);
	
	if ($(window).width() != window_w)
	{
		window_w = $(window).width();
		
		
		//리사이즈 도중에 한번만 실행.
		sliderSettingTimer = setTimeout(function(){
			if (winSize <= 767)
			{	
				if (ieVer>9)
				{	
					//ie10 이상
					setSeasonSlider();		//계절별 축제 슬라이드 생성
					destroyGallerySlider();	//갤러리 슬라이드 삭제
				} else {
					//ie9 이하에서 bxslider 제거
					destroyBxGallSlider(); 
				}
				
				setTimeout(function(){selectSeasons();}, 100);	//계절 하나만 보기

			} else {
				setTimeout(function(){	
					
					setGallerySlider();		//갤러리 슬라이드 생성

					if (ieVer>9)
					{	//ie10 이상
						destroySeasonSlider();	//계절별 축제 슬라이드 삭제
					} 
				}, 100);
				
				showAllSeasons();	//모든 계절 보기
			}

		},100);
	}
})

//계절별 축제 슬라이드 생성
function setSeasonSlider(){
	if (ieVer > 9)
	{
		$(".ss_event_slider").each(function(){
			var target = $(this)[0];
			var pager = $(".ss_pager", this)[0];

			var seasonSlider = new Swiper(target, {
	//			touchEventsTarget:'wrapper',
				spaceBetween: 20,
				pagination: pager,
				paginationClickable: true,
				lastSlideMessage: "마지막 게시글입니다.",
				firstSlideMessage: "첫번째 게시글입니다.",
				bulletActiveClass:'ss-pager-active',
				bulletClass:'ss-pager'
			});
		});
	}
}

//계절별 축제 슬라이드 없애기
function destroySeasonSlider(){
	$(".ss_event_slider").each(function(){
		var thisSlider = this.swiper;
		var $thisWrap = $(this);

		if (typeof thisSlider != "undefined")
		{	
			setTimeout(function(){
	//				console.log("Destroy season slider.");
				thisSlider.destroy(true, true);
			},50);
		} 
	});
}

var bxGallSlider = [];
//갤러리 슬라이드 생성
function setGallerySlider(){

	if (ieVer > 9)
	{
		$(".ss_gall_ct").each(function(){
			var target = $(this)[0];
			var prev = $(".ss_gall_nav .prev", $(this))[0];
			var next = $(".ss_gall_nav .next", $(this))[0];

			var gallerySlider = new Swiper(target, {
				slidesPerView: 'auto',
				onlyExternal: true,
				prevButton: prev,
				nextButton: next,
				lastSlideMessage: "마지막 사진입니다.",
				firstSlideMessage: "첫번째 사진입니다."
			});
		});

	} else {
		if (bxGallSlider.length < 1)
		{
			$(".ss_gall").each(function(i){
				bxGallSlider[i] = $(this).bxSlider();
			});
			
		}
		resizeBxGallSlider();
	}
}

//갤러리 슬라이드 리사이징 : bxSlider
function resizeBxGallSlider(){
	var screenWidth = window.innerWidth;
	var photoWidth = 200;
	
	if (screenWidth < 1100 && screenWidth > 767)	{
		photoWidth = 150;
	} else if (screenWidth < 768) {
		destroyBxGallSlider();
		return;
	} 

	$(".ss_gall_ct").each(function(i){
		var $thisGall = $(this);
		var $prev = $('.ss_gall_nav .prev', $thisGall);
		var $next = $('.ss_gall_nav .next', $thisGall);
		bxGallSlider[i].reloadSlider({
			prevSelector: $prev,
			nextSelector: $next,
			slideWidth:photoWidth,
			maxSlides:20,
			minSlides:3,
			slideMargin:1,
			moveSlides:1,
			speed:300,
			pager:false
		});
	});
};

//갤러리 슬라이드 (bxslider) 없애기
function destroyBxGallSlider(){
//	console.log("before bxslider distroy : "+bxGallSlider.length);
	for (var i=0; i<bxGallSlider.length ; i++) {
		bxGallSlider[i].destroySlider();
	}
//	console.log("after bxslider distroy : "+bxGallSlider);
}

//갤러리 슬라이드 없애기
function destroyGallerySlider(){
	$(".ss_gall_ct").each(function(){
		var thisSlider = this.swiper;
		var $thisWrap = $(this);

		if (typeof thisSlider != "undefined")
		{
			setTimeout(function(){
//				console.log("Destroy gallery slider.");
				thisSlider.destroy(true, true);
			},100);
		}
	});
}

//계절 하나만 보기
function selectSeasons(wrapId){
	var idx = (typeof wrapId != "undefined") ? $(wrapId).index(".season_ct") : 0 ;
	var url = location.href;
	var season = url.substring(url.indexOf('#')+1);
	
	switch (season)
	{
		case 'spring': idx=0; break;
		case 'summer': idx=1; break;
		case 'autumn': idx=2; break;
		case 'winter': idx=3; break;
		default : break;
	}
	
	if (!onceSetSelect)
	{	
		//처음 실행.
		onceSetSelect = true;
		$(".ss_slt_nav select option").eq(idx).attr("selected", "selected");
	} else {
		//연속 실행이면서 다시 초기화를 호출할 때는 함수 실행 종료.
		if (typeof wrapId == "undefined") {
			return;
		}
	}

	var $seasons = $(".season_ct");
	var $onSeason = $($(".season_ct")[idx]);

	$seasons.not($onSeason).hide();
	$onSeason.show();
	selectColor(idx+1);
}

//모든 계절 보기
function showAllSeasons(){
	var $seasons = $(".season_ct");
	$seasons.show();

	onceSetSelect = false;
}

//계절 선택(색상변경)
function selectColor(idx){
	var $nav = $(".ss_slt_nav");
	var settingClass = "scroll_nav_slt ss_slt_nav bg0" + idx;
	
	$nav.attr("class", settingClass);
}