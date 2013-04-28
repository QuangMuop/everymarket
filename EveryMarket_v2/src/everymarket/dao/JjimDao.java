package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Jjim;

public class JjimDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Output: max(j_id)*/
	public int getMaxJ_id(){
		int maxJ_id = -1;
		if(ibatisTemplate.queryForObject("getMaxJ_id") != null){
			maxJ_id = (Integer)ibatisTemplate.queryForObject("getMaxJ_id");
		}
		return maxJ_id;
	}
	
	/*Input: Jjim*/
	public void registerJjim(Jjim jjim){
		ibatisTemplate.insert("registerJjim", jjim);
	}
	
	public List<Jjim> getJjimByP_id(int p_id){
		return ibatisTemplate.queryForList("getJjimByP_id", p_id);
	}
	
	public int checkJjim(Jjim jjim){
		return (Integer)ibatisTemplate.queryForObject("checkJjim", jjim);
	}
}
