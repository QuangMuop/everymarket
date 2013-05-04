package everymarket.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;

import everymarket.model.Product;
import everymarket.object4output.BlogProduct;


public class SearchDao {
	
	private SqlMapClientTemplate ibatisTemplate;

	
	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	public List<Product> searchProduct(String search_content){
		return ibatisTemplate.queryForList("searchProduct", search_content);
	}
	
	public int product_count(String search_content){
		return (Integer)ibatisTemplate.queryForObject("product_count", search_content);
	}
	
	public int blog_count(String search_content){
		return (Integer)ibatisTemplate.queryForObject("blog_count", search_content);
	}
	
	public List<BlogProduct> searchBlog(String search_content){
		List<BlogProduct> bplist = ibatisTemplate.queryForList("searchBlog", search_content);
		for(int i=0; i<bplist.size();i++){
			bplist.get(i).setP_img1((String)ibatisTemplate.queryForObject("searchBlog_p1", bplist.get(i).getM_id()));
			bplist.get(i).setP_img2((String)ibatisTemplate.queryForObject("searchBlog_p2", bplist.get(i).getM_id()));
			bplist.get(i).setP_img3((String)ibatisTemplate.queryForObject("searchBlog_p3", bplist.get(i).getM_id()));	
			bplist.get(i).setDg_count((Integer)ibatisTemplate.queryForObject("searchBlog_dg", bplist.get(i).getM_id()));	
			bplist.get(i).setP_count((Integer)ibatisTemplate.queryForObject("searchBlog_p", bplist.get(i).getM_id()));	
			bplist.get(i).setR_count((Integer)ibatisTemplate.queryForObject("searchBlog_r", bplist.get(i).getB_id()));	
		}
	
		return bplist;
	}
	
}
