package everymarket.dwr;

import java.util.List;

import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.BoardQna;
import everymarket.model.BoardReport;
import everymarket.model.Member;
import everymarket.model.Product;

public class AdminDwr {
	private BoardQna daoBQ;
	private BoardReport daoBR;
	private MemberDao daoM;
	private ProductDao daoP;

	public void setDaoBQ(BoardQna daoBQ) {
		this.daoBQ = daoBQ;
	}
	public void setDaoBR(BoardReport daoBR) {
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
		return null;
	}
	
	/*�̰� �Ű�� ����Ʈ ���*/
	public List<BoardReport> getUncheckedReportList(){
		return null;
	}
}