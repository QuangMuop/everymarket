package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Dangol;

public class DangolDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id / Output: List<Dangol>*/
	public List<String> getDangolB_thumbByM_id(String m_id){
		return ibatisTemplate.queryForList("getDangolB_thumbByM_id", m_id);
	}
}
