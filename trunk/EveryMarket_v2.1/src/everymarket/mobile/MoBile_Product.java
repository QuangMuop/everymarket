package everymarket.mobile;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

@Controller
public class MoBile_Product {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	@RequestMapping("/m_getProductList.do")
	public void testAndroidd(HttpServletResponse response){
		System.out.println("[system] ¿äÃ»µé¾î¿È");
		
		List<Product> listProduct = daoP.getProductListById("aa");
				
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("listProduct", listProduct);
		
		try{
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
