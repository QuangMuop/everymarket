package everymarket.mobile;

import org.springframework.stereotype.Controller;

import everymarket.dao.ProductDao;

@Controller
public class MoBile_Product {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	
	
}
