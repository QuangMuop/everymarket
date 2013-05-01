package everymarket.dwr;

import everymarket.dao.BoardReportDao;

public class BoardReportDwr {
	private BoardReportDao daoBR;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	
	public void test(String memberId, String actionCode){
		System.out.println("멤버아이디:" + memberId + " / " + "신고처리:" + actionCode);
	}
}
