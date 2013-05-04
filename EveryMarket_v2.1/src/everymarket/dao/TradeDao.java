package everymarket.dao;

import java.util.ArrayList;
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
	
	public List<Trade> getSellingTrade(String m_id){
		return ibatisTemplate.queryForList("getSellingTrade", m_id);
	}
	

}
