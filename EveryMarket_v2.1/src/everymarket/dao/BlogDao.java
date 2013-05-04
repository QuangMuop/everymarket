package everymarket.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Blog;

public class BlogDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	/*Input: m_id / Output: b_thumb*/
	public String getB_thumbByM_id(String m_id){
		return (String)ibatisTemplate.queryForObject("getB_thumbByM_id", m_id);
	}
	
	/*Input: m_id / Output: Blog*/ 
	public Blog getBlogByM_id(String m_id){
		return (Blog)ibatisTemplate.queryForObject("getBlogByM_id", m_id);
	}
	
	/*Input: p_id / Output: Blog*/
	public Blog getBlogByP_id(int p_id){
		return (Blog)ibatisTemplate.queryForObject("getBlogByP_id", p_id);
	}
	
	/*Input: Blog*/
	public void updateBlog(Map<String, Object> paramMap){
		ibatisTemplate.update("updateBlog", paramMap);
	}
}
