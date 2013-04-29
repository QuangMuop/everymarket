package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Category;

public class CategoryDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}
	
	public List<Category> getCategoryList(){
		return ibatisTemplate.queryForList("getCategoryList");
	}
	
	public List CateList(String category) {
		return ibatisTemplate.queryForList("listCategory", category);
	}
}
