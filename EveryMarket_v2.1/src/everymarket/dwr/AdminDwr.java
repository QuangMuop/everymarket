package everymarket.dwr;

import java.util.List;

import everymarket.dao.BoardQnaDao;
import everymarket.dao.BoardReportDao;
import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.BoardQna;
import everymarket.model.BoardReport;
import everymarket.model.Member;
import everymarket.model.Product;

public class AdminDwr {
	private BoardQnaDao daoBQ;
	private BoardReportDao daoBR;
	private MemberDao daoM;
	private ProductDao daoP;

	public void setDaoBQ(BoardQnaDao daoBQ) {
		this.daoBQ = daoBQ;
	}
	public void setDaoBR(BoardReportDao daoBR) {
		this.daoBR = daoBR;
	}
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}	
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	/*모든 회원 리스트 출력*/
	public List<Member> getMemberList(){
		return daoM.getMemberList();
	}
	
	/*신고횟수가 일정 이상인 상품 리스트 출력*/
	public List<Product> getReportedProduct(){
		return daoP.getReportedProduct();
	}
	
	/*QnA게시판 게시글 리스트 출력*/
	public List<BoardQna> getQnaList(){
		return daoBQ.getQnaList();
	}
	
	/*미결 신고글 리스트 출력*/
	public List<BoardReport> getUncheckedReportList(){
		return daoBR.getUncheckedReportList();
	}
}