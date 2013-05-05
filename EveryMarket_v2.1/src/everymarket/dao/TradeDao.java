package everymarket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Trade;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
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
	public void update_db_status(int db_nb, int t_id, int t_status) {
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("d_number", db_nb);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_number", map);
	}

	// ��ۿϷ�ÿ� update���ֱ�
	public void update_status(int t_id, int t_status) {
		
		HashMap map = new HashMap();
		map.put("t_status", t_status);
		map.put("t_id", t_id);

		ibatisTemplate.update("update_deliver_ok", map);

	}

}
