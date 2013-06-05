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
	 * System.out.println("[system] ��û����");
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
					category = "�Ƿ�";
				} else if (category.equals("Sundries")) {
					category = "��ȭ";
				} else if (category.equals("Leisure")) {
					category = "����";
				} else if (category.equals("Electronicequipment")) {
					category = "�����а���";
				} else if (category.equals("Book/Music")) {
					category = "��������";
				} else if (category.equals("Furniture")) {
					category = "����";
				}
				listProduct = (ArrayList<Product>) daoP
						.M_Main_category(category);

			}

		}
		if (eventname.equals("search")) {
			if (searchtext.equals("pants")) {
				listProduct = daoP.M_Main_search("����");
			} else if (searchtext.equals("neat")) {
				listProduct = daoP.M_Main_search("��Ʈ");
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
