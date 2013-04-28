package everymarket.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import everymarket.model.Product;

public class ListDao {
	private SqlMapClientTemplate ibatisTemplate;

	public void setIbatisTemplate(SqlMapClientTemplate ibatisTemplate) {
		this.ibatisTemplate = ibatisTemplate;
	}

	// 검색했을시 List뿌려주기
	public List<Product> ListProduct(String category, int pageNum, String searchtext) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("category", category);
		map.put("startPage", pageNum - 4);
		map.put("endPage", pageNum);
		map.put("searchtext", searchtext);

		if (searchtext.equals("basic")) {
			return ibatisTemplate.queryForList("listProduct", map);
		} else {
			return ibatisTemplate.queryForList("listProductSearch", map);
		}

	}

	public List CateList(String category) {
		return ibatisTemplate.queryForList("listCategory", category);
	}

}