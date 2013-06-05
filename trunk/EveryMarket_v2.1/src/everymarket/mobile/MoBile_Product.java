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

	/*
	 * @RequestMapping("/m_getProductList.do") public void
	 * testAndroidd(HttpServletResponse response){
	 * System.out.println("[system] 요청들어옴");
	 * 
	 * List<Product> listProduct = daoP.getProductListById("aa");
	 * 
	 * JSONObject jsonObject = new JSONObject(); jsonObject.put("listProduct",
	 * listProduct);
	 * 
	 * try{ response.setContentType("application/json");
	 * response.setCharacterEncoding("EUC-KR");
	 * response.getWriter().write(jsonObject.toString()); }catch(Exception e){
	 * e.printStackTrace(); } }
	 */

	@RequestMapping("/Main_ProductList.do")
	public void Main_ProductList(
			@RequestParam(value = "searchtext", required = false) String searchtext,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "eventname", required = false) String eventname,
			HttpServletResponse response) {
		List<Product> listProduct = null;

		System.out.println(eventname + "라라");		
		
		if(eventname.equals("category")){
			
			
			
		}
		
		
		if (category.equals("All") && (searchtext.equals(""))) {
			if (searchtext.equals("")) {
				System.out.println("all이면서 검색어없을때");
				listProduct = (ArrayList<Product>) daoP.M_Main_List();
				System.out.println(listProduct.get(0).getP_name() + "요기");
			}

		} if (searchtext.equals("")) {

			System.out.println(searchtext);
			listProduct = daoP.M_Main_search("니트");
			System.out.println("구구");

		}

		else {
			System.out.println("사사");
			if (category.equals("Clothes")) {
				category = "의류";
			} else if (category.equals("Sundries")) {
				category = "잡화";
			} else if (category.equals("Leisure")) {
				category = "레저";
			} else if (category.equals("Electronic equipment")) {
				category = "디지털가전";
			} else if (category.equals("Book/Music")) {
				category = "도서음반";
			} else if (category.equals("Furniture")) {
				category = "가구";
			}

			listProduct = (ArrayList<Product>) daoP.M_Main_category(category);
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
