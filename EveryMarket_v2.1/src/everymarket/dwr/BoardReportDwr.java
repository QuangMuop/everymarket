package everymarket.dwr;

import everymarket.dao.BoardReportDao;

public class BoardReportDwr {
	private BoardReportDao daoBR;

	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	
	public void test(String memberId, String actionCode){
		System.out.println("������̵�:" + memberId + " / " + "�Ű�ó��:" + actionCode);
	}
}
