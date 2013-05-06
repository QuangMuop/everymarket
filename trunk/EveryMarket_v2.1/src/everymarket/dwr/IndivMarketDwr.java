package everymarket.dwr;

import java.util.ArrayList;
import java.util.List;

import everymarket.dao.MemberDao;
import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;
import everymarket.model.Member;

public class IndivMarketDwr {
	private MemberDao daoM;
	private ProductDao daoP;
	private TradeDao daoT;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	
	public Member getMemberByB_thumb(String b_thumb) {
		return daoM.getMemberByB_thumb(b_thumb);
	}
	
	public String getP_nameByP_id(int p_id){
		return daoP.getP_nameByP_id(p_id);
	}
	
	public String getM_nameByP_id(int p_id){
		return daoT.getM_nameByP_id(p_id);
	}
}
