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
	
	/*모든 회원 리스트 출력*/
	public List<Member> getMemberList(){
		return daoM.getMemberList();
	}
	
	/*신고횟수가 일정 이상인 상품 리스트 출력*/
	public List<Product> getReportedProduct(){
		return daoP.getReportedProduct();
	}
}