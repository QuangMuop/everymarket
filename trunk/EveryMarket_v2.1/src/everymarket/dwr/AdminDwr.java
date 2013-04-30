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
	
	/*��� ȸ�� ����Ʈ ���*/
	public List<Member> getMemberList(){
		return daoM.getMemberList();
	}
	
	/*�Ű�Ƚ���� ���� �̻��� ��ǰ ����Ʈ ���*/
	public List<Product> getReportedProduct(){
		return daoP.getReportedProduct();
	}
	
	/*QnA�Խ��� �Խñ� ����Ʈ ���*/
	public List<BoardQna> getQnaList(){
		return daoBQ.getQnaList();
	}
	
	/*�̰� �Ű�� ����Ʈ ���*/
	public List<BoardReport> getUncheckedReportList(){
		return daoBR.getUncheckedReportList();
	}
}