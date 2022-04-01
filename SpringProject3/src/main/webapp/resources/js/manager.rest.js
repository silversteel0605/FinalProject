const camp = document.getElementById('camp');
const camp_sub = document.getElementById('camp_submit');
const camp_srch = document.getElementById('camp_search');
const camp_selc = document.getElementById('camp_selc');
const camp_add = document.getElementById('camp_add');
const search_tab = document.getElementById('pills-home-tab');
const add_tab = document.getElementById('pills-profile-tab');

$(document).ready(function(){
	getMemberList(1);
})

$('#member').click(function() {
		uri = 'member_type=0';
		getMemberList(1);
		
})

$('#Bmember').click(function() {
	uri = 'member_type=1';
	getBMemberList(1);
})

$('#comment').click(function() {
	uri = '';
	getCommentList(1);
})

$('#review').click(function() {
	uri = '';
	getReviewList(1);
})

$('#sup').click(function() {
	uri = 'board_class=1';
	getSupList(1);
})

$('#board').click(function() {
	uri = 'board_class=0';
	getBoardList(1);
})

$('#member_sub').click(function() {
	let name = $('#member_search').val();
	uri = 'member_type=0&'+`member_name=${name}`;
	getMemberList(1);
})

$('#Bmember_sub').click(function() {
	let name = $('#Bmember_search').val();
	let permit = $('#Bm_selc').val();
	uri = 'member_type=1&'+`member_id=${name}${permit}`;
	getBMemberList(1);
})

$('#Bm_selc').change(function() {
	let permit = $('#Bm_selc').val();
	uri =  `member_type=1${permit}`;
	getBMemberList(1);
})

$('.decl_selc').change(function(e) {
	var name = e.target.name;
	var value = e.target.value;
	var index = uri.indexOf('&order');
	if(index > -1) {
		uri = uri.substr(0, index) + value;
	} else {
		uri += value;
	}
	console.log(uri);
	selectPage(name, 1);
})

camp_sub.addEventListener('click', () => {
	uri = `searchTy=condition&${camp_selc.value}=${camp_srch.value}`
	getCampingList(1);
})

camp.addEventListener('click', () => {
	uri='';
	getCampingList(1);
})

camp_add.addEventListener('click', () => {
	setData();
	insertCampingInfo();
})

$('#pills-home-tab').click(function() {
	$('#camp_selc').show();
	$('#paging').show();
})
$('#pills-profile-tab').click(function() {
	console.log('hello')
	$('#camp_selc').hide();
	$('#paging').hide();
})


//utils


function campingBtn(btn) {
	var tr = $(btn).parent().parent();
	var td = tr.children();
	var contentId = td.eq(2).text();
	if (btn.innerText === '수정') {
		makeUpdateWindow(contentId);
	} else {
		deleteCamping(contentId);
	}
}
 
