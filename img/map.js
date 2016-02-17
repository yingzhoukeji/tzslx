
	var tab_col;	//구역 인덱스 열 갯수

	jQuery(document).ready(function($){
/*		var window_w = isResponsiveWeb ? window.innerWidth : innerSize;
		
		tab_col = (window_w < 1100) ? 6 : 4; //화면 크기에 따라 구역 인덱스 열 갯수가 달라짐.
		alignLocalName(tab_col); //구역 인덱스 나열

		setLocalPosition();	//구역 위치 초기화 및 이벤트 셋팅*/
		
	});
	
	$(window).resize(function(){
		var window_w = isResponsiveWeb ? window.innerWidth : innerSize;
		
		tab_col = (window_w < 1100) ? 6 : 4;

		//구역 위치 재배치
		$(".map_idcator").each(function(idx){
			var pos = $(this).data();
			var newPos = new mpos(pos.x, pos.y);
			$(this).css({left:newPos.x, top:newPos.y});	//set position of indicator
		});
		
		//구역 인덱스 재배치
		alignLocalName(tab_col);
	});

	//구역 위치 표시 초기화, 이벤트셋팅
	function setLocalPosition(){

		changeLocalPosition($(".prevw_name li:first-child a"));
		$(".prevw_name a").on("click", function(){
			
			//개발추가(최민이) start
			var idx = $(this).attr("idx");
			ane_view(idx);
			//개발추가(최민이) end

			changeLocalPosition($(this));
			if ($(this).attr("href") == "#")  return false; 
		});
	}
	
	//구역 위치 변경
	function changeLocalPosition($anchor) {

		var $map_view = $(".prevw_map");
		var pos =$anchor.data();	//position of indicator
		var pos_cnt = pos.posX.length <= pos.posY.length ? pos.posX.length : pos.posY.length; //num of indicator
		
		$(".map_idcator").remove(); //indicator initialize

		for (var i=0; i<pos_cnt; i++)
		{
			$("<span class='map_idcator' data-x='0', data-y='0'></span>").appendTo($map_view); //add indicator
		}

		$(".map_idcator").each(function(idx){
			var posX = pos.posX[idx];	//position x
			var posY = pos.posY[idx];	//position y
			var newPos = new mpos(posX, posY);
			$(this).attr("data-x", posX);
			$(this).attr("data-y", posY); //indicator 에는 좌표 원래 값을 기록해 둠.

			$(this).css({left:newPos.x, top:newPos.y});	//set position of indicator
		});

		$(".prevw_name li").removeClass("on");	//set on
		$anchor.parent("li").addClass("on");

	}

	//구역 위치 좌표 오브젝트
	function mpos(ix,iy){
		var window_w = isResponsiveWeb ? window.innerWidth : innerSize;
		if (window_w < 1100)
		{
			var map_w = $(".prevw_map").innerWidth();
			var map_h = $(".prevw_map").innerWidth() * 0.5969738651994498;
			var new_x = ix * map_w / 727;
			var new_y = iy * map_h / 429;
			this.x = new_x;
			this.y = new_y;
			
		} else {		
			this.x = ix;
			this.y = iy;
		}
	}

	//구역 명칭 정렬
	function alignLocalName(col){
		var $names = $(".prevw_name");
		
		//칸 채움 용 빈 li 삭제
		$("li",$names).each(function(idx){
			if ($(this).html()=="") $(this).remove();
		});

		var ct_cnt = $("li", $names).size(); //컨텐츠가 있는 list 수
		var str_max = 5;
		var line_cnt = (ct_cnt%col == 0) ? ct_cnt/col : parseInt(ct_cnt/col) + 1;
		var item_cnt = col * line_cnt; //총 list 수
		

		if (ct_cnt < item_cnt) {
			//라인수에 맞도록 칸 채우기
			var add_cnt = item_cnt - ct_cnt;
			for (var i=0; i<add_cnt; i++)
			{
				$("<li></li>").appendTo($names);
			}
		} 

		//글자수에 따라 패딩 간격조절
		if (col < 5)
		{
			$("li", $names).each(function(){
				var $this = $(this);
				var $idx = $this.index() + 1; // 1 base
				var str = $("a", $this).text();

				if ($idx % col == 0) $this.addClass("br0");	//last column border none
				if (str.length > str_max) $this.addClass("mt_line");	//set padding if text is 2 lines.
			});
		}
	}



	//지도 크게보기 링크
	function goZoomMap() {
		 var params  = 'width='+(screen.width-20);
		 params += ', height='+(screen.height-80);
		 params += ', top=0, left=0'
//		 params += ', fullscreen=yes';


		if (isMobile() || !isResponsiveWeb)
		{	//모바일이거나 ie8 이하일 경우 이미지만 띄움
			window.open("map_zoom.jpg",'zoom_of_map', params);
		} else {
			//ie9 이상에서 zoom 지원.
			window.open("map_zoom.php",'zoom_of_map', params);
		}

	}