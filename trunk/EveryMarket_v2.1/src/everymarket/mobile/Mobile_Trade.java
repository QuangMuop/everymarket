package everymarket.mobile;

import org.springframework.stereotype.Controller;

import everymarket.dao.TradeDao;

@Controller
public class Mobile_Trade {
	private TradeDao daoT;

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}
	
	
}
