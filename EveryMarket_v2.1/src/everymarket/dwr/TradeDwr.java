package everymarket.dwr;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.JjimDao;
import everymarket.dao.ProductDao;
import everymarket.dao.ReviewDao;
import everymarket.dao.TradeDao;
import everymarket.model.Member;
import everymarket.model.Product;
import everymarket.model.Review;
import everymarket.model.Trade;

public class TradeDwr {

	private TradeDao daoT;
	private ProductDao daoP;
	private ReviewDao daoR;

	public void setDaoR(ReviewDao daoR) {
		this.daoR = daoR;
	}

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	private JjimDao daoJ;

	public void setDaoJ(JjimDao daoJ) {
		this.daoJ = daoJ;
	}

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

	// ����Ȯ�� ��������
	public void trade_ok(int t_id) {
		daoT.trade_ok(t_id);
	}

	public void trade_product_status(int t_id) {
		daoP.trade_product_status(t_id);
	}

	public String getsession(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Member member = (Member) session.getAttribute("member");
		String m_id = member.getM_id();

		return m_id;
	}

	// ����Ʈ ���Ͽ� �ŷ����� ���� Ȯ���ϱ�
	public int compare_point(@RequestParam("p_id") int p_id,
			@RequestParam("data") String m_id) {

		int member_point = daoT.member_point(m_id);

		int trade_point = daoT.trade_point(m_id);

		int product_price = daoT.product_price(p_id);

		int point = (member_point) - (trade_point + product_price);

		return point;
	}

	// jjimlist���� �����
	public void deletejjim_tr(int p_id) {
		daoJ.deleteJjim_tr(p_id);
	}

	public Trade getTrade(int t_id) {
		return daoT.getTrade(t_id);
	}

	// ���� ���̵�� ���� ���� ��������
	public String getP_name(int p_id) {

		return daoP.getP_nameByP_id(p_id);
	}

	// ���� insert
	public void insert_Review(String r_content,int r_score,int p_id) {
       		  
		daoT.update_status_review(p_id);
		daoR.Insert_review(r_content, r_score, p_id);	
		
	}

}
