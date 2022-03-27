var nowPage, startPage, endPage, total, lastPage, start, end, lastPageCnt, limitPage, cntPerPage, cntPage;


function pagination(total, nowPage, cntPerPage, cntPage) {
	this.total = total == 0 ? 1 : total;
	this.nowPage = nowPage;
	this.cntPerPage = cntPerPage;
	this.cntPage = cntPage;
	calcLastPage(total);
	setCntPage();
	calcStartEndPage(nowPage);
	calcStartEnd(nowPage);
}

function calcLastPage(total) {
	lastPage = Math.ceil(parseInt(total) / parseInt(cntPerPage));
}


function calcStartEndPage(nowPage) {
	endPage = Math.ceil(nowPage / this.cntPage) * this.cntPage;
	if(lastPage < endPage) {
		endPage = lastPage
	}
	startPage = endPage - cntPage + 1
	if(startPage < 1) {
		startPage = 1;
	}
}

function calcStartEnd(nowPage) {
	end = nowPage * cntPerPage;
	start = end - cntPerPage + 1;
}

function setCntPage() {
	if ((lastPageCnt = lastPage % cntPage) != 0) {
		limitPage = lastPage - lastPageCnt;
		if(nowPage > limitPage) {
			cntPage = lastPageCnt;
		} else {
			cntPage = 10;
		}
	}
}