function makeUpdateWindow(contentId) {
	var popupWidth = 1000;
	var popupHeight = 800;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	
	window.open(`updateWindow?contentId=${contentId}`, 'update', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

function Unix_timestamp(t){
    var date = new Date(t);
    var year = date.getFullYear();
    var month = "0" + (date.getMonth()+1);
    var day = "0" + date.getDate();
    var hour = "0" + date.getHours();
    var minute = "0" + date.getMinutes();
    var second = "0" + date.getSeconds();
    return year + "/" + month.substr(-2) + "/" + day.substr(-2);
}

//ajax


function getBoardList(nowPage) {
	$("#board_body").empty();

	$.ajax({
	  url: `${Url}/manager/post?nowPage=${nowPage}&${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(support => {
			$('#board_body').append('<tr class="post">' 
			+ '<td>' + support.rownumber + '</td>' 
			+ '<td>' + support.post_id + '</td>' 
			+ '<td>' + support.member_id + '</td>' 
			+ '<td>' + support.title + '</td>' 
			+ '<td>' + support.reg_date + '</td>'
			+ '<td><button type="button" class="btn btn-link" onclick="goTo(this)">글보기</button></td>'
			+ '</tr>');
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}
		pagination(total, nowPage, 10, 10);
		drawPage('board');
	});	
}

function getSupList(nowPage) {
	$("#sup_body").empty();

	$.ajax({
	  url: `${Url}/manager/post?nowPage=${nowPage}&${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(support => {
			$('#sup_body').append('<tr class="post">' 
			+ '<td>' + support.rownumber + '</td>' 
			+ '<td>' + support.post_id + '</td>' 
			+ '<td>' + support.member_id + '</td>' 
			+ '<td>' + support.title + '</td>' 
			+ '<td>' + support.reg_date + '</td>'
			+ '<td><button type="button" class="btn btn-link" onclick="goTo(this)">글보기</button></td>'
			+ '</tr>');
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}
		pagination(total, nowPage, 10, 10);
		drawPage('sup');
	});	
}


function getReviewList(nowPage) {
	$("#review_body").empty();

	$.ajax({
	  url: `${Url}/manager/review?nowPage=${nowPage}${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(review => {

			$('#review_body').append('<tr class="review">' 
			+ '<td>' + review.rn + '</td>' 
			+ '<td>' + review.review_id + '</td>' 
			+ '<td>' + review.title + '</td>' 
			+ '<td>' + review.review + '</td>' 
			+ '<td>' + Unix_timestamp(review.reg_date) + '</td>'
			+ '<td><button type="button" class="btn btn-link" onclick="goTo(this)">글보기</button></td>'
			+ '</tr>');
			console.log(review.reg_date);
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}
		pagination(total, nowPage, 10, 10);
		drawPage('review');
	});	
}

function permitting(btn) {
	var tr = $(btn).parent().parent();
	var td = tr.children();
	var member_id = td.eq(1).text();
	const data = JSON.stringify({
		"member_id" : member_id
		});
	$.ajax({
	   url: `${Url}/manager/member`,
		  type: "put",
		  dataType: "json",
		  data : data,
		  contentType : 'application/json',
		  success : function(result) {
			if(result == 1) {
				alert("가입신청을 허용했습니다")
			}
	    },
	    error: function(request, status, error) {
	        console.log(request + "/" + status + "/" + error);
	    }
	});	
}

function getCommentList(nowPage) {
	$("#comment_body").empty();

	$.ajax({
	  url: `${Url}/manager/comment?nowPage=${nowPage}${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(comment => {
			
			$('#comment_body').append('<tr>' 
			+ '<td>' + comment.rn + '</td>' 
			+ '<td>' + comment.comment_id + '</td>' 
			+ '<td>' + comment.member_id + '</td>' 
			+ '<td>' + comment.comments + '</td>' 
			+ '<td>' + comment.decl + '</td>'
			+ '<td><button type="button" class="btn btn-link" onclick="blind(this)">블라인드</button></td>'
			+ '</tr>');				
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}
		console.log(total)
		pagination(total, nowPage, 10, 10);
		drawPage('comment');
	});	
}

function blind(btn) {
	var tr = $(btn).parent().parent();
	var td = tr.children();
	var comment_id = td.eq(1).text();
	var member_id = td.eq(2).text();
	var comments = td.eq(3).text();
	const data = JSON.stringify({
		"comment_id" : comment_id,
		"member_id" : member_id,
		"comments" : comments
		});
	$.ajax({
	   url: `${Url}/manager/comment`,
		  type: "put",
		  dataType: "json",
		  data : data,
		  contentType : 'application/json',
		  success : function(result) {
			if(result == 2) {
		      	alert("블라인드 처리하였습니다");				
			} else {
				alert("블라인드 처리하지 못했습니다");
			}
	    },
	    error: function(request, status, error) {
	        console.log(request + "/" + status + "/" + error);
	    }
	});	
}

function goTo(btn) {
	var tr = $(btn).parent().parent();
	var td = tr.children();
	var id = td.eq(2).text();
	var page = tr.attr('class');
	if(page === 'review') {
		location.href = `/project/reviewViewer?reviewId=${id}`;
	} else {
		location.href = `/project/main_paragraph?post_id=${id}`;
	}
	
	
}

function getMemberList(nowPage) {
	$("#member_body").empty();
	$.ajax({
	  url: `${Url}/manager/member?nowPage=${nowPage}&${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(member => {

			$('#member_body').append('<tr class="member_row">' 
			+ '<td>' + member.rn + '</td>' 
			+ '<td>' + member.member_id + '</td>' 
			+ '<td>' + member.member_name + '</td>' 
			+ '<td>' + member.addr1 + '</td>' 
			+ '<td>' + member.email + '</td>'
			+ '</tr>');				
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}

		pagination(total, nowPage, 10, 10);
		drawPage('member');
	});	
}

function getBMemberList(nowPage) {
	console.log(uri);
	$("#Bmember_body").empty();
	$.ajax({
	  url: `${Url}/manager/member?nowPage=${nowPage}&${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(member => {
			$('#Bmember_body').append('<tr>' 
			+ '<td>' + member.rn + '</td>' 
			+ '<td>' + member.member_id + '</td>' 
			+ '<td>' + member.member_name + '</td>' 
			+ '<td>' + member.camp + '</td>' 
			+ '<td>' + (member.permit == 1 ?
			 '완료</td>' :
			 '가입신청</td>'
		 	+ '<td><button type="button" class="btn btn-link" onclick="permitting(this)">허용하기</button></td>')
			+ '</tr>');				
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}

		pagination(total, nowPage, 10, 10);
		drawPage('Bmember');
	});	
}


function deleteCamping(contentId) {
	console.log(contentId);
	$.ajax({
	  url: `${Url}/manager/camp`,
	  type: "DELETE",
	  dataType: "text",
	  data : contentId,
	  success : function(result) {
      	alert("캠핑장 정보를 삭제하였습니다");
      	window.location.reload(true);			
    },
    error: function(request, status, error) {
        console.log(request + "/" + status + "/" + error);
    }
  });
}

function insertCampingInfo() {
	const data = {
	addr1 : addr1,
	addr2 : addr2,
	doNm : sido,
	sigunguNm : sigungu,
	facltNm : siteNm,
	lineIntro : line
	}
	console.log(`${Url}/manager/camp`);
	$.ajax({
	  url: `${Url}/manager/camp`,
	  type: "POST",
	  dataType: "json",
	  data : data,
	  success : function(result) {
      	alert("캠핑장 정보를 추가하였습니다");
      	window.location.reload(true);
    },
    error: function(request, status, error) {
        console.log(request + "/" + status + "/" + error);
    }
  });
}

function getCampingList(nowPage) {
	$("#camp_body").empty();

	$.ajax({
	  url: `${Url}/manager/camp?nowPage=${nowPage}&${uri}`,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach(camping => {
			
			$('#camp_body').append('<tr class="camping_row">' 
			+ '<td>' + camping.rn + '</td>' 
			+ '<td>' + camping.contentId + '</td>' 
			+ '<td>' + camping.facltNm + '</td>' 
			+ '<td>' + camping.rn + '</td>' 
			+ '<td>' + camping.rn + '</td>'
			+ '<td><button type="button" class="btn btn-link" onclick="campingBtn(this)">수정</button>'
			+ '<button type="button" class="btn btn-link" onclick="campingBtn(this)">삭제</button></td>'  
			+ '</tr>');				
		})
		if (res.length > 0) {			
			total = res[0].total
		} else {
			total = 0;
		}
		pagination(total, nowPage, 10, 10);
		drawPage('camping');
	});	
}



// paging
function drawPage(tab) {
	$("#paging").empty();
	$('#paging').append('<li onclick="paging(this)"><a>&lt;&lt;</a></li>')
	$('#paging').append('<li onclick="paging(this)"><a>&lt;</a></li>')
	for(var p = startPage; p <= endPage; ++p) {
		if (p == nowPage) {
			$('#paging').append(`<li class="active" onclick="paging(this)"><a>` + p + '</a></li>')			
		} else {
			$('#paging').append(`<li onclick="paging(this)"><a>` + p + '</a></li>')			
		}
		
	}
	$('#paging').append('<li onclick="paging(this)"><a>&gt;</a></li>')
	$('#paging').append('<li onclick="paging(this)"><a>&gt;&gt;</a></li>')
	$('#paging').removeClass();
	$('#paging').addClass(tab);
}


function paging(li) {
	var page = $('#paging').attr('class');
	if(li.innerText === '<<'){
			selectPage(page, 1);
	} else if (li.innerText === '<') {
		if(startPage != 1) {
			selectPage(page, startPage - 1);
		} else {
			selectPage(page, startPage);
		}
	} else if (li.innerText === '>>') {		
		selectPage(page, lastPage);
	} else if (li.innerText === '>') {
		if(endPage != lastPage) {
			selectPage(page, endPage + 1);
		} else {
			selectPage(page, endPage);
		}
	} else {
		selectPage(page, li.innerText);
	}
}

function selectPage(pgNm, nowPage) {
	console.log(pgNm);
	if(pgNm === 'camping') {
		getCampingList(nowPage);
	} else if (pgNm === 'member') {
		getMemberList(nowPage);
	} else if (pgNm === 'comment') {
		console.log(pgNm);
		getCommentList(nowPage);
	} else if (pgNm === 'Bmember') {
		getBMemberList(nowPage);
	} else if (pgNm === 'sup') {
		getSupList(nowPage);
	} else if (pgNm === 'board') {
		getBoardList(nowPage);
	} else if (pgNm === 'review') {
		getReviewList(nowPage);
	}
}
