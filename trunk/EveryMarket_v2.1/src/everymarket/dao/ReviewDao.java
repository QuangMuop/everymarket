package everymarket.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ReviewDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id / Output: count(Review)*/
	public int countReviewByM_id(String m_id){
		return (Integer)ibatisTemplate.queryForObject("countReviewByM_id", m_id);
	}
}
