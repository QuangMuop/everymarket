package everymarket.dao;

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

	/* Output: List<Product>(p_report > 3) */
	public List<Product> getReportedProduct() {
		return ibatisTemplate.queryForList("getReportedProduct");
	}

	/* Input: m_id / Output: List<Product> */
	public List<Product> getRecentProductByM_id(String m_id) {
		return ibatisTemplate.queryForList("getRecentProductByM_id", m_id);
	}

	/* Input: Product */
	public void registerProduct(Product product) {
		ibatisTemplate.insert("registerProduct", product);
	}

	/* Input: Product */
	public void modifyProduct(Product product) {
		ibatisTemplate.update("modifyProduct", product);
	}

	/* Input: p_id / Output: Product */
	public Product getProductByP_id(int p_id) {
		return (Product) ibatisTemplate
				.queryForObject("getProductByP_id", p_id);
	}

	/* Input: m_id / Output: List<Product> */
	public List<Product> getProductListById(String m_id) {
		return ibatisTemplate.queryForList("getProductListById", m_id);
	}

	/* Input: p_id / Output: p_name */
	public String getP_nameByP_id(int p_id) {
		return (String) ibatisTemplate.queryForObject("getP_nameByP_id", p_id);
	}

	/* Input: p_id / Output: List<Product> */
	public List<Product> getRandomProductByP_id(int p_id) {
		String m_id = (String) ibatisTemplate.queryForObject("getM_idByP_id",
				p_id);
		return ibatisTemplate.queryForList("getRandomProductByM_id", m_id);
	}

	/*Input: p_id / Output: boolean*/
	public boolean checkP_status(int p_id){
		String result = (String)ibatisTemplate.queryForObject("checkP_status", p_id);
		if(result.equals("n")){
			return false;
		}else{
			return true;
		}
	}
	
	/* Input: Map(m_id, p_id) / Output: boolean */
	public boolean checkOwn(Map<String, Object> paramMap) {
		int result = (Integer)ibatisTemplate.queryForObject("checkOwn", paramMap);
		if (result == 0) {
			return false;
		} else {
			return true;
		}
	}

	// 검색했을시 List뿌려주기
	public List<Product> ListProduct(String category, int pageNum,
			String searchtext) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("category", category);
		map.put("startPage", pageNum - 4);
		map.put("endPage", pageNum);
		map.put("searchtext", searchtext);

		if (category.equals("All")) {

			return ibatisTemplate.queryForList("listProduct_main", map);
		} else if (searchtext.equals("basic")) {

			return ibatisTemplate.queryForList("listProduct", map);
		} else {

			return ibatisTemplate.queryForList("listProductSearch", map);
		}
	}

	public void trade_status_update(HashMap map) {
		ibatisTemplate.update("trade_stauts_update", map);
	}

	
	//최종적으로 거래 완료시 product status를 'y'로 바꿔주는 것
	public void trade_product_status(int t_id) {

			/*ibatisTemplate.update("trade_product_status", t_id);*/
	}
	
	public Product getProduct_min(){
		
		List<Product> list = ibatisTemplate.queryForList("getProduct_min");
		
		return list.get(0);
	}
	
	//이거다
	public int get_p_id(int t_id){		   
	  return (Integer)ibatisTemplate.queryForObject("get_p_id", t_id);
	}

	public void update_product_st(int p_id) {
		ibatisTemplate.update("update_product_st", p_id);		
	}
	
	//신고된 물품 업데이트
	public void update_product_report(int p_id){
		ibatisTemplate.update("update_product_report", p_id);
		ibatisTemplate.update("update_trade_report", p_id);
	}
	

	//Mobile 메인 product list
	public List<Product> M_Main_List(){
		HashMap<String, Integer> map = new HashMap<>();	
		
		map.put("startPage", 5);
		map.put("endPage", 12);
		
		return ibatisTemplate.queryForList("listProduct_main", map);	
	}
	
	//검색어가 있을때
	public List<Product> M_Main_search(String searchtext){
		
		
		return ibatisTemplate.queryForList("searchProduct", searchtext);		
		
	}
	
	
	

}
