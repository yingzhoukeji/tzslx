$(function(){
	
	/*제품소개-lnb-하위메뉴 open/close
	$("#lnb li .sub_pd li dl dt a").click(function(){
		alert("pass");
		
		if($(this).parent().parent().parent().attr("class")=="open"){
			$(this).parent().parent().parent().removeClass("open");
		}else{
			$(this).parent().parent().parent().siblings().removeClass("open");
			$(this).parent().parent().parent().addClass("open");
		}
		return false;
		
		//alert("111");
	});
*/
	jQuery.extend({
		moveLNB		:	function(f){
			if( f == '1'){
				$("#lnb li .sub_pd li dl dt a.tractor_link01").parent().parent().parent().addClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link02").parent().parent().parent().removeClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link03").parent().parent().parent().removeClass("open");
			}else if( f == '2'){
				$("#lnb li .sub_pd li dl dt a.tractor_link01").parent().parent().parent().removeClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link02").parent().parent().parent().addClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link03").parent().parent().parent().removeClass("open");
			}else if( f == '3'){
				$("#lnb li .sub_pd li dl dt a.tractor_link01").parent().parent().parent().removeClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link02").parent().parent().parent().removeClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link03").parent().parent().parent().addClass("open");
			}else{
				$("#lnb li .sub_pd li dl dt a.tractor_link01").parent().parent().parent().addClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link02").parent().parent().parent().removeClass("open");
				$("#lnb li .sub_pd li dl dt a.tractor_link03").parent().parent().parent().removeClass("open");
			}
		},
		product_lnb	:	function(seq,cate){
			var tractors_item 		= "";
			var combine_item 		= "";
			var transplanter_item 	= "";
			var engine_item = "";
			var num01 = "",num02 = "",num03 = "";
			var combine_cnt = 0,transplanter_cnt = 0,engine_cnt = 0;
			var combine_row = 0,transplanter_row = 0,engine_row = 0;
			var addclass01,addclass02;
			jQuery.ajax({
				url : '/product/allproduct.json',
				data : {},
				dataType : 'json',
				type : 'POST',
				error : function (xhr, status, e) {
					alert('처리중 문제가 발생하였습니다. \n\r\n\r관리자에게 문의하세요.\n\r\n\r에러메시지 : ' + e);
				},
				success : function (data) {
					// 트렉터 파싱 
					
					if(data.tractorsList01 != null){
						jQuery.each(data.tractorsList01, function(index, obj) {
							if(index == 0) num01 = obj.category_dtil;
						});
						
						if(num01 ==  cate){
							tractors_item += "<li class='open'>";
						}else{
							tractors_item += "<li>";
						}
						
						tractors_item += "	<dl>";
						tractors_item += "		<dt><a class='tractor_link01' href=\"javascript:;\" onclick=\"jQuery.moveLNB('1');\">소형 트랙터</a></dt>";
						jQuery.each(data.tractorsList01, function(index, obj) {
							
							if(seq == obj.product_idx){
								addclass01 = " on";
								addclass02 = " class='on'";
							}else{
								addclass01 = "";
								addclass02 = "";
							}
							
							if(index == 0){
								tractors_item += "<dd class=\"first"+addclass01+"\">";
							}else{
								if(data.tractorsList01.length - index == 1){
									tractors_item += "<dd class=\"last"+addclass01+"\">";
								}else{
									tractors_item += "<dd"+addclass02+">";
								}
							}
							
																	
							tractors_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
							tractors_item += obj.hpower + "<span>"+obj.summary+"</span></a>";
							tractors_item += "</dd>";
						});
						tractors_item += "	</dl>";
						tractors_item += "</li>";
					}
					
					if(data.tractorsList02 != null){
						jQuery.each(data.tractorsList02, function(index, obj) {
							if(index == 0) num02 = obj.category_dtil;
						});
						
						if(num02 ==  cate){
							tractors_item += "<li class='open'>";
						}else{
							tractors_item += "<li>";
						}
						
						tractors_item += "	<dl>";
						tractors_item += "		<dt><a href=\"javascript:;\" class='tractor_link02' onclick=\"jQuery.moveLNB('2');\">중형 트랙터</a></dt>";
						
						jQuery.each(data.tractorsList02, function(index, obj) {
							if(seq == obj.product_idx){
								addclass01 = " on";
								addclass02 = " class='on'";
							}else{
								addclass01 = "";
								addclass02 = "";
							}
							
							if(index == 0){
								tractors_item += "<dd class=\"first"+addclass01+"\">";
							}else{
								if(data.tractorsList02.length - index == 1){
									tractors_item += "<dd class=\"last"+addclass01+"\">";
								}else{
									tractors_item += "<dd"+addclass02+">";
								}
							}											
							tractors_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
							tractors_item += obj.hpower + "<span>"+obj.summary+"</span></a>";
							tractors_item += "</dd>";
							
						});
						tractors_item += "	</dl>";
						tractors_item += "</li>";
					}
					
					if(data.tractorsList03 != null){
						jQuery.each(data.tractorsList03, function(index, obj) {
							if(index == 0) num03 = obj.category_dtil;
						});
						
						if(num03 ==  cate){
							tractors_item += "<li class='open'>";
						}else{
							tractors_item += "<li>";
						}
						
						
						tractors_item += "	<dl>";
						tractors_item += "		<dt><a href=\"javascript:;\" class='tractor_link03' onclick=\"jQuery.moveLNB('3');\">대형 트랙터</a></dt>";
						jQuery.each(data.tractorsList03, function(index, obj) {
							
							if(seq == obj.product_idx){
								addclass01 = " on";
								addclass02 = " class='on'";
							}else{
								addclass01 = "";
								addclass02 = "";
							}
							
							if(index == 0){
								tractors_item += "<dd class=\"first"+addclass01+"\">";
							}else{
								if(data.tractorsList03.length - index == 1){
									tractors_item += "<dd class=\"last"+addclass01+"\">";
								}else{
									tractors_item += "<dd"+addclass02+">";
								}
							}											
							tractors_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
							tractors_item += obj.hpower + "<span>"+obj.summary+"</span></a>";
							tractors_item += "</dd>";
						});
						tractors_item += "	</dl>";
						tractors_item += "</li>";
					}
					
					
					
					combine_item += "<li>";
					combine_item += "	<dl>";
					combine_item += "	<dt><a href=\"/product/combine."+ext+"\">콤바인</a></dt>";
					
					transplanter_item += "<li>";
					transplanter_item += "	<dl>";
					transplanter_item += "	<dt><a href=\"/product/transplanter."+ext+"\">이앙기</a></dt>";
					
					engine_item += "<li>";
					engine_item += "	<dl>";
					engine_item += "	<dt><a href=\"/product/engine."+ext+"\">디젤엔진</a></dt>";
					
					if(data.productList != null){
						jQuery.each(data.productList, function(index, obj) {
							if(obj.cd_dtil == "2") combine_cnt++;
							if(obj.cd_dtil == "3") transplanter_cnt++;
							if(obj.cd_dtil == "4") engine_cnt++;

						});
						
						
						jQuery.each(data.productList, function(index, obj) {
							if(obj.cd_dtil == "2"){
								if(seq == obj.product_idx){
									addclass01 = " on";
									addclass02 = " class='on'";
								}else{
									addclass01 = "";
									addclass02 = "";
								}
								
								if(combine_row == 0){
									combine_item += "<dd class=\"first"+addclass01+"\">";
								}else{
									if(combine_cnt - combine_row == 1){
										combine_item += "<dd class=\"last"+addclass01+"\">";
									}else{
										combine_item += "<dd"+addclass02+">";
									}
								}
								combine_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
								combine_item += obj.hpower + "<span>"+obj.summary+"</span></a>";
								combine_item += "</dd>";
								combine_row++;
							}
							
							if(obj.cd_dtil == "3"){

								if(seq == obj.product_idx){
									addclass01 = " on";
									addclass02 = " class='on'";
								}else{
									addclass01 = "";
									addclass02 = "";
								}
								
								if(transplanter_row == 0){
									transplanter_item += "<dd class=\"first"+addclass01+"\">";
								}else{
									if(transplanter_cnt - transplanter_row == 1){
										transplanter_item += "<dd class=\"last"+addclass01+"\">";
									}else{
										transplanter_item += "<dd"+addclass02+">";
									}
								}
								transplanter_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
								transplanter_item += "<span>"+obj.summary+"</span></a>";
								transplanter_item += "</dd>";
								transplanter_row++;
							}
							
							if(obj.cd_dtil == "4"){
								if(seq == obj.product_idx){
									addclass01 = " on";
									addclass02 = " class='on'";
								}else{
									addclass01 = "";
									addclass02 = "";
								}
								
								if(engine_row == 0){
									engine_item += "<dd class=\"first"+addclass01+"\">";
								}else{
									if(engine_cnt - engine_row == 1){
										engine_item += "<dd class=\"last"+addclass01+"\">";
									}else{
										engine_item += "<dd"+addclass02+">";
									}
								}
								engine_item += "<a href=\"#\" onclick=\"$.product_move('"+obj.product_idx+"','"+obj.cd_dtil+"');return false;\">";
								engine_item += "<span>"+obj.summary+"</span></a>";
								engine_item += "</dd>";
								engine_row++;
							}
						});
					}
					
					combine_item += "	</dl>";
					combine_item += "</li>";
					
					transplanter_item += "	</dl>";
					transplanter_item += "</li>";
					
					engine_item += "	</dl>";
					engine_item += "</li>";
					
					$("#product_lnb_01").html(tractors_item);
					$("#product_lnb_02").html(combine_item);
					$("#product_lnb_03").html(transplanter_item);
					$("#product_lnb_04").html(engine_item);
				}
			});
			
		},
		
		product_move	:	function(idx,type){
			var url = "";
			if(type == '1'){
				url = "/product/tractors_view."+ext;
			}else if(type == '2'){
				url = "/product/combine_view."+ext;
			}else if(type == '3'){
				url = "/product/transplanter_view."+ext;
			}else if(type == '4'){
				url = "/product/engine_view."+ext;
			}else if(type == '5'){
				url = "/product/veggietransplanter_view."+ext;
			}
			if(url != "") location.href = url + "?product_idx="+idx;
		},
		// 자동 ROWSPAN(줄수,테그(td,th)
		fnbTableRowsPan: function(index,tagnm) {
			var RowspanTd = false; 
			var RowspanText = false; 
			var RowspanCount = 0; 
			var Rows = $('tbody  tr', '#dataList'); 
		
			jQuery.each(Rows, function() { 
				var This = $(tagnm, this)[index]; 
				var text = $(This).text(); 
		
				if(RowspanTd == false) { 
					RowspanTd = This; 
					RowspanText = text; 
					RowspanCount = 1; 
				}else if(RowspanText != text) { 
					$(RowspanTd) .attr('rowSpan', RowspanCount); 
					RowspanTd = This; 
					RowspanText = text; 
					RowspanCount = 1; 
				}else{ 
					$(This) 
					.remove(); 
					RowspanCount++; 
				} 
			}); 
			
			// 반복 종료 후 마지막 rowspan 적용 
			$(RowspanTd) 
			.attr('rowSpan', RowspanCount); 
		}
	});
	
	
	
	
});