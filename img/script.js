var ext = "do";

// 게시판용 첨부파일 다운로드 
function download(idx){
	var frm = document.fileForm;
	frm.idx.value = idx;
	frm.method = "post";
	frm.target = "hiddenFrm";
	frm.action = "/download."+ext;
	frm.submit();	
}

function download2(idx,seq){
	var frm = document.fileForm;
	frm.idx.value = idx;
	frm.seq.value = seq;
	frm.method = "post";
	frm.target = "hiddenFrm";
	frm.action = "/download."+ext;
	frm.submit();	
}

function webDownLoad(filenm){
	var frm = document.fileForm;
	frm.filename.value = filenm;
	frm.target = "hiddenFrm";
	frm.action = "/wedDataDownload."+ext;
	frm.submit();	
}


/* NULL check*/
function fnb_null(obj, msg) {
	if(obj.value.replace(/^\s*/,'') == 0) {
		if(msg) alert(msg);obj.focus();
		return true;
	}
	return false;
}


/* 패스워드 유효성체크  
 *  4 - 12 숫자,문자만
 * */
function chkPwd(str){
	var reg_pwd = /^.*(?=.{4,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	if(!reg_pwd.test(str)){
		return false;
	}
	return true;
}

/*숫자만 입력 가능하게 하는 함수 */
function fn_stripcharval(obj){
	var validstr = "0123456789";
	var ReturnVal = "";
	for (var i = 0; i < obj.value.length; i++){
		if(validstr.indexOf(obj.value.substring(i, i+1)) >= 0){
			ReturnVal=ReturnVal+obj.value.substring(i, i+1);
		}
	}
	obj.value = ReturnVal;
}

//정규 표현식을 사용하여 화이트스페이스를 빈문자로 전환
function trim(str){
   str = str.replace(/^\s*/,'').replace(/\s*$/, ''); 
   return str; //변환한 스트링을 리턴.
}

//email 유효성 검사 
function check_mailValue(gg){
	var checkM = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if (checkM.test(gg)){ 
		return true; 
	}else { 
		return false; 
	}
}


//아이디 입력시 한글, 특수문자 체크
function h_check(Objectname) {
	var strValue = Objectname;
	var re = /[~!@\#$%<>^&*\()\-=+_\']/gi; //특수문자 정규식 변수 선언
 
	for (var i = 0; i < strValue.length; i++) {
		var retCode = strValue.charCodeAt(i);
		var retChar = strValue.substr(i,1).toUpperCase();
		retCode = parseInt(retCode);
  
		//입력받은 값중에 한글이 있으면 에러
		if ( (retChar < "0" || retChar > "9") && (retChar < "A" || retChar > "Z") && ((retCode > 255) || (retCode < 0)) ) {
			return false;
		//입력받은 값중에 특수문자가 있으면 에러
		
		} 
		if(re.test(strValue)) {
			return false;
		}
	}
	return true;
}

// 온라인상담 링크 
function goOnline(sess){
	
	if(sess == ''){
		if (confirm("회원전용 서비스 입니다.\n로그인 하시겠습니까?")) {
			jQuery.goRediectOnLineLoginpage();
		}
	}else{
		location.href= "/cs/online."+ext;
	}
	
}


/************************************************************
* Popup Window Open
************************************************************/
/* 화면 정중앙 */
// html 사용시) <a href="javascript:popCwin('popup.html','popup','450','300','');"></a>
function popCwin( url, name, w, h, scroll) {
	var wl = (window.screen.width/2) - ((w/2) + 10);
	var wt = (window.screen.height/2) - ((h/2) + 50);
	var option = "height="+h+",width="+w+",left="+wl+",top="+wt+",screenX="+wl+",screenY="+wt+",scrollbars="+scroll + ", status=yes";
	commonPopWin = window.open( url, name, option );
	commonPopWin.focus();
}


$(function(){
	
	// 다운로드센터(검색)
	$("#download_Search").click(function(){
		var frm = document.searchForm;
		frm.currentPage.value = 1;
		frm.currentGroup.value = 1;
		frm.method = "get";
		frm.action = "/cs/downloadCenter."+ext;
		frm.submit();
	});
	
	/*
	var browser_title;
	browser_title = $("#brow_page_title").text();
	if(brow_page_title != "") document.title = browser_title + " :: 국제종합기계" ;
	*/
	
	// 동영상 자료.joson
	jQuery.extend({
		goLoginpage	: function(){
			
			var frm = document.login_referer;
			var urlQueryString = window.location.search.substring(-1);       
			var url = "";
			
			if(window.location.pathname == '/member/login.'+ext){
				url = "";
			}else{
				url = window.location.pathname + urlQueryString;
			}
			
			frm.referer.value = url;
			frm.action ="/member/login."+ext;
			frm.method = "get";
			frm.submit();
			
		},
		goRediectOnLineLoginpage	: function(){
			var frm = document.login_referer;
			frm.referer.value = "/cs/online."+ext;
			frm.action ="/member/login."+ext;
			frm.method = "get";
			frm.submit();
			
		},
		goview	:	function(idx){
			var item	= "";
			
			jQuery.ajax({
				url : '/pr/movie_view.json',
				data : {param	:	idx},
				dataType : 'json',
				type : 'POST',
				error : function (xhr, status, e) {
					alert('처리중 문제가 발생하였습니다. \n\r\n\r관리자에게 문의하세요.\n\r\n\r에러메시지 : ' + e);
				},
				success : function (data) {
					if(data != null && data.item != null){
						$(".movieView").empty();
						
						item += "<div class=\"player\">";
						item += data.item.summary;
						item += "</div>";
						item += "<p class=\"subject\"><strong>";
						item += data.item.sbjt;
						item += "</strong></p>";
						item += "<div class=\"summ\">";
						item += data.item.cnts;
						item += "</div>";
						
						$(".movieView").html(item);
					}
				}
			});
		},
		goUserMap	:	function(idx){
			var array = new Array();
			var item	= "";
			
			jQuery.ajax({
				url : '/cs/service_info.json',
				data : {param	:	idx},
				dataType : 'json',
				type : 'POST',
				error : function (xhr, status, e) {
					alert('처리중 문제가 발생하였습니다. \n\r\n\r관리자에게 문의하세요.\n\r\n\r에러메시지 : ' + e);
				},
				success : function (data) {
					if(data != null && data.item != null){
						array[0] = data.item.map_y;
						array[1] = data.item.map_x;
						array[2] = data.item.center_nm;
						
						item += "<div class=\"popupWrap\">";
						item += "	<p class=\"title\"><strong>상세보기</strong></p>";
						item += "	<div  class=\"popup-content\">";
						item += "		<div class=\"mapArea\" id=\"map\"></div>";						
						item += "		<table summary=\"대리점 연락처 상세 정보입니다.\">";
						item += "			<caption class=\"skip\">대리점 상세 정보</caption>";
						item += "			<colgroup>";
						item += "				<col width=\"20%\" />";
						item += "				<col width=\"20%\" />";
						item += "				<col width=\"20%\" />";
						item += "				<col width=\"20%\" />";
						item += "				<col width=\"20%\" />";
						item += "			</colgroup>";
						item += "			<tbody>";
						item += "			<tr>";
						item += "				<th scope=\"col\">지역</th>";
						item += "				<th scope=\"col\">상호</th>";
						item += "				<th scope=\"col\">전화번호</th>";
						item += "				<th scope=\"col\">FAX번호</th>";
						item += "				<th scope=\"col\">휴대번호</th>";
						item += "			</tr>";
						item += "			<tr>";
						item += "				<td>"+data.item.loc02+"</td>";
						item += "				<td>"+data.item.center_nm+"</td>";
						item += "				<td>"+data.item.center_phone+"</td>";
						item += "				<td>"+data.item.center_fax+"</td>";
						item += "				<td>"+data.item.center_mobile+"</td>";
						item += "			</tr>";
						item += "			<tr>";
						item += "				<th scope=\"col\">대표자</th>";
						item += "				<th scope=\"col\" colspan=\"4\">주소</th>";
						item += "			</tr>";
						item += "			<tr>";
						item += "				<td>"+data.item.center_ceo+"</td>";
						item += "				<td colspan=\"4\">"+data.item.center_addr+"</td>";
						item += "			</tr>";
						item += "			</tbody>";
						item += "		</table>";
						item += "		<p class=\"btn\">";
						item += "			<a href=\"javascript:print();\"><img src=\"/static/images/common/img_print_btn.gif\" alt=\"인쇄\" /></a>";
						item += "			<a href=\"javascript:popClose();\"><img src=\"/static/images/common/img_close_btn.gif\" alt=\"닫기\" /></a>";
						item += "		</p>";
						item += "	</div>";
						item += "	<a href=\"javascript:popClose();\" class=\"btn-close\"><img src=\"/static/images/common/img_popupLayer_close.gif\" alt=\"팝업닫기\" /></a>";
						item += "</div>";
					}
					
					$("#popupArea").html(item);
					$("#popupArea").css("display","block");
					jQuery.goMap(array);
					
					
					layer_top = $(window).height() - parseInt($("#popupArea .popupWrap").css("height"));
					if(layer_top/2 > 0){
						$("#popupArea .popupWrap").css("top",layer_top/2 +"px");
					}else if(layer_top/2 <= 0){
						$("#popupArea .popupWrap").css("top","0px");
					}
				}
			});
			
			
		},
		goMap	:	function(array){
			
			var oPoint = new nhn.api.map.LatLng(array[0], array[1]); //LatLng 값이 y, x 좌표
			nhn.api.map.setDefaultPoint('LatLng');
     		oMap = new nhn.api.map.Map('map', { 
       			point : oPoint,
       			zoom : 10, //기본 지도 줌 크기
    		    enableWheelZoom : true,
       			enableDragPan : true,
     			enableDblClickZoom : false,
    			mapMode : 0,
       			activateTrafficMap : false,
     			activateBicycleMap : false,
       			minMaxLevel : [ 1, 14 ],
       			size : new nhn.api.map.Size(718, 348)
      			//표시될 지도 크기
    	   });
    
      		//아래는 위에서 지정한 좌표에 마커를 표시하는 소스 입니다.
            var oSize = new nhn.api.map.Size(28, 37);
            var oOffset = new nhn.api.map.Size(14, 37);
            var oIcon = new nhn.api.map.Icon(
        		'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
        	   oOffset);
    		   
      		//icon 이미지를 바꿔서 사용할 수 있습니다. 
    		var oMarker = new nhn.api.map.Marker(oIcon, {
				zIndex : 1000,
				title : array[2]
    		});
    		
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
    		
			
    		//아래는 사이드에 줌 컨트롤을 추가하는 소스 입니다.
    		var mapZoom = new nhn.api.map.ZoomControl(); // 줌 컨트롤 선언
    		mapZoom.setPosition({
    			left : 15,
    			bottom : 30
    		}); // - 줌 컨트롤 위치 지정
    		oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
			
			var oLabel = new nhn.api.map.MarkerLabel();
			oMap.addOverlay(oLabel);
			
			oMap.attach('mouseenter', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(true,oTarget);
				}
            });
			oMap.attach('mouseleave', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(false,oTarget);
				}
            });
		},
		goLogin	: function(){
			
			var obj = document.regForm;
			var referer = obj.referer.value;
			if(fnb_null(obj.member_id, '아이디를 입력하세요.')) return;
			if(fnb_null(obj.member_pwd, '비밀번호를 입력하세요.')) return;
			
			jQuery.ajax({
				url : '/member/login_proc.json',
				dataType : 'json',
				type : 'get',
				data : {param01 : $('#member_id').val() , param02 : $('#member_pwd').val()},
				success : function (data) {
					if(data.b_member == false){
						alert('탈퇴회원 또는 아이디/ 비밀번호가 일치하지 않습니다.');
						$('#member_id').focus();
						return false;
						
					}else{
						
						if(data.pass_find_yn == 'Y'){
							location.href = "/member/mypage."+ext;
						}else{
							if(referer == ""){
								location.href = "/main."+ext;
							}else{
								location.href = referer;
							}
						}
					}
				},
				error : function (xhr, status, e) {
					alert('처리중 문제가 발생하였습니다. \n\r\n\r관리자에게 문의하세요.\n\r\n\r에러메시지 : ' + e);
				}
			});
			
		},
		businessMap01	:	function(){
			var map_width = 928;
			var map_height = 399;
			
			var oPoint = new nhn.api.map.LatLng(36.2970934, 127.5632764); //LatLng 값이 y, x 좌표
			nhn.api.map.setDefaultPoint('LatLng');
     		oMap = new nhn.api.map.Map('map', { 
       			point : oPoint,
       			zoom : 10, //기본 지도 줌 크기
    		    enableWheelZoom : true,
       			enableDragPan : true,
     			enableDblClickZoom : false,
    			mapMode : 0,
       			activateTrafficMap : false,
     			activateBicycleMap : false,
       			minMaxLevel : [ 1, 14 ],
       			size : new nhn.api.map.Size(map_width, map_height)
      			//표시될 지도 크기
    	   });
     		
     		var maskWidth = $(document).width();
     		if(maskWidth < 500){ 
     			var move_width = (map_width - maskWidth)/2;
     			var tempZoomOptions = { useEffect : true, centerMark : true }; // - 줌 옵션을 설정합니다.
	     		oMap.setCenterBy(move_width, 0, tempZoomOptions); // - 20 pixel 만큼 오른쪽으로 이동합니다.
			}
		
      		//아래는 위에서 지정한 좌표에 마커를 표시하는 소스 입니다.
            var oSize = new nhn.api.map.Size(28, 37);
            var oOffset = new nhn.api.map.Size(14, 37);
            var oIcon = new nhn.api.map.Icon(
        		'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
        	   oOffset);
    		   
      		//icon 이미지를 바꿔서 사용할 수 있습니다. 
    		var oMarker = new nhn.api.map.Marker(oIcon, {
				zIndex : 1000,
				title : "국제종합기계"
    		});
    		
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
    		
			
    		//아래는 사이드에 줌 컨트롤을 추가하는 소스 입니다.
    		var mapZoom = new nhn.api.map.ZoomControl(); // 줌 컨트롤 선언
    		mapZoom.setPosition({
    			left : 15,
    			bottom : 30
    		}); // - 줌 컨트롤 위치 지정
    		oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
			
			var oLabel = new nhn.api.map.MarkerLabel();
			oMap.addOverlay(oLabel);
			
			oMap.attach('mouseenter', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(true,oTarget);
				}
            });
			oMap.attach('mouseleave', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(false,oTarget);
				}
            });
		},
		businessMap02	:	function(){
			var map_width = 462;
			var map_height = 400;
			
			var oPoint = new nhn.api.map.LatLng(36.2970934, 127.5632764); //LatLng 값이 y, x 좌표
			nhn.api.map.setDefaultPoint('LatLng');
     		oMap = new nhn.api.map.Map('map2', { 
       			point : oPoint,
       			zoom : 10, //기본 지도 줌 크기
    		    enableWheelZoom : true,
       			enableDragPan : true,
     			enableDblClickZoom : false,
    			mapMode : 0,
       			activateTrafficMap : false,
     			activateBicycleMap : false,
       			minMaxLevel : [ 1, 14 ],
       			size : new nhn.api.map.Size(map_width, map_height)
      			//표시될 지도 크기
    	   });
     		
     		var maskWidth = $(document).width();
     		if(maskWidth < 500){ 
     			var move_width = (map_width - maskWidth)/2;
     			var tempZoomOptions = { useEffect : true, centerMark : true }; // - 줌 옵션을 설정합니다.
	     		oMap.setCenterBy(move_width, 0, tempZoomOptions); // - 20 pixel 만큼 오른쪽으로 이동합니다.
			}
		
      		//아래는 위에서 지정한 좌표에 마커를 표시하는 소스 입니다.
            var oSize = new nhn.api.map.Size(28, 37);
            var oOffset = new nhn.api.map.Size(14, 37);
            var oIcon = new nhn.api.map.Icon(
        		'http://static.naver.com/maps2/icons/pin_spot2.png', oSize,
        	   oOffset);
    		   
      		//icon 이미지를 바꿔서 사용할 수 있습니다. 
    		var oMarker = new nhn.api.map.Marker(oIcon, {
				zIndex : 1000,
				title : "국제종합기계"
    		});
    		
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);
    		
			
    		//아래는 사이드에 줌 컨트롤을 추가하는 소스 입니다.
    		var mapZoom = new nhn.api.map.ZoomControl(); // 줌 컨트롤 선언
    		mapZoom.setPosition({
    			left : 15,
    			bottom : 30
    		}); // - 줌 컨트롤 위치 지정
    		oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
			
			var oLabel = new nhn.api.map.MarkerLabel();
			oMap.addOverlay(oLabel);
			
			oMap.attach('mouseenter', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(true,oTarget);
				}
            });
			oMap.attach('mouseleave', function(oEvent) {
            	var oTarget = oEvent.target;
				if(oTarget instanceof nhn.api.map.Marker){
					oLabel.setVisible(false,oTarget);
				}
            });
		},
		goService	:	function(){
			var currentPage = 1;
			var currentGroup = 1;
			var search = $("#searchkind").val();
			
			var array = new Array();
			array[0] = currentPage;
			array[1] = currentGroup;
			array[2] = search;
			
			jQuery.serviceCenterList(array);
		},
		goServicePaging		:	function(currentPage,currentGroup){
			
			var search = $("#searchkind").val();
			var array = new Array();
			array[0] = currentPage;
			array[1] = currentGroup;
			array[2] = search;
			jQuery.serviceCenterList(array);
		},
		serviceCenterList	:	function(array){
			jQuery.showLoadingLayer("body");
			var paging	=	"";
			var item = "";
			jQuery.ajax({
				url : '/cs/service_list.json',
				data : {currentPage	:array[0],currentGroup	:	array[1],search	:array[2]},
				dataType : 'json',
				type : 'POST',
				error : function (xhr, status, e) {
					alert('처리중 문제가 발생하였습니다. \n\r\n\r관리자에게 문의하세요.\n\r\n\r에러메시지 : ' + e);
				},
				success : function (data) {
					if(data != null && data.list != null){
						
						item += "<table summary=\"대리점 연락처 상세 정보입니다.\">";
						item += "	<caption class=\"skip\">대리점 상세 정보</caption>";
						item += "	<colgroup>";
						//item += "		<col width=\"7%\" />";
						item += "		<col width=\"20%\" />";
						item += "		<col width=\"*\" />";
						item += "		<col width=\"12%\" />";
						item += "		<col width=\"12%\" />";
						item += "		<col width=\"12%\" />";
						item += "		<col width=\"6%\" />";
						item += "	</colgroup>";
						item += "	<thead>";
						item += "	<tr>";
					//	item += "		<th scope=\"col\">지역</th>";
						item += "		<th scope=\"col\">상호</th>";
						item += "		<th scope=\"col\">주소</th>";
						item += "		<th scope=\"col\">전화번호</th>";
						item += "		<th scope=\"col\">FAX번호</th>";
						item += "		<th scope=\"col\">휴대번호</th>";
						item += "		<th scope=\"col\">상세</th>";
						item += "	</tr>";
						item += "	</thead>";
						item += "	<tbody>";
						
						jQuery.each(data.list, function(index, obj) {
							item += "<tr>";
						//	item += "	<td>"+obj.loc_nm+"</td>";
							item += "	<td>"+obj.center_nm+"</td>";
							item += "	<td class=\"txt_l\">"+obj.center_addr+"</td>";
							item += "	<td>"+obj.center_phone+"</td>";
							item += "	<td>"+obj.center_fax+"</td>";
							item += "	<td>"+obj.center_mobile+"</td>";
							item += "   <td><a href=\"javascript:fnb.goView('"+obj.service_idx+"');\"><img src=\"/static/images/cs/img_btn_view.gif\" alt=\"상세정보 더보기\" /></a></td>";
							item += "</tr>";
						});
						
						item += "	</tbody>";
						item += "	</table>";
					}
					
					// 페이징 
					if(data != null && data.paging != null){
						paging = data.paging;
					}
					
				}
			});
			
			setTimeout(function() {
				$("#listpaging").empty();
				$(".section02").empty();
				
				$("#listpaging").append(paging);
				$(".section02").append(item);
				jQuery.hideLoadingLayer();
			},1000*2);
		}
		
	});
});




