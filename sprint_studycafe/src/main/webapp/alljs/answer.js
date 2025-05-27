
function answerUpdate() {
	alert("answerUpdate");
	
	let board_no = document.getElementById('board_no').value
	let content = document.getElementById('content').value
    let url = `/sprint_studycafe/board/answerUpdate`
    
    let data = {
		'board_no' : board_no,
		'content'  : content
	}
	
	return new Promise((resolve, reject) => {
	    // jQuery 로 AJAX 요청
	    $.ajax({
	        type            : 'POST',                 // 요청 메소드
	        url             : url,                    // 요청 URL
			data            : data,					  // 요청 데이터
			contentType     : 'application/json',     // 요청 데이터 타입
			dataType        : 'html',                 // 응답 데이터 타입
	        // 요청 성공 
			success         : function(response, status) {
			    // response : 응답 데이터
			    // status   : 응답 상태
			    if( response == '' ) {
			        alert('응답 메시지가 없습니다')
			    }
			    resolve(response == 'true' ? true : false) ;
				// document.getElementById('content').value = response ;
			},
			// 에러
			error           : function(xhr, status) {
			    // xhr      : XMLHttpRequest 객체
			    // status   : 응답 상태
			    alert('에러 발생')
			    reject('error')
			}
	    })
	})
	
}