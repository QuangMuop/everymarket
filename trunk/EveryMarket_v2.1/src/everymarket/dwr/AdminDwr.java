package everymarket.dwr;

import java.util.List;

import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.model.Member;
import everymarket.model.Product;

public class AdminDwr {
	private MemberDao daoM;
	private ProductDao daoP;

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
}