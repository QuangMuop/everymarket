package everymarket.dao;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.sql.ARRAY;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Trade;

public class TradeDao {

	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	// ���ſ�û �� �ŷ� ���� ����
	public void insertTrade(HashMap map) {
		ibatisTemplate.insert("insertTrade", map);
	}

	// �Ǹ��� ���̵� ������Ʈ
	public void update_t_seller(int p_id) {
		ibatisTemplate.update("update_t_seller", p_id);
	}
	
	//���ſ�û ������ �ŷ����̺��� ���� ����
	public void deleteTrade(int p_id){
		ibatisTemplate.delete("deleteTrade", p_id);
	}

	/* Input: p_id / Output: m_name */
	public String getM_nameByP_id(int p_id) {
		System.out.println(p_id);
		return (String) ibatisTemplate.queryForObject("getM_nameByP_id", p_id);
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

	// ���� ��۹�ȣ �Է� ��¥
	public String db_number_remainday(int t_id) {

		return (String) ibatisTemplate.queryForObject("db_number_remainday",
				t_id);
	}

	// ��۳�¥ ������ �������ֱ�
	public void trade_delete(int t_id) {

		ibatisTemplate.delete("trade_delete", t_id);
	}

	// ��۳�¥�� ���� ��� p_id���ִ��� �˾ƿ���

	/*
	 * public ArrayList get_p_ids(){
	 * 
	 * ArrayList list = new ArrayList();
	 * 
	 * 
	 * 
	 * }
	 */
	
	
	//����Ȯ�� ��������
	public void trade_ok(int t_id){
		
		ibatisTemplate.update("trade_ok", t_id);
	}
	
	
	
	
	
	

	// Ʈ���̵� ��ü �Ѱ� �̾Ƴ���
	public Trade getTrade(int t_id) {
		
		return (Trade) ibatisTemplate.queryForObject("getT_instance", t_id);
	}
	

	

}
