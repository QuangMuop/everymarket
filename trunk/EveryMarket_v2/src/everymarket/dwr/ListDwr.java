package everymarket.dwr;

import java.util.List;

import everymarket.dao.ListDao;
import everymarket.model.Product;

public class ListDwr {

	private ListDao dao;

	public void setDao(ListDao dao) {
		this.dao = dao;
	}
	
	public List<Product> getList(String category, int pageNum, String searchtext){		

		
		return dao.ListProduct(category, pageNum, searchtext);
	}
	
	
	
	
	
	
	
	
	
	
}
