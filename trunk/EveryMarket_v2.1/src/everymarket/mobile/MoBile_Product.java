package everymarket.mobile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import everymarket.dao.ProductDao;
import everymarket.model.Product;

@Controller
public class MoBile_Product {
	private ProductDao daoP;

	public void setDaoP(ProductDao daoP) {
		this.daoP = daoP;
	}
	
	/*@RequestMapping("/m_getProductList.do")
	public void testAndroidd(HttpServletResponse response){
		System.out.println("[system] 요청들어옴");
		
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
	}*/
	
	@RequestMapping("/Main_ProductList.do")
	public void Main_ProductList(@RequestParam(value="searchtext",required=false)String searchtext, HttpServletResponse response){
		ArrayList<Product> listProduct = new ArrayList<>();
		
		System.out.println("main gogo");
		
		System.out.println(searchtext);
		
		if(!searchtext.equals("")){
			
			listProduct = (ArrayList<Product>)daoP.M_Main_search(searchtext);		
			System.out.println(listProduct.get(0).getM_id() + "라라");
			
		}else{	
		
			listProduct = (ArrayList<Product>)daoP.M_Main_List();
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("MainList", listProduct);
		
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("EUC-KR");
			response.getWriter().write(jsonObject.toString());			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		
		
	}
}
