package everymarket.dwr;

import everymarket.dao.TradeDao;

public class TradeDwr {

	private TradeDao daoT;

	public void setDaoT(TradeDao daoT) {
		this.daoT = daoT;
	}

	// ��۹�ȣ �Է½ÿ�
	public void update_db_nb(int db_nb, int t_id) {
		int t_status = 2;
		daoT.update_db_status(db_nb, t_id, t_status);
	}

	// ��ۿϷ�
	public void update_status(int t_id) {
		int t_status = 3;
		// trade�� status�� ��ȭ��Ű��
		daoT.update_status(t_id, t_status);

	}	    
	//���� ��۹�ȣ �Է� ��¥ �˷��ֱ� 
	public String db_number_remainday(int t_id) {
		return daoT.db_number_remainday(t_id);
	}
	
	//��۳�¥ ������ �������ֱ�
	public void trade_delete(int t_id){
		
		
	}

}
