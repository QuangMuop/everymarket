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

	// 운송번호 입력시에
	public void update_db_nb(int db_nb, int t_id) {
		int t_status = 2;
		daoT.update_db_status(db_nb, t_id, t_status);
	}

	// 배송완료
	public void update_status(int t_id) {
		int t_status = 3;
		// trade의 status를 변화시키기
		daoT.update_status(t_id, t_status);

	}

	// 남은 운송번호 입력 날짜 알려주기
	public String db_number_remainday(int t_id) {
		return daoT.db_number_remainday(t_id);
	}

	// 운송날짜 지난거 삭제해주기
	public void trade_delete(int t_id) {

	}

	//수취확인 눌렀을떄
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
	
	//포인트 비교하여 거래가능 여부 확인하기
	public int compare_point(@RequestParam("p_id") int p_id, @RequestParam("data") String m_id){
		
		int member_point = daoT.member_point(m_id);
		
 		int trade_point = daoT.trade_point(m_id);
 		
		int product_price = daoT.product_price(p_id);
		
		int point = (member_point)-(trade_point+product_price);

		return point;
	}
    
}
