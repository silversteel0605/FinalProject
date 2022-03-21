package com.spring.project.utill;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVO {
	private int nowPage, startPage, endPage, total, lastPage, start, end, lastPageCnt, limitPage, cntPerPage;
	private int cntPage = 10;
	
	public PagingVO() {
	}
	public PagingVO(int total, int nowPage, int cntPerPage) {
		total = total == 0 ? 1 : total;
		setNowPage(nowPage);
		setTotal(total);
		setCntPerPage(cntPerPage);
		calcLastPage(getTotal());
		setCntPage();
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage());
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public void setCntPage() {
		if ((lastPageCnt = lastPage % cntPage) != 0) {
			limitPage = lastPage - lastPageCnt;
			if(nowPage > limitPage) {
				cntPage = lastPageCnt;
			}
		}
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + "]";
	}
}
