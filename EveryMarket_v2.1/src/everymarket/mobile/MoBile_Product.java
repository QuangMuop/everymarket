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

		

		if (eventname.equals("category")) {
			if (category.equals("All")) {
			
				listProduct = (ArrayList<Product>) daoP.M_Main_List();
			} else {
			
				if (category.equals("Clothes")) {
					category = "의류";
				} else if (category.equals("Sundries")) {
					category = "잡화";
				} else if (category.equals("Leisure")) {
					category = "레저";
				} else if (category.equals("Electronicequipment")) {
					category = "디지털가전";
				} else if (category.equals("Book/Music")) {
					category = "도서음반";
				} else if (category.equals("Furniture")) {
					category = "가구";
				}
				listProduct = (ArrayList<Product>) daoP
						.M_Main_category(category);

			}

		}
		if (eventname.equals("search")) {
			if (searchtext.equals("pants")) {
				listProduct = daoP.M_Main_search("바지");
			} else if (searchtext.equals("neat")) {
				listProduct = daoP.M_Main_search("니트");
			}

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
