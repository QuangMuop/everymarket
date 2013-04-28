package everymarket.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Product;

public class ProductDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	/*Output: max(p_id)*/
	public int getMaxP_id(){
		return (Integer)ibatisTemplate.queryForObject("getMaxP_id");
	}
	
	/*Input: Product*/
	public void registerProduct(Product product){
		ibatisTemplate.insert("registerProduct", product);
	}
	
	/*Input: p_id / Output: Product*/ 
	public Product getProductById(int p_id){
		return (Product)ibatisTemplate.queryForObject("getProductById", p_id);
	}
	
	/*Input: m_id / Output: List<Product>*/ 
	public List<Product> getProductListById(String m_id){
		return ibatisTemplate.queryForList("getProductListById", m_id);
	}
	
	/*Input: p_id / Output: List<Product>*/
	public List<Product> getRandomProductByP_id(int p_id){
		String m_id = (String)ibatisTemplate.queryForObject("getM_idByP_id", p_id);
		return ibatisTemplate.queryForList("getRandomProductByM_id", m_id);
	}
}
