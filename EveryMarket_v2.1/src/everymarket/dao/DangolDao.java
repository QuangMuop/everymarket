package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class DangolDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id / Output: List<Dangol>*/
	public List<String> getDangolB_thumbByM_id(String m_id){
		return ibatisTemplate.queryForList("getDangolB_thumbByM_id", m_id);
	}
	
	/*Input: m_id / Output: count(Dangol)*/
	public int countDangolByM_id(String m_id){ 
		return (Integer)ibatisTemplate.queryForObject("countDangolByM_id", m_id);
	}
}
