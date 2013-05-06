package everymarket.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Trade;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	
	//���ſ�û �� �ŷ� ���� ����
	public void insertTrade(HashMap map){
		ibatisTemplate.insert("insertTrade", map);	
	}
	
	//�Ǹ��� ���̵� ������Ʈ
	public void update_t_seller(int p_id){
		ibatisTemplate.update("update_t_seller", p_id);
	}

	
	/*Input: p_id / Output: m_name*/
	public String getM_nameByP_id(int p_id){
		System.out.println(p_id);
		return (String)ibatisTemplate.queryForObject("getM_nameByP_id", p_id);
	}


	// �ŷ����� ���� ��������
	public List<Trade> getBuyingTrade(String m_id) {
		return ibatisTemplate.queryForList("getBuyingTrade", m_id);
	}

	public List<Trade> getSellingTrade(String m_id) {
		return ibatisTemplate.queryForList("getSellingTrade", m_id);
	}

	// Dwr�� �޼���
	// ��۹�ȣ�ְ� status�ٲٱ�
	public String update_db_status(int db_nb, int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("d_number", db_nb);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_number", map);
		
		return "redirect:/trade_list.do";
	}

	// ��ۿϷ�ÿ� update���ֱ�
	public void update_status(int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_ok", map);
	}
}
