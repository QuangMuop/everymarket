package everymarket.dwr;

import everymarket.dao.BlogDao;

public class IndivMarketDwr {
	private BlogDao daoB;

	public void setDaoB(BlogDao daoB) {
		this.daoB = daoB;
	}
	
	public String getM_idByB_thumb(String b_thumb) {
		return daoB.getM_idByB_thumb(b_thumb);
	}
}
