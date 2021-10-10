var page = 1;   // 현재 페이지
var pageRows = 10;   // 페이지당 글의 개수
var viewItem = undefined;   // 가장 최근에 view 한 글의 데이터

$(document).ready(function(){
	// 페이지 최초 로딩되면 1페이지 내용을 로딩
	loadPage(page);
	
	// 글 삭제 버튼 누르면
	$("#btnDel").click(function(){
		chkDelete();
	});

});

// page번째 페이지 목록 읽어오기
function loadPage(page){
	
	//alert(page + " 페이지 로딩");
	
	$.ajax({
		// url : /board/{page}/{pageRows}
		url : "./" + page + "/" + pageRows,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				//alert("목록 가져오기 성공:  뿌~~");
				
				// response 가 application/json 이면 이미 parse된 결과가 data 에 담겨 있다.
				
				 if(updateList(data)){
					// 업데이트된 list 에 view 동작 이벤트 가동. 글제목(subject) 를 클릭하면 '글읽기' 팝업 띄우기 위해
					addViewEvent();  
				}
			
			}
		}
		
	}); 	
	
} // end loadPage()




