package everymarket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		String m_id = (String) ibatisTemplate.queryForObject("getM_idByP_id",
				p_id);
		return ibatisTemplate.queryForList("getRandomProductByM_id", m_id);
	}

	// �˻������� List�ѷ��ֱ�
	public List<Product> ListProduct(String category, int pageNum,
			String searchtext) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("category", category);
		map.put("startPage", pageNum - 4);
		map.put("endPage", pageNum);
		map.put("searchtext", searchtext);
		
		if(category.equals("All")){			
			System.out.println("����??");
			ArrayList<Product> list = (ArrayList) ibatisTemplate.queryForList("listProduct_main", map);
		    System.out.println(list.get(0).getP_id() + "������");
		    System.out.println(list.get(1).getP_id() + "������1");
		    System.out.println(list.get(2).getP_id() + "������2");
			
			return ibatisTemplate.queryForList("listProduct_main", map);
		}else if (searchtext.equals("basic")) {
			System.out.println("����?");
			return ibatisTemplate.queryForList("listProduct", map);
		} else {
			System.out.println("����?");
			return ibatisTemplate.queryForList("listProductSearch", map);
		}

	}

	/*// main���� List�ѷ��ֱ�
	public List<Product> List_MainProduct(int pageNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startPage", pageNum - 4);
		map.put("endPage", pageNum);

		return ibatisTemplate.queryForList("listProduct_main", map);

	}*/

}
