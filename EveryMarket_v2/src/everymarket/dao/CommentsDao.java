package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Comments;

public class CommentsDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	public int getMaxC_id(){
		int maxC_id = -1;
		if(ibatisTemplate.queryForObject("getMaxC_id") != null){
			maxC_id = (Integer)ibatisTemplate.queryForObject("getMaxC_id");
		}
		return maxC_id;
	}
	
	public void registerComments(Comments comments){
		ibatisTemplate.insert("registerComments", comments);
	}
	
	public List<Comments> getCommentsByP_id(int p_id){
		return ibatisTemplate.queryForList("getCommentsByP_id", p_id);
	}
}
