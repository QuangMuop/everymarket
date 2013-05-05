package everymarket.dao;

import java.util.List;
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
	public void updateB_main(Blog blog){
		ibatisTemplate.update("updateB_main", blog);
	}
	
	/*Input: Blog*/
	public void updateB_thumb(Blog blog){
		ibatisTemplate.update("updateB_thumb", blog);
	}
	
	/*Input: Blog*/
	public void updateB_map(Blog blog){
		ibatisTemplate.update("updateB_map", blog);
	}
	
	/*Input: Blog*/
	public void updateB_content(Blog blog){
		ibatisTemplate.update("updateB_content", blog);
	}
	
	public List<Blog> getBlogList(){
		System.out.println(ibatisTemplate.queryForList("getBlogList"));
		return ibatisTemplate.queryForList("getBlogList");
	}
}
