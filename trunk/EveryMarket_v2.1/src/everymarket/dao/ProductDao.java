package everymarket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Product;

public class ProductDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	/* Output: max(p_id) */
	public int getMaxP_id() {
		return (Integer) ibatisTemplate.queryForObject("getMaxP_id");
	}
	
	/*Output: List<Product>(p_report > 3)*/
	public List<Product> getReportedProduct(){
		return ibatisTemplate.queryForList("getReportedProduct");
	}

	/* Input: Product */
	public void registerProduct(Product product) {
		ibatisTemplate.insert("registerProduct", product);
	}

	/* Input: p_id / Output: Product */
	public Product getProductById(int p_id) {
		return (Product) ibatisTemplate.queryForObject("getProductById", p_id);
	}

	/* Input: m_id / Output: List<Product> */
	public List<Product> getProductListById(String m_id) {
		return ibatisTemplate.queryForList("getProductListById", m_id);
	}

	/* Input: p_id / Output: List<Product> */
	public List<Product> getRandomProductByP_id(int p_id) {
		String m_id = (String) ibatisTemplate.queryForObject("getM_idByP_id", p_id);
		return ibatisTemplate.queryForList("getRandomProductByM_id", m_id);
	}
	
	/*Input: Map(m_id, p_id) / Output: boolean*/
	public boolean checkOwn(Map<String, Object> paramMap) {
		int result = (Integer)ibatisTemplate.queryForObject("checkOwn", paramMap);
		if(result == 0){ 
			return false; 
		}else{ 
			return true; 
		}
	}

	// 검색했을시 List뿌려주기
	public List<Product> ListProduct(String category, int pageNum, String searchtext) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("category", category);
		map.put("startPage", pageNum - 4);
		map.put("endPage", pageNum);
		map.put("searchtext", searchtext);
		
		if(category.equals("All")){			
			ArrayList<Product> list = (ArrayList) ibatisTemplate.queryForList("listProduct_main", map);
			return ibatisTemplate.queryForList("listProduct_main", map);
		}else if (searchtext.equals("basic")) {
			System.out.println("난가?");
			return ibatisTemplate.queryForList("listProduct", map);
		} else {
			System.out.println("나야?");
			return ibatisTemplate.queryForList("listProductSearch", map);
		}
	}
}
