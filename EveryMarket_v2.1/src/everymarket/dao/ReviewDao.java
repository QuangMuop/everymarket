package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Review;

public class ReviewDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id / Output: sum(r_score)*/
	public int getScoreSumByM_id(String m_id){
		return (Integer)ibatisTemplate.queryForObject("getScoreSumByM_id", m_id);
	}
	
	/*Input: m_id / Output: count(Review)*/
	public int countReviewByM_id(String m_id){
		return (Integer)ibatisTemplate.queryForObject("countReviewByM_id", m_id);
	}
	
	/*Input: m_id / Output: List<Review>*/
	public List<Review> getReviewListByM_id(String m_id){
		return ibatisTemplate.queryForList("getReviewListByM_id", m_id);
	}
}
