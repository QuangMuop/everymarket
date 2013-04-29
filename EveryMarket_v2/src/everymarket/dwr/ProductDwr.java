package everymarket.dwr;

import java.util.List;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

public class ProductDwr {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}

	public List<Product> getList(String category, int pageNum, String searchtext) {

		return daoP.ListProduct(category, pageNum, searchtext);
	}

}
