package everymarket.dao;

import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class BanListDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id, day*/
	public void registerBan(Map<String, Object> paramMap){
		ibatisTemplate.insert("registerBan", paramMap);
	}
}
