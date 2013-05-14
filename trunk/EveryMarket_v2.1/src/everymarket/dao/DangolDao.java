package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Dangol;

public class DangolDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: max(d_id)*/
	public int getMaxD_id(){
		return (Integer)ibatisTemplate.queryForObject("getMaxD_id");
	}
	
	/*Input: Dangol / Output: Dangol*/
	public Dangol checkDangol(Dangol dangol){
		return (Dangol)ibatisTemplate.queryForObject("checkDangol", dangol);
	}
	
	/*Input: m_id / Output: List<Dangol>*/
	public List<String> getDangolB_thumbByM_id(String m_id){
		return ibatisTemplate.queryForList("getDangolB_thumbByM_id", m_id);
	}
	
	/*Input: m_id / Output: count(Dangol)*/
	public int countDangolByM_id(String m_id){ 
		return (Integer)ibatisTemplate.queryForObject("countDangolByM_id", m_id);
	}
	
	/*Input: Dangol*/
	public void registerDangol(Dangol dangol){
		ibatisTemplate.insert("registerDangol", dangol);
	}
	
	/*Input: Dangol*/
	public void deleteDangol(Dangol dangol){
		ibatisTemplate.delete("deleteDangol", dangol);
	}
}
