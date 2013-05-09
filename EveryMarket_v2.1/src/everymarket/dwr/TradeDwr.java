package everymarket.dwr;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.ProductDao;
import everymarket.dao.TradeDao;
import everymarket.model.Member;

public class TradeDwr {

	private TradeDao daoT;
	private ProductDao daoP;

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

	// ���� ��۹�ȣ �Է� ��¥ �˷��ֱ�
	public String db_number_remainday(int t_id) {
		return daoT.db_number_remainday(t_id);
	}

	// ��۳�¥ ������ �������ֱ�
	public void trade_delete(int t_id) {

	}

	//����Ȯ�� ��������
	public void trade_ok(int t_id) { 
		daoT.trade_ok(t_id);		
	}
	
	public void trade_product_status(int t_id){
		daoP.trade_product_status(t_id);
	}
	
	public String getsession(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		String m_id = member.getM_id();
		
		return m_id;
	}
	
	//����Ʈ ���Ͽ� �ŷ����� ���� Ȯ���ϱ�
	public int compare_point(@RequestParam("p_id") int p_id, @RequestParam("data") String m_id){
		
		int member_point = daoT.member_point(m_id);
		
 		int trade_point = daoT.trade_point(m_id);
 		
		int product_price = daoT.product_price(p_id);
		
		int point = (member_point)-(trade_point+product_price);

		return point;
	}
    
}
