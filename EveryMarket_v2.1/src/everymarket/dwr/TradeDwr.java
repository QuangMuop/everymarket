package everymarket.dwr;

import everymarket.dao.TradeDao;

public class TradeDwr {

	private TradeDao daoT;

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	// 운송번호 입력시에
	public void update_db_nb(int db_nb, int t_id) {
		int t_status = 2;
		daoT.update_db_status(db_nb, t_id, t_status);
	}

	// 배송완료
	public void update_status(int t_id) {
		System.out.println("dd");
		int t_status = 3;
		// trade의 status를 변화시키기
		daoT.update_status(t_id, t_status);

	}

	public void cc() {
		System.out.println("된다?");
	}

}
