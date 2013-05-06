package everymarket.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.servlet.ModelAndView;

import everymarket.model.Trade;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: p_id / Output: m_name*/
	public String getM_nameByP_id(int p_id){
		return (String)ibatisTemplate.queryForObject("getM_nameByP_id", p_id);
	}

	// 거래중인 물건 가져오기
	public List<Trade> getBuyingTrade(String m_id) {
		return ibatisTemplate.queryForList("getBuyingTrade", m_id);
	}

	public List<Trade> getSellingTrade(String m_id) {
		return ibatisTemplate.queryForList("getSellingTrade", m_id);
	}

	// Dwr용 메서드
	// 운송번호넣고 status바꾸기
	public String update_db_status(int db_nb, int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("d_number", db_nb);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_number", map);
		
		return "redirect:/trade_list.do";
	}

	// 배송완료시에 update해주기
	public void update_status(int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_ok", map);
	}
}
