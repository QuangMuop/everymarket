package everymarket.dwr;

import everymarket.dao.MemberDao;
import everymarket.model.Member;

public class IndivMarketDwr {
	private MemberDao daoM;

	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}

	public Member getMemberByB_thumb(String b_thumb) {
		return daoM.getMemberByB_thumb(b_thumb);
	}
}
